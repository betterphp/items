$fa = 1;
$fs = 1.75 / 2;

total_pegs = 41;
center_diameter = 220;

translate([0, 0, 6])
rotate_extrude()
translate([center_diameter / 2, 0, 0])
intersection() {
    circle(r = 7);
    square([20, 10], center = true);
}

translate([-center_diameter / 2, -5, 0])
cube([center_diameter, 10, 1]);

translate([-5, -center_diameter / 2, 0])
cube([10, center_diameter, 1]);

radius = center_diameter / 2;
peg_angle = 360 / total_pegs;

for(i = [0 : total_pegs - 1]) {
    rotate([0, 0, i * peg_angle]) {
        difference() {
            translate([radius, 0, 11])
            cylinder(h = 14, r = 3.3);

            translate([radius + 4.3, 0, 11])
            rotate(a = 60)
            cylinder(h = 13, r = 4, $fn = 3);
        }

        translate([110, 0, 11])
        cylinder(h = 1.5, r1 = 4, r2 = 3.3);

        translate([110, 0, 25])
        cylinder(h = 2, r = 4.3);

        translate([110, 0, 20])
        cylinder(h = 5, r1 = 0, r2 = 4.3);
    }
}
