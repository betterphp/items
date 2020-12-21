include<lib.scad>;

cylinder(h = 10, r = 1.75);

translate([0, 0, 10])
cylinder(h = 20, r1 = 2.5, r2 = 0.4);
