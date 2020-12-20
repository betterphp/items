include<card_lib.scad>;

$fa = 6;
$fs = 0.875;

// Card back
union() {
    card_face();

    translate([-1, 0, 0])
    cube([1, card_height, 2 * face_thickness + tolerance]);
}
