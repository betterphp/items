$fa = 1;
$fs = 1.75 / 2;

switch_width = 200;
switch_depth = 100;

thickness = 5;

union() {
    translate([thickness, switch_depth / 2])
    cube([switch_width, thickness * 2, thickness]);

    translate([0, switch_depth / 2])
    cube([thickness, thickness * 2, thickness * 2]);

    translate([switch_width + thickness, switch_depth / 2])
    cube([thickness, thickness * 2, thickness * 2]);

    translate([thickness + 20, 0, 0]) {
        translate([0, thickness, 0])
        cube([thickness * 2, switch_depth, thickness]);

        cube([thickness * 2, thickness, thickness * 2]);

        translate([0, switch_depth + thickness, 0])
        cube([thickness * 2, thickness, thickness * 2]);
    }

    translate([switch_width - thickness - 20, 0, 0]) {
        translate([0, thickness, 0])
        cube([thickness * 2, switch_depth, thickness]);

        cube([thickness * 2, thickness, thickness * 2]);

        translate([0, switch_depth + thickness, 0])
        cube([thickness * 2, thickness, thickness * 2]);
    }
}
