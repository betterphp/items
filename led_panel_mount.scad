$fa = 1;
$fs = 1.75 / 2;

wall_thickness = 2;
outer_diameter = 260;
height = 20;

outer_radius = outer_diameter / 2;

difference() {
    // Outer case
    cylinder(r = outer_radius, h = height);
    translate([0, 0, -0.01])
    cylinder(r = outer_radius - wall_thickness, h = height + 0.02);

    // Cutout for the flex
    translate([0, 0, 4])
    rotate(a = [90, 0, 80])
    union() {
        cylinder(r = 4, h = outer_diameter);
        translate([-4, -8, 0])
        cube([8, 8, outer_diameter]);
    }
}

// Mount for the screws and lamp holder
linear_extrude(height = 2)
difference() {
    circle(r = outer_radius);

    translate([-outer_radius, 10, 0])
    square([outer_diameter, outer_diameter]);

    translate([-outer_radius, -outer_diameter - 10, 0])
    square([outer_diameter, outer_diameter]);
}
