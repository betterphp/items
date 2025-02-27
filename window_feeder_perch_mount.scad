$fa = 1;
$fs = 1.75 / 2;

border_radius = 4;

mount_depth = 30;
mount_height = 20;

holder_depth = 20;
holder_height = 10;

holder_distance = 30;
holder_elevation = 10;

branch_holder_radius = 8;
screw_hole_radius = 1.5;

linear_extrude(height = 2)
difference() {
    hull() {
        hull() {
            translate([0, 0])
            circle(r = border_radius);

            translate([mount_depth - border_radius * 2, 0])
            circle(r = border_radius);

            translate([mount_depth - border_radius * 2, mount_height - border_radius * 2])
            circle(r = border_radius);

            translate([0, mount_height - border_radius * 2])
            circle(r = border_radius);
        }

        translate([mount_depth + holder_distance, mount_height + holder_elevation])
        hull() {
            translate([0, 0])
            circle(r = holder_height / 2);

            translate([holder_depth - holder_height, 0])
            circle(r = holder_height / 2);
        }
    }

    circle(r = screw_hole_radius);

    translate([mount_depth - border_radius * 2, 0])
    circle(r = screw_hole_radius);

    translate([mount_depth - border_radius * 2, mount_height - border_radius * 2])
    circle(r = screw_hole_radius);

    translate([0, mount_height - border_radius * 2])
    circle(r = screw_hole_radius);

    translate([
        mount_depth + holder_distance + holder_depth / 2 - holder_height / 2,
        mount_height + holder_elevation + branch_holder_radius
    ])
    union() {
        circle(r = branch_holder_radius);

        translate([-2.5, -branch_holder_radius - 4])
        square([5, 2]);
    }
}
