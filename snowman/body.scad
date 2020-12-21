include<lib.scad>;

// Bottom ball
union() {
    difference() {
        translate([30, 30, 20])
        sphere(r = 30);

        translate([0, 0, -10])
        cube([60, 60, 10]);

        translate([0, 0, 45])
        cube([60, 60, 10]);
    }

    translate([30, 30, 45])
    cylinder(r = 5, h = 9);
}

// Middle ball
translate([60, 0, 0])
union() {
    difference() {
        translate([30, 30, 20])
        sphere(r = 25);

        translate([0, 0, -10])
        cube([60, 60, 10]);

        translate([0, 0, 42.5])
        cube([60, 60, 10]);

        translate([30, 30, -0.001])
        cylinder(r = 5.5, h = 10);

        translate([5, 30, 30])
        rotate([0, 90, 0])
        cylinder(r = 2, h = 15);

        translate([40, 30, 30])
        rotate([0, 90, 0])
        cylinder(r = 2, h = 15);
    }

    translate([30, 30, 42.5])
    cylinder(r = 5, h = 9);
}

// Head
translate([110, 0, 0])
union() {
    difference() {
        translate([30, 30, 17])
        sphere(r = 20);

        translate([0, 0, -10])
        cube([60, 60, 10]);

        translate([30, 30, -0.001])
        cylinder(r = 5.5, h = 10);

        translate([30, 20, 20])
        rotate([90, 0, 0])
        cylinder(r = 2, h = 15);
    }
}
