include<card_lib.scad>;

$fa = 6;
$fs = 0.875;

// Card back
difference() {
    card_face();

    translate([0, 0, face_thickness - 1 + 0.001]) {
        linear_extrude(height = 1) {
            render_text();
        }
    }
}
