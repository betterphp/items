include<libs/rounded_shapes.scad>;

$fa = 1;
$fs = 1.75 / 2;

outer_width = 200;
outer_height = 40;

head_width = 80;
head_height = 10;

foot_width = 15;
foot_height = 4;

tab_thickness = 1.4;
tab_height = 4;

difference() {
    union() {
        hull() {
            translate([outer_width / 2 - head_width / 2, outer_height])
            cube([head_width, 0.01, head_height + tab_height]);

            cube([foot_width, 0.01, foot_height + tab_height]);
        }

        hull() {
            translate([outer_width / 2 - head_width / 2, outer_height])
            cube([head_width, 0.01, head_height + tab_height]);

            translate([outer_width - foot_width, 0, 0])
            cube([foot_width, 0.01, foot_height + tab_height]);
        }
    }

    union() {
        translate([0, tab_thickness, -0.01])
        cube([outer_width, outer_height, tab_height]);

        translate([foot_width, 0, -0.01])
        cube([outer_width - foot_width * 2, tab_thickness + 0.01, tab_height]);
    }
}
