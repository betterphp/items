$fa = 1;
$fs = 1.75 / 2;

wall_thickness = 2;
smaller_diameter = 36;
larger_diameter = 39;
connection_length = 20;

adapter_length = (larger_diameter - smaller_diameter) * 3;

difference() {
    cylinder(
        r = larger_diameter,
        h = connection_length
    );

    translate([0, 0, -0.01])
    cylinder(
        r = larger_diameter - wall_thickness,
        h = connection_length + 0.02
    );
}

translate([0, 0, connection_length])
difference() {
    cylinder(
        r1 = larger_diameter,
        r2 = smaller_diameter - wall_thickness,
        h = adapter_length
    );

    translate([0, 0, -0.01])
    cylinder(
        r1 = larger_diameter - wall_thickness,
        r2 = smaller_diameter - wall_thickness * 2,
        h = adapter_length + 0.02
    );
}

translate([0, 0, connection_length + adapter_length])
difference() {
    cylinder(
        r = smaller_diameter - wall_thickness,
        h = connection_length
    );

    translate([0, 0, -0.01])
    cylinder(
        r = smaller_diameter - wall_thickness * 2,
        h = connection_length + 0.02
    );
}
