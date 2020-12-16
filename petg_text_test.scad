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
    square([22, 10]);

    union() {
        translate([4, 5])
        letter("T", 7);
        translate([10, 5])
        letter("E", 6);
        translate([15, 5])
        letter("S", 5);
        translate([19, 5])
        letter("T", 4);
    }
}
