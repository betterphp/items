$fa = 1;
$fs = 1.75 / 2;

// Diameter of the rolling pin
pin_diam = 30;
// Desired height of thing being rolld
roll_height = 10;

// Thickness of the disk
thickness = 5;
// Depth of the embossed text
text_depth = 1;
// Size of the text
text_size = (roll_height < 10) ? 3 : 5;

difference() {
    linear_extrude(height = thickness) {
        difference() {
            circle(r = pin_diam + roll_height);
            circle(r = pin_diam);
        }
    }

    translate([0, pin_diam + roll_height / 2, thickness - text_depth])
    linear_extrude(height = thickness) {
        text(
            text = str(roll_height / 10, "CM"),
            size = text_size,
            font = "Lato:style=Bold",
            halign = "center",
            valign = "center"
        );
    }
}