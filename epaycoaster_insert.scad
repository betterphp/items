include<coaster_lib.scad>;

$fa = 6;
$fs = 0.875;

size = 100;
border_radius = 14;
thickness = 6;

linear_extrude(height = thickness / 2) {
    epayslips_logo_2d(size);
}
