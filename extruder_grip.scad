$fa = 1;
$fs = 1.75 / 2;

inner_width = 49;
inner_depth = 25;

grip_height = 10;

// grip
hull() {
    translate([inner_width + 5 + 1.5, 0, grip_height])
    rotate([-90, 0, 0])
    cylinder(r = 5, h = inner_depth);

    translate([inner_width, 0, 0])
    rotate([-90, 0, 0])
    cylinder(r = 0.01, h = inner_depth);

    translate([inner_width + 10, 0, 0])
    rotate([-90, 0, 0])
    cylinder(r = 0.01, h = inner_depth);
}

// arm
translate([0, inner_depth - 2, 0])
cube([inner_width + 5, 2, 4]);

// case clip
translate([-2, inner_depth - 2, 0])
difference() {
    cube([2, 2, 4]);
    translate([-0.01, -0.01, 1])
    cube([2, 2 + 0.02, 1]);
}

// Screw arm
translate([inner_width - 8.5, -14.5, 0])
linear_extrude(height = 1)
union() {
    difference() {
        hull() {
            circle(r = 5);
            translate([8.5 + 5, 0, 0])
            circle(r = 5);
        }

        circle(r = 2.25);
    }

    translate([8.5, 0])
    square([10, 14.5]);
}

// Arm support
translate([inner_width + 5 + 0.5, -14.5, 1])
rotate([0, -90, 0])
linear_extrude(height = 1)
polygon(points = [
    [0, 0],
    [grip_height, 14.5],
    [0, 14.5],
]);
