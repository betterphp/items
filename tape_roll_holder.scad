$fa = 1;
$fs = 1.75 / 2;

diameter = 75;
width = 22;
peg_length = 8;
peg_diameter = 4.5;

// This is designed to be printed in two parts and glued together. To avoid
// having to use supports.
side_width = width / 2;

difference() {
    cylinder(r = diameter / 2, h = side_width);

    union() {
        offset = diameter / 3.5;

        translate([offset, 0, -0.01])
        cylinder(r = diameter / 6, h = width + 0.02);

        translate([0, offset, -0.01])
        cylinder(r = diameter / 6, h = width + 0.02);

        translate([-offset, 0, -0.01])
        cylinder(r = diameter / 6, h = width + 0.02);

        translate([0, -offset, -0.01])
        cylinder(r = diameter / 6, h = width + 0.02);
    }
}

translate([0, 0, side_width])
cylinder(r = peg_diameter / 2, h = peg_length);
