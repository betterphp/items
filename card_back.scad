include<card_lib.scad>;

$fa = 6;
$fs = 0.875;

// Card back
difference() {
    card_face();

    translate([0, 0, 1.001]) {
        render_text();
    }
}
