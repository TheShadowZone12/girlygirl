girl_tree={
        axiom="",
        trunk="girlygirl:tree",
        leaves="girlygirl:leaves",
        angle=30,
        iterations=0,
        random_level=3,
        trunk_type="single",
        thin_branches=true,
}
 
local trunks_stub = "FFFFF"
local axiom_stub = "[F&F][&^^^^F][&////F][GGf&&&GG&&&Gffff&&&G+++G&&&Gffff][GGG///&&&GG&&&GGfff&&&G+++G&&&GGfff][GGG//////&&&GG&&&GGfff&&&G+++G&&&Gffff][GGG/////////&&&GG&&&GGfff&&&G+++G&&&Gffff]"
 
minetest.register_abm({
        nodenames = {"girlygirl:sapling"},
        interval = 1,--10,
        chance = 1,--35,
        action = function(pos, node)
                minetest.add_node(pos, {name = "air"} )
                girl_tree.axiom = string.sub("TTTT"..trunks_stub, 1, math.random(4, 14))..axiom_stub
                girl_tree.iterations = math.random(1, 5)
                minetest.spawn_tree(pos, girl_tree)
        end
})
