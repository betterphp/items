$fa = 1;
$fs = 1.75 / 2;

width = 0.4 * 6;
length = 200;

linear_extrude(0.2) {
    square([length, width], true);

    rotate(90)
    square([length, width], true);
}
