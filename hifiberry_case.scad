include<libs/screws.scad>;

$fa = 1;
$fs = 1.75 / 2;

inner_width = 60;
inner_depth = 90;
inner_height = 32 + 4; // pi height + screw pillars

outer_curve_radius = 6;
wall_thickness = 3;

wall_thickness_offset = outer_curve_radius - wall_thickness;

// Main case body
difference() {
    translate([wall_thickness_offset, wall_thickness_offset, -wall_thickness])
    linear_extrude(inner_height + 2 * wall_thickness)
    hull() {
        x_min = 0;
        y_min = 0;
        x_max = inner_width - wall_thickness_offset * 2;
        y_max = inner_depth - wall_thickness_offset * 2;

        translate([x_min, y_min])
        circle(r = outer_curve_radius);

        translate([x_min, y_max])
        circle(r = outer_curve_radius);

        translate([x_max, y_min])
        circle(r = outer_curve_radius);

        translate([x_max, y_max])
        circle(r = outer_curve_radius);
    }

    // main space inside
    cube([inner_width, inner_depth, inner_height + 2 * wall_thickness]);

    // notches for lid to clip in
    translate([10, -wall_thickness - 1, inner_height + 0.001])
    cube([inner_width - 20, wall_thickness + 2, wall_thickness]);
    translate([10, inner_depth - 1, inner_height + 0.001])
    cube([inner_width - 20, wall_thickness + 2, wall_thickness]);

    // ethernet port
    translate([inner_width - 4 - 16, inner_depth - 1, 4 + 1.3])
    cube([16, wall_thickness + 2, 13.8]);

    // USB ports
    translate([3, inner_depth - 1, 4 + 2])
    cube([15, wall_thickness + 2, 16]);
    translate([3 + 15 + 3, inner_depth - 1, 4 + 2])
    cube([15, wall_thickness + 2, 16]);

    // Micro USB power
    translate([inner_width - 1, 9, 4.5])
    cube([wall_thickness + 2, 10, 6]);

    // HDMI port
    translate([inner_width - 1, 27, 5])
    cube([wall_thickness + 2, 16.5, 7]);

    // RCA connectors
    translate([inner_width - 1, 37, 24])
    rotate([0, 90, 0])
    cylinder(r = 5, h = wall_thickness + 2);

    translate([inner_width - 1, 37 + 16, 24])
    rotate([0, 90, 0])
    cylinder(r = 5, h = wall_thickness + 2);

    // Space for 3.5mm jack
    translate([inner_width - 0.5, 56 - 7 / 2, 0])
    cube([2, 7, 14]);
}

// screw pillars
translate([4.5, 6.5])
screw_pillar(size = 1, height = 4);

translate([inner_width - 4.5, 6.5])
screw_pillar(size = 1, height = 4);

translate([4.5, 6.5 + 58])
screw_pillar(size = 1, height = 4);

translate([inner_width - 4.5, 6.5 + 58])
screw_pillar(size = 1, height = 4);

// Lid
translate([-inner_width - 10, 0, -wall_thickness]) {
    difference() {
        union() {
            cube([inner_width, inner_depth, wall_thickness]);
            translate([10, -wall_thickness, 0])
            cube([inner_width - 20, inner_depth + 2 * wall_thickness, wall_thickness]);
        }

        translate([inner_width / 2, inner_depth / 2, -1])
        linear_extrude(wall_thickness + 2) {
            for (i = [24:-3:6]) {
                difference() {
                    circle(r = i);
                    circle(r = i - 1.6);
                }
            }
        }
    }

    translate([0, (inner_depth - wall_thickness) / 2, 0])
    cube([inner_width, wall_thickness, wall_thickness]);

    translate([(inner_width - wall_thickness) / 2, 0, 0])
    cube([wall_thickness, inner_depth, wall_thickness]);
}
