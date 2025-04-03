$fa = 1;
$fs = 1.75 / 2;

rotate([0, 0, 90])
difference() {
    translate([0, 0, 48.5])
    rotate([0, 90, 0])
    import("dagger_base.stl");

    translate([-25, -50, -200])
    cube([50, 100, 200]);

    translate([-25, -50, 120])
    cube([50, 100, 200]);
}
