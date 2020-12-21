include<lib.scad>;

// left arm
translate([-10, 0, 0])
union() {
    // Arm segments
    translate([-10, 1.75, 1.75])
    rotate([0, 90, 0])
    cylinder(h = 10, r = 1.75);

    translate([-25, -1, 1.75])
    rotate([-10, 90, 0])
    cylinder(h = 15, r = 1.75);

    translate([-48, -11.7, 1.75])
    rotate([-25, 90, 0])
    cylinder(h = 25, r = 1.75);

    translate([-38, -6.8, 1.75])
    rotate([-160, 90, 0])
    cylinder(h = 10, r = 1.75);

    translate([-39, -7.8, 1.75])
    rotate([80, 90, 0])
    cylinder(h = 10, r = 1.75);

    // Joints
    hull() {
        translate([-10, 1.75, 1.75])
        rotate([0, 90, 0])
        cylinder(h = 1, r = 1.75);

        translate([-11, 1.5, 1.75])
        rotate([-10, 90, 0])
        cylinder(h = 1, r = 1.75);
    }

    hull() {
        translate([-25, -1, 1.75])
        rotate([-10, 90, 0])
        cylinder(h = 1, r = 1.75);

        translate([-27, -1.9, 1.75])
        rotate([-25, 90, 0])
        cylinder(h = 1, r = 1.75);
    }
}

// right arm
translate([10, 0, 0])
union() {
    // Arm segments
    translate([0, 1.75, 1.75])
    rotate([0, 90, 0])
    cylinder(h = 10, r = 1.75);

    translate([10, 1.75, 1.75])
    rotate([-30, 90, 0])
    cylinder(h = 15, r = 1.75);

    translate([23, 9, 1.75])
    rotate([-60, 90, 0])
    cylinder(h = 25, r = 1.75);

    translate([29.25, 20, 1.75])
    rotate([-100, 90, 0])
    cylinder(h = 10, r = 1.75);

    translate([29.25, 20, 1.75])
    rotate([10, 90, 0])
    cylinder(h = 10, r = 1.75);

    // Joints
    hull() {
        translate([9, 1.75, 1.75])
        rotate([0, 90, 0])
        cylinder(h = 1, r = 1.75);

        translate([10, 1.75, 1.75])
        rotate([-30, 90, 0])
        cylinder(h = 1, r = 1.75);
    }

    hull() {
        translate([22.15, 8.75, 1.75])
        rotate([-30, 90, 0])
        cylinder(h = 1, r = 1.75);

        translate([23, 9, 1.75])
        rotate([-60, 90, 0])
        cylinder(h = 1, r = 1.75);
    }
}
