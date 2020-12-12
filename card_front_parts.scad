include<card_lib.scad>;

linear_extrude(height = 2)
offset(r = -0.25) {
    projection(cut = true)
    scale(1.6)
    import("christmas_tree.stl");
}
