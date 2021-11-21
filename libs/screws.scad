module screw_pillar(size, height) {
    difference() {
        cylinder(r = size + 1, h = height);
        translate([0, 0, 0.001])
        cylinder(r = size, h = height);
    }
}
