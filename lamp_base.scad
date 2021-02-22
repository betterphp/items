$fa = 1;
$fs = 1.75 / 2;

outer_diam = 100;
inner_diam = 87;
ridge_height = 9;
base_height = 29;
switch_diam = 21;

outer_rad = outer_diam / 2;
inner_rad = inner_diam / 2;

switch_rad = switch_diam / 2;

// Main base
difference() {
    cylinder(r = outer_rad, h = base_height);

    union() {
        // Rim cutout
        translate([0, 0, base_height - ridge_height + 0.001])
        cylinder(r1 = inner_rad, r2 = outer_rad - 1.6, h = ridge_height);

        // Inner cutout
        translate([0, 0, 4])
        cylinder(r = inner_rad, h = base_height);

        // Switch cutout
        translate([0, 0, switch_rad + 4])
        rotate([0, 90, 0])
        cylinder(r = switch_rad, h = outer_diam + 20);

        // Switch face cutout
        translate([outer_rad - 1.6, -20, -1]) {
            cube(size = [10, 40, base_height - 1]);

            translate([0, 0, base_height - 1])
            rotate([0, 45, 0])
            cube(size = [10, 40, 10]);
        }

        // USB cable in hole
        translate([0, 0, 6])
        rotate([-45, 90, 0])
        cylinder(r = 2, h = outer_diam + 20);
    }
}

// LED Mount
cylinder(r = 3, h = base_height + 15);
