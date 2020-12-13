include<card_lib.scad>;

$fa = 6;
$fs = 0.875;

// Card back
difference() {
    card_face();

    translate([face_thickness, face_thickness, 1])
    cube([
        card_width - 2 * face_thickness,
        card_height - 2 * face_thickness,
        face_thickness
    ]);
}
