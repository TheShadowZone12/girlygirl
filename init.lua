



























local cylbox = {}
local detail = 16
local sehne
for i = 1, detail-1 do
	sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
	cylbox[i]={(i/detail)-0.5, -0.5, -sehne, (i/detail)+(1/detail)-0.5, 0.5, sehne}
end

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

dofile(minetest.get_modpath("girlygirl").."/chest.lua")
dofile(minetest.get_modpath("girlygirl").."/craft.lua")
dofile(minetest.get_modpath("girlygirl").."/tools.lua")
dofile(minetest.get_modpath("girlygirl").."/tree.lua")

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------

minetest.register_node("girlygirl:magenta_block", {
	description = "Girly Magenta Block",
	tiles = {"girlygirl_magenta.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("girlygirl:stonebrick", {
	description = "Stone Brick",
	tiles = {"girlygirl_stone_brick.png"},
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("girlygirl:sand", {
	description = "Sand",
	tiles = {"girlygirl_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("girlygirl:brick", {
	description = "Brick Block",
	tiles = {"girlygirl_brick.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("girlygirl:tree", {
	description = "Tree",
	tiles = {"girlygirl_tree_top.png", "girlygirl_tree_top.png", "girlygirl_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	paramtype = "light",
	drawtype = "nodebox",		
	selection_box = {
		type = "fixed",
		fixed = cylbox,
	},
	node_box = {
		type = "fixed",
		fixed = cylbox,
	},
})

minetest.register_node("girlygirl:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"girlygirl_leaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'girlygirl:sapling'},
				rarity = 5,
			},
			{
				items = {'girlygirl:leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("girlygirl:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"girlygirl_sapling.png"},
	inventory_image = "girlygirl_sapling.png",
	wield_image = "girlygirl_sapling.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})


minetest.register_node("girlygirl:cactus", {
	description = "Cactus",
	drawtype = "nodebox",
	tiles = {"girlygirl_cactus_top.png", "girlygirl_cactus_top.png", "girlygirl_cactus_side.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = cylbox,
	},
	node_box = {
		type = "fixed",
		fixed = cylbox,
	},
	groups = {snappy=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_abm({
	nodenames = {"girlygirl:cactus"},
	neighbors = {"group:sand"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if minetest.get_item_group(name, "sand") ~= 0 then
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "girlygirl:cactus" and height < 10 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="girlygirl:cactus"})
				end
			end
		end
	end,
})

minetest.register_node("girlygirl:fence_wood", {
	description = "Wooden Fence",
	drawtype = "fencelike",
	tiles = {"girlygirl_wood.png"},
	inventory_image = "girlygirl_fence.png",
	wield_image = "girlygirl_fence.png",
	paramtype = "light",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("girlygirl:ladder", {
	description = "Ladder",
	drawtype = "signlike",
	tiles = {"girlygirl_ladder.png"},
	inventory_image = "girlygirl_ladder.png",
	wield_image = "girlygirl_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("girlygirl:wood", {
	description = "Wooden Planks",
	tiles = {"girlygirl_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("girlygirl:cobble", {
	description = "Cobblestone",
	tiles = {"girlygirl_cobble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})



