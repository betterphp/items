$fa = 1;
$fs = 1.75 / 2;

module letter(letter, size) {
    text(
        text = letter,
        size = size,
        font = "Lato:style=Bold",
        halign = "center",
        valign = "center"
    );
}

linear_extrude(height = 1)
difference() {
    square([30, 18]);

    union() {
        translate([8, 9])
        letter("T", 7);
        translate([14, 9])
        letter("E", 6);
        translate([19, 9])
        letter("S", 5);
        translate([23, 9])
        letter("T", 4);
    }
}
