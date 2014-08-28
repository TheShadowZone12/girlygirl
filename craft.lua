minetest.register_craftitem("girlygirl:girlystick", {
	description = "Girly Stick",
	inventory_image = "girlygirl_stick.png",
})

minetest.register_craft({
	output = 'girlygirl:girlystick 2',
	recipe = {
		{'default:stick'},
		{'dye:magenta'},
		{'default:stick'},
	}
})


minetest.register_craft({
	output = 'girlygirl:wood 8',
	recipe = {
		{'girlygirl:tree'},
	}
})

minetest.register_craft({
	output = 'girlygirl:pick',
	recipe = {
		{'default:pick_diamond'},
		{'girlygirl:stick'},
	}
})

minetest.register_craft({
        output = 'girlygirl:stonebrick',
        recipe = {
                 {'default:stonebrick'},
                 {'girlygirl:girlystick'}, 
         }
})

minetest.register_craft({
        output = 'girlygirl:chest',
        recipe = {
                 {'default:chest'},
                 {'girlygirl:girlystick'},
         }
})

minetest.register_craft({
        output = 'girlygirl:chest_locked',
        recipe = {
                 {'default:chest_locked'},
                 {'girlygirl:girlystick'},
         }
})

minetest.register_craft({
        output = 'girlygirl:cobble',
        recipe = {
                 {'default:cobble'},
                 {'girlygirl:girlystick'},
         }
})

minetest.register_craft({
        output = 'girlygirl:tree',
        recipe = {
                 {'default:tree'},
                 {'girlygirl:girlystick'},
         }
})

minetest.register_craft({
        output = 'girlygirl:leaves',
        recipe = {
                 {'default:leaves'},
                 {'girlygirl:girlystick'},
         }
})


minetest.register_craft({
        output = 'girlygirl:sand',
        recipe = {
                 {'default:sand'},
                 {'girlygirl:girlystick'},
        }
})

minetest.register_craft({
        output = 'girlygirl:brick',
        recipe = {
                 {'default:brick'},
                 {'girlygirl:girlystick'},
        }
})

minetest.register_craft({
        output = 'girlygirl:magenta_block',
        recipe = {
                 {'plasticbox:plasticbox'},
                 {'girlygirl:girlystick'},
        }
})
