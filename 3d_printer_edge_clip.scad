$fa = 1;
$fs = 1.75 / 2;

thickness = 2;
channel_width = 1;
inner_length = 12;

linear_extrude(height = 50)
difference() {
    square([thickness * 3 + channel_width * 2, inner_length + thickness * 2]);

    translate([0, thickness * 2])
    square([thickness + channel_width, inner_length]);

    translate([thickness * 2 + channel_width, 0])
    square([thickness + channel_width, inner_length]);

    translate([thickness, thickness])
    square([channel_width, thickness]);

    translate([thickness * 2 + channel_width, inner_length])
    square([channel_width, thickness]);
}
