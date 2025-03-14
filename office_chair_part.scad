$fa = 1;
$fs = 1.75 / 2;

height = 140;

outer_diameter = 45;
inner_diameter = 29;

curvey_radius = 6;

difference() {
    union() {
        cylinder(d = outer_diameter, h = height - curvey_radius);

        translate([0, 0, height - curvey_radius])
        cylinder(d = outer_diameter - curvey_radius * 2, h = curvey_radius);

        translate([0, 0, height - curvey_radius])
        rotate_extrude() {
            radius = (outer_diameter / 2) - curvey_radius;

            translate([radius, 0, 0])
            circle(r = curvey_radius);
        }
    }

    union() {
        translate([0, 0, -0.01])
        cylinder(d = inner_diameter, h = height + 0.02);
    }
}
