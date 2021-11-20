$fa = 1;
$fs = 1.75 / 2;

switch_width = 237;
switch_depth = 102;
stand_height = 30;
case_width = 115;

thickness = 5;

case_offset = (case_width - switch_depth) / 2;

module render_switch_base() {
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
}

module render_legs() {
    linear_extrude(height = thickness * 2)
    union() {
        polygon([
            [0, 0],
            [case_offset + thickness, stand_height],
            [case_offset + thickness + switch_depth, stand_height],
            [case_width + thickness * 2, 0],

            [case_width + thickness, 0],
            [case_offset + switch_depth, stand_height - thickness],
            [case_offset + thickness * 2, stand_height - thickness],
            [thickness, 0],
        ]);

        translate([thickness, 0, 0])
        square([case_width, thickness]);

        translate([0, -thickness, 0])
        square([thickness, thickness]);

        translate([case_width + thickness, -thickness, 0])
        square([thickness, thickness]);
    }
}

render_switch_base();

translate([switch_width / 2 - switch_depth / 2, 0, 0])
render_legs();

translate([switch_width / 2 - switch_depth / 2, -stand_height - 10, 0])
render_legs();
