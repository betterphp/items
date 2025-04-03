$fa = 1;
$fs = 1.75 / 2;

translate([-150, 0, 0])
difference() {
    import("dagger_base.stl");

    translate([-300, -100, -40])
    cube([600, 200, 40]);

    translate([-300, -100, -1])
    cube([348.5, 200, 40]);
}
