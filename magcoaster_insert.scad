include<coaster_lib.scad>;

$fa = 6;
$fs = 0.875;

size = 100;
border_radius = 14;
thickness = 6;

linear_extrude(height = thickness / 2) {
    offset(delta = -0.2) {
        scale([0.8, 0.8])
        import(file = "magnetic_logo.svg", center = true);
    }
}
