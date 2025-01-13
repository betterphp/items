$fa = 1;
$fs = 1.75 / 2;

height = 100;

outer_diameter = 46.5;
inner_diameter = 28.5;

lip_diameter = outer_diameter + 4;
lip_height = 2;

curvey_radius = 6;

difference() {
    union() {
        cylinder(d = lip_diameter, h = lip_height);

        translate([0, 0, lip_height])
        cylinder(d = outer_diameter, h = height - lip_height - curvey_radius);

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
