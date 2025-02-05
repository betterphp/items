$fa = 1;
$fs = 1.75 / 2;

module rounded_square(width, height, border_radius) {
    translate([border_radius, border_radius])
    minkowski() {
        border_diameter = border_radius * 2;

        square(
            size = [
                width - border_diameter,
                height - border_diameter
            ]
        );
        circle(r = border_radius);
    }
}
