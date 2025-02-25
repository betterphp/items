$fa = 1;
$fs = 1.75 / 2;

wall_thickness = 2.4;
outer_diameter = 180;
height = 14;
cross_bar_width = 8;
mount_width = 26;
mount_height = 11;

outer_radius = outer_diameter / 2;

difference() {
    // Outer case
    cylinder(r = outer_radius, h = height + wall_thickness);
    translate([0, 0, -0.01])
    cylinder(r = outer_radius - wall_thickness, h = height + wall_thickness + 0.02);

    // Cutout for the cable and panel mount
    translate([0, -mount_width / 2, height - mount_height + wall_thickness + 0.01])
    cube([outer_diameter, mount_width, mount_height]);
}

// Mount for the screws and lamp holder
linear_extrude(height = 2)
difference() {
    circle(r = outer_radius);

    cross_bar_half_width = cross_bar_width / 2;

    translate([-outer_diameter - cross_bar_half_width, cross_bar_half_width, 0])
    square([outer_diameter, outer_diameter]);

    translate([cross_bar_half_width, cross_bar_half_width, 0])
    square([outer_diameter, outer_diameter]);

    translate([-outer_diameter - cross_bar_half_width, - outer_diameter - cross_bar_half_width, 0])
    square([outer_diameter, outer_diameter]);

    translate([cross_bar_half_width, -outer_diameter - cross_bar_half_width, 0])
    square([outer_diameter, outer_diameter]);
}
