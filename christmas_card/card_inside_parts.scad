include<card_lib.scad>;

union() {
    translate([face_thickness, face_thickness, 1])
    linear_extrude(height = 1) {
        // Needs to be a bit smaller to fit
        offset(r = -tolerance) {
            square([
                card_width - 2 * face_thickness,
                card_height - 2 * face_thickness,
            ]);
        }
    }

    translate([0, 0, 1])
    linear_extrude(height = face_thickness - 1) {
        render_text();
    }
}
