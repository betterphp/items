include<card_lib.scad>;

linear_extrude(height = face_thickness - 1)
offset(r = -0.25) {
    projection(cut = true)
    scale(1.6)
    import("christmas_tree.stl");
}
