include<card_lib.scad>;

linear_extrude(height = face_thickness - 1) {
    // Needs to be a bit smaller to fit in the cutout
    offset(r = -tolerance) {
        projection(cut = true)
        scale(1.6)
        import("christmas_tree.stl");
    }
}
