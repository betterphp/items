include<lib.scad>;

difference() {
    union() {
        cylinder(r = 15, h = 1);
        cylinder(r = 10, h = 15);
    }

    union() {
        translate([0, 0, -1])
        cylinder(r = 8, h = 13);

        translate([0, 0, 12 - 0.001])
        cylinder(h = 2, r1 = 8, r2 = 1);
    }
}
