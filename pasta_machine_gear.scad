$fa = 1;
$fs = 1.75 / 2;

thickness = 5;
teeth_outer_diameter = 30;
teeth_inner_diameter = 20;
tooth_count = 12;
tooth_point_radius = 1;
tooth_width = 3;
shaft_diameter = 14;
notched_diameter = 12.5;
shaft_tollerance = 1;

teeth_outer_radius = teeth_outer_diameter / 2;
teeth_inner_radius = teeth_inner_diameter / 2;
tooth_length = teeth_outer_diameter - teeth_inner_diameter;

shaft_radius = (shaft_diameter / 2) + (shaft_tollerance / 2);

linear_extrude(5) {
    difference() {
        circle(r = teeth_inner_radius + tooth_point_radius / 2);
        circle(r = shaft_diameter / 2);
    }

    translate([-shaft_radius, -shaft_radius, 0])
    square([shaft_diameter, shaft_diameter - notched_diameter]);

    for (i = [0:tooth_count]) {
        rotate(i * (360 / tooth_count))
        translate([0, teeth_inner_radius, 0])
        hull() {
            translate([0, tooth_length - tooth_point_radius, 0])
            circle(r = tooth_point_radius);

            translate([-tooth_width / 2, 0, 0])
            circle(r = tooth_point_radius);

            translate([tooth_width / 2, 0, 0])
            circle(r = tooth_point_radius);
        }
    }
}
