$fa = 1;
$fs = 1.75 / 2;

width = 35;
height = 60;

difference() {
    linear_extrude(height = 1)
    hull() {
        circle(r = width / 2);

        translate([0, - (height - 3 / 2 - width / 2)])
        circle(r = 3);
    }

    linear_extrude(height = 2)
    union() {
        translate([0, 4.5])
        text(text = "YOU ARE", size = 4.5, font = "Lato:style=Black", halign = "center", valign = "center");
        translate([0, -3.5])
        text(text = "HERE", size = 7, font = "Lato:style=Black", halign = "center", valign = "center");
    }
}
