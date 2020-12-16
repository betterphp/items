$fa = 1;
$fs = 1.75 / 2;

width = 50;
height = 80;

difference() {
    linear_extrude(height = 1)
    union() {
        hull() {
            circle(r = width / 2);

            translate([0, - (height - 3 / 2 - width / 2)])
            circle(r = 3);
        }

        hull() {
            translate([-width / 2 - 2, width / 2 - 2])
            circle(r = 2);
            circle(r = 12);
        }

        hull() {
            translate([width / 2 + 2, width / 2 - 2])
            circle(r = 2);
            circle(r = 12);
        }
    }

    linear_extrude(height = 2)
    offset(r = 0.3)
    union() {
        translate([0, 7])
        text(text = "YOU ARE", size = 7, font = "Lato", halign = "center", valign = "center");
        translate([0, -4])
        text(text = "HERE", size = 11, font = "Lato", halign = "center", valign = "center");

        difference() {
            offset(r = -2)
            hull() {
                translate([-width / 2 - 2, width / 2 - 2])
                circle(r = 2);
                circle(r = 12);
            }
            circle(r = width / 2);
        }

        difference() {
            offset(r = -2)
            hull() {
                translate([width / 2 + 2, width / 2 - 2])
                circle(r = 2);
                circle(r = 12);
            }
            circle(r = width / 2);
        }
    }
}
