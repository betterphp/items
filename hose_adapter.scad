$fa = 1;
$fs = 1.75 / 2;

wall_thickness = 1.2;
smaller_diameter = 34;
larger_diameter = 40;
connection_length = 25;

adapter_offset = 0.5;
adapter_length = (larger_diameter - smaller_diameter - adapter_offset * 2);
smaller_radius = (smaller_diameter / 2);
larger_radius = (larger_diameter / 2);

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
