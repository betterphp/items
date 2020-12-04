$fa = 6;
$fs = 1.75 / 2;

inner_width = 64;
inner_height = 55;
head_thickness = 4;
clip_thickness = 6;

outer_width = inner_width + head_thickness * 2;
outer_height = inner_height + head_thickness;

// Mic head holder
translate([0, 0, 30])
translate([-outer_width / 2, 0, 0])
mirror([0, 1, 0])
difference() {
    union() {
        // Top arms
        linear_extrude(height = 15) {
            curvature = 20;

            difference() {
                translate([curvature, curvature, 0])
                minkowski() {
                    square([outer_width - 2 * curvature, outer_height]);
                    circle(r = curvature);
                }

                translate([head_thickness, head_thickness, 0])
                translate([curvature, curvature, 0])
                minkowski() {
                    square([inner_width - 2 * curvature, inner_height]);
                    circle(r = curvature);
                }

                translate([0, inner_height - head_thickness, 0])
                square(outer_width, 100);
            }

            // Cleanly match the thickness of the screen clip
            thickness_difference = abs(head_thickness - clip_thickness);
            connected_width = 32;

            translate([outer_width / 2 - connected_width / 2, -thickness_difference, 0])
            polygon([
                [0, thickness_difference],
                [(connected_width - 15) / 2, 0],
                [(connected_width - 15) / 2 + 15, 0],
                [connected_width, thickness_difference],
            ]);
        }

        // Curved tops
        translate([0, inner_height - head_thickness, 7.5])
        rotate(a = 90, v = [0, 1, 0])
        cylinder(h = head_thickness, r = 7.5);

        translate([inner_width + head_thickness, inner_height - head_thickness, 7.5])
        rotate(a = 90, v = [0, 1, 0])
        cylinder(h = head_thickness, r = 7.5);
    }

    // Screw/bolt holes
    union() {
        // For head
        translate([-5, outer_height - 7.5, 7.5])
        rotate(a = 90, v = [0, 1, 0])
        cylinder(h = outer_width + 10, r = 3);
    }
}

screen_depth = 52;
inset_height = 99;
back_tab_size = 20;
front_tab_size = 6;

// Screen clip
translate([7.5, -head_thickness, 0])
rotate(a = -90, v = [0, 1, 0])
difference() {
    // Clip
    union() {
        linear_extrude(height = 15) {
            difference() {
                square([screen_depth + clip_thickness * 2, inset_height + clip_thickness * 2]);

                translate([clip_thickness, clip_thickness, 0])
                square([screen_depth, inset_height]);

                translate([clip_thickness + back_tab_size, clip_thickness + front_tab_size, 0])
                square([screen_depth, inset_height]);
            }
        }
    }
}
