$fa = 6;
$fs = 0.875;

module coaster_base_3d(size, thickness, border_radius) {
    linear_extrude(height = thickness) {
        minkowski() {
            cube_size = size - border_radius * 2;

            square(size = [cube_size, cube_size], center = true);
            circle(r = border_radius);
        }
    }
}

module epayslips_logo_2d(size) {
    difference() {
        rotate(a = 45)
        minkowski() {
            roundness = 22;
            cube_size = size * 0.5 - roundness;

            square(size = [cube_size, cube_size], center = true);
            circle(r = roundness);
        }

        minkowski() {
            roundness = 10;
            cube_size = size * 0.25 - roundness;

            square(size = [cube_size, cube_size], center = true);
            circle(r = roundness);
        }
    }
}

module datacode_logo_2d(size) {
    difference() {
        rotate(a = 45 / 2)
        minkowski() {
            roundness = 8;
            circle(r = size * 0.38 - roundness, $fn = 8);
            circle(r = roundness);
        }

        circle(r = size * 0.12);

        translate([0, size / 4, 0]) {
            square(size = [size * 0.1, size / 2], center = true);
        }
    }
}

module sj_logo_2d(size) {
    rotate(a = 45 / 2)
    difference() {
        roundness = 8;

        minkowski() {
            circle(r = size * 0.45 - roundness, $fn = 8);
            circle(r = roundness);
        }

        minkowski() {
            circle(r = size * 0.385 - roundness, $fn = 8);
            circle(r = roundness);
        }
    }

    text_size = size * 0.2;
    text_offset = text_size / 2 + 2;

    translate([0, text_offset, 0])
    text(
        text = "JAC",
        halign = "center",
        valign = "center",
        font = "Roboto Mono for Powerline:style=Bold",
        size = size * 0.2
    );

    translate([0, -text_offset, 0])
    text(
        text = "UZI",
        halign = "center",
        valign = "center",
        font = "Roboto Mono for Powerline:style=Bold",
        size = size * 0.2
    );
}
