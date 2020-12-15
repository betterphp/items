$fa = 1;
$fs = 1.75 / 2;

width = 35;
height = 60;

difference() {
    union() {
        linear_extrude(height = 1)
        circle(r = width / 2);

        linear_extrude(height = 2)
        union() {
            translate([0, 4.5])
            text(text = "YOU ARE", size = 4.5, font = "Lato:style=Black", halign = "center", valign = "center");
            translate([0, -3.5])
            text(text = "HERE", size = 7, font = "Lato:style=Black", halign = "center", valign = "center");
        }
    }

    translate([-100, -width / 2, 1 - 0.4 + 0.001])
    cube([200, 8, 0.4]);
}
