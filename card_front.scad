include<card_lib.scad>;

$fa = 6;
$fs = 0.875;

// Card front
difference() {
    card_face();

    translate([50, 80, 1])
    scale(1.6)
    import("christmas_tree.stl");
}
