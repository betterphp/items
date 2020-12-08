include<card_lib.scad>;

$fa = 6;
$fs = 0.875;

// Card front
translate([-105, -90, 0]) {
    difference() {
        card_face();

        translate([50, 80, 1])
        scale(1.6)
        import("christmas_tree.stl");
    }
}

// Card back
translate([5, -90, 0]) {
    difference() {
        card_face();

        translate([0, 0, 1.001]) {
            render_text();
        }
    }
}
