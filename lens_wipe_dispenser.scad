include<libs/rounded_shapes.scad>;

$fa = 1;
$fs = 1.75 / 2;

// Inner dimensions
width = 62;
depth = 60;
height = 80;

wall_thickness = 1.6;
border_radius = 2;

pickup_length = 20;
slide_angle = 20;

pickup_front_face_height = sin(slide_angle) * pickup_length;
slide_depth = depth + wall_thickness + pickup_length;
slide_height = sin(slide_angle) * slide_depth;
slide_lip_length = 12;

outer_width = width + wall_thickness * 2;
outer_depth = depth + wall_thickness * 2;

difference() {
    // Main body
    union() {
        // outer wall
        linear_extrude(height = height + wall_thickness)
        difference() {
            rounded_square(outer_width, outer_depth, border_radius);

            translate([wall_thickness, wall_thickness])
            rounded_square(width, depth, border_radius - wall_thickness);
        }

        // Base
        linear_extrude(height = wall_thickness)
        translate([wall_thickness, wall_thickness])
        rounded_square(width, depth, border_radius);
    }

    // Slide top cutout
    intersection() {
        translate([
            wall_thickness + width / 2,
            -wall_thickness / 2,
            -width + pickup_front_face_height + height / 4
            //-height / 2 - pickup_front_face_height,
        ])
        rotate([-90, 0, 0])
        cylinder(r = width, h = depth);

        translate([wall_thickness + 0.04, -0.0, pickup_front_face_height])
        cube([width - 0.04, wall_thickness * 3, height]);
    }
}

difference() {
    union() {
        // Slide
        translate([wall_thickness, -pickup_length, 0])
        polyhedron(
            points = [
                [0, 0, 0],
                [width, 0, 0],
                [width, slide_depth, 0],
                [0, slide_depth, 0],
                [0, slide_depth, slide_height],
                [width, slide_depth, slide_height],
            ],
            faces = [
                [0, 1, 2, 3],
                [5, 4, 3, 2],
                [0, 4, 5, 1],
                [0, 3, 4],
                [5, 2, 1],
            ]
        );

        // Slide lip
        union() {
            translate([wall_thickness, -pickup_length, 0])
            rotate([slide_angle, 0, 0])
            cube([width, wall_thickness, slide_lip_length]);

            translate([wall_thickness, -pickup_length, 0])
            cube([width, depth, wall_thickness]);
        }
    }

    // Pickup area cutouts
    translate([wall_thickness - 0.01 + width / 3, -pickup_length - 20, -0.01])
    cube([width / 3, pickup_length + 20, height]);

    translate([wall_thickness - 0.01, -pickup_length - 20, -0.01])
    cube([10, pickup_length + 20, height]);

    translate([width - 10 + wall_thickness + 0.01, -pickup_length - 20, -0.01])
    cube([10, pickup_length + 20, height]);
}


// Lid (offset for printing easily)
translate([width + wall_thickness * 2 + 10, 0, 0])
union() {
    tolerance = 0.6;

    linear_extrude(height = wall_thickness)
    rounded_square(outer_width, outer_depth, border_radius);

    translate([wall_thickness + tolerance / 2, wall_thickness + tolerance / 2, wall_thickness])
    linear_extrude(height = wall_thickness)
    rounded_square(width - tolerance, depth - tolerance, border_radius - wall_thickness);
}
