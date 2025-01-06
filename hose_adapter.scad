$fa = 1;
$fs = 1.75 / 2;

wall_thickness = 1.2;
smaller_diameter = 34;
larger_diameter = 39;
connection_length = 20;

// Adjustment for shrinking and random inperfections
tolerance = 1.2;

adapter_offset = 0.25;
adapter_length = (larger_diameter - smaller_diameter) * 3;
smaller_radius = (smaller_diameter / 2) + tolerance;
larger_radius = (larger_diameter / 2) + tolerance;

difference() {
    rad1 = larger_radius + adapter_offset;
    rad2 = larger_radius - adapter_offset;

    cylinder(
        r1 = rad1 + wall_thickness,
        r2 = rad2 + wall_thickness,
        h = connection_length
    );

    translate([0, 0, -0.01])
    cylinder(
        r1 = rad1,
        r2 = rad2,
        h = connection_length + 0.02
    );
}

translate([0, 0, connection_length])
difference() {
    rad1 = larger_radius - adapter_offset;
    rad2 = smaller_radius + adapter_offset;

    cylinder(
        r1 = rad1 + wall_thickness,
        r2 = rad2,
        h = adapter_length
    );

    translate([0, 0, -0.01])
    cylinder(
        r1 = rad1,
        r2 = rad2 - wall_thickness,
        h = adapter_length + 0.02
    );
}

translate([0, 0, connection_length + adapter_length])
difference() {
    rad1 = smaller_radius + adapter_offset;
    rad2 = smaller_radius - adapter_offset;

    cylinder(
        r1 = rad1,
        r2 = rad2,
        h = connection_length
    );

    translate([0, 0, -0.01])
    cylinder(
        r1 = rad1 - wall_thickness,
        r2 = rad2 - wall_thickness,
        h = connection_length + 0.02
    );
}
