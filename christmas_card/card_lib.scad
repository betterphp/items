$fa = 6;
$fs = 0.875;

face_thickness = 3;
card_height = 160;
card_width = 100;
text_size = 9;
tolerance = 0.25;

module card_face() {
    cube([card_width, card_height, face_thickness]);
}

module text_line(text, x, y) {
    translate([x, y])
    text(text, text_size, "Lato:style=Bold");
}

module render_text() {
    text_line("To Suzi", 10, card_height - text_size - 16);
    text_line("Merry 3D", 10, card_height / 2 + 7);
    text_line("christmas!", 10, card_height / 2 - 7);
    text_line("The most love", 10, 30);
    text_line("from Jacek <3", 10, 16);
}
