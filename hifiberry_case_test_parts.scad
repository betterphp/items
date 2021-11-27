$fa = 1;
$fs = 1.75 / 2;

difference() {
    import("hifiberry_case.stl");

    // Remove the lid
    translate([-72, -4, -4])
    #cube([64, 100, 6]);

    // Remove left wall
    translate([-4, -4, -4])
    #cube([6, 100, 50]);

    // Remove bottom wall
    translate([-4, -4, -4])
    #cube([70, 6, 50]);

    // Remove most of base
    translate([8, 8, -4])
    #cube([44, 80, 6]);

    // Shorten top
    translate([-4, -4, 30])
    #cube([74, 100, 20]);
}
