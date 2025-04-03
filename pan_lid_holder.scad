include<libs/rounded_shapes.scad>;

$fa = 1;
$fs = 1.75 / 2;

lid_height = 38;
lid_diameter = 220;
wall_thickness = 4;
lip_width = 20;

screw_hole_size = 4;

lid_radius = lid_diameter / 2;
holder_height = 20;
holder_top_width = sqrt((lid_radius ^ 2) * 2);
holder_depth = lid_height + 5;
intersection_angle = acos((holder_top_width / 2) / lid_radius);
side_top_offset = holder_height * tan(intersection_angle);
holder_bottom_width = holder_top_width - side_top_offset;
screw_hole_radius = screw_hole_size / 2;

module render_half() {
    // Back piece
    hull() {
        translate([0, 0, wall_thickness / 2])
        rotate([-90, 0, 0])
        cylinder(h = wall_thickness, r = wall_thickness / 2);

        translate([-side_top_offset, 0, holder_height])
        rotate([-90, 0, 0])
        cylinder(h = wall_thickness, r = wall_thickness / 2);

        translate([holder_top_width / 2 + wall_thickness, 0, holder_height])
        rotate([-90, 0, 0])
        cylinder(h = wall_thickness, r = wall_thickness / 2);

        translate([holder_top_width / 2 + wall_thickness, 0, wall_thickness / 2])
        rotate([-90, 0, 0])
        cylinder(h = wall_thickness, r = wall_thickness / 2);
    }

    // Side
    hull() {
        translate([0, 0, wall_thickness / 2])
        rotate([-90, 0, 0])
        cylinder(h = holder_depth + wall_thickness / 2, r = wall_thickness / 2);

        translate([-side_top_offset, 0, holder_height])
        rotate([-90, 0, 0])
        cylinder(h = holder_depth + wall_thickness / 2, r = wall_thickness / 2);
    }

    // Lip
    hull() {
        translate([0, holder_depth + wall_thickness / 2, wall_thickness / 2])
        rotate([-90, 0, 0])
        sphere(d = wall_thickness);

        translate([-side_top_offset, holder_depth + wall_thickness / 2, holder_height])
        rotate([-90, 0, 0])
        sphere(d = wall_thickness);

        translate([lip_width, holder_depth + wall_thickness / 2, holder_height])
        rotate([-90, 0, 0])
        sphere(d = wall_thickness);

        translate([lip_width, holder_depth + wall_thickness / 2, wall_thickness / 2])
        rotate([-90, 0, 0])
        sphere(d = wall_thickness);
    }
}

difference() {
    union() {
        render_half();

        translate([holder_top_width, 0, 0])
        mirror([1, 0, 0])
        render_half();
    }

    // Screw holes
    translate([holder_top_width / 4, -0.01 , holder_height / 2])
    rotate([-90, 0, 0])
    union() {
        cylinder(h = wall_thickness / 2 + 0.02, r = screw_hole_radius);
        translate([0, 0, wall_thickness / 2])
        cylinder(h = wall_thickness / 2 + 0.02, r1 = screw_hole_radius, r2 = screw_hole_radius  * 2);
    }

    translate([(holder_top_width / 4) * 3, -0.01 , holder_height / 2])
    rotate([-90, 0, 0])
    union() {
        cylinder(h = wall_thickness / 2 + 0.02, r = screw_hole_radius);
        translate([0, 0, wall_thickness / 2])
        cylinder(h = wall_thickness / 2 + 0.02, r1 = screw_hole_radius, r2 = screw_hole_radius  * 2);
    }
}
