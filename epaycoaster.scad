include<coaster_lib.scad>;

$fa = 6;
$fs = 0.875;

size = 100;
border_radius = 14;
thickness = 6;

difference() {
    coaster_base_3d(size, thickness, border_radius);

    translate([0, 0, thickness / 2 + 0.001]) {
        linear_extrude(height = thickness / 2) {
            epayslips_logo_2d(size);
        }
    }
}
