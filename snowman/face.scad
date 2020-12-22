include<lib.scad>;

difference() {
    union() {
        // Eyes
        translate([-6, 0, 0])
        sphere(r = 2);

        translate([6, 0, 0])
        sphere(r = 2);

        // Smile :)
        translate([3, -16, 0])
        sphere(r = 1.5);

        translate([8, -14, 0])
        sphere(r = 1.5);

        translate([12, -12, 0])
        sphere(r = 1.5);

        translate([15.5, -8, 0])
        sphere(r = 1.5);

        translate([-3, -16, 0])
        sphere(r = 1.5);

        translate([-8, -14, 0])
        sphere(r = 1.5);

        translate([-12, -12, 0])
        sphere(r = 1.5);

        translate([-15.5, -8, 0])
        sphere(r = 1.5);
    }

    translate([-50, -50, -10])
    cube([100, 100, 10]);
}
