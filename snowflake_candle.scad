$fa = 6;
$fs = 1.75 / 2;

difference() {
    union() {
        scale([1.5, 1.5, 2])
        import("snowflake_pendant.stl");
        cylinder(h = 10, r = 13);

        translate([-1.79, 30, 0])
        cube([1.79 * 2, 7, 8]);
    }

    translate([0, 0, 2])
    cylinder(h = 10, r = 11);
}
