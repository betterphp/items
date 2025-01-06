$fa = 1;
$fs = 1.75 / 2;

wall_thickness = 1.2;
smaller_diameter = 34;
larger_diameter = 39;
height = 4;

// Adjustment for shrinking and random inperfections
tolerance = 1.2;

smaller_radius = (smaller_diameter / 2) + tolerance;
larger_radius = (larger_diameter / 2) + tolerance;

difference() {
    cylinder(
        r = larger_radius + wall_thickness,
        h = height
    );

    translate([0, 0, -0.01])
    cylinder(
        r = larger_radius,
        h = height + 0.02
    );
}

difference() {
    cylinder(
        r = smaller_radius,
        h = height
    );

    translate([0, 0, -0.01])
    cylinder(
        r = smaller_radius - wall_thickness,
        h = height + 0.02
    );
}
