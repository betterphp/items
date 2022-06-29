$fn = 100;
$fs = 1.75 / 2;

wall_thickness = 1.2;

moisture_sensor_board_thickness = 1.5;
moisture_sensor_controller_height = 28;
moisture_sensor_controller_width = 22.5;
moisture_sensor_controller_thickness = 4;

esp_board_width = 26;
esp_board_length = 62.5;
esp_board_thickness = 8;

battery_radius = 18 / 2;
battery_length = 50;

tolerance = 1;

module rounded_cube(width, depth, height, radius) {
    adjusted_width = width - radius * 2;
    adjusted_depth = depth - radius * 2;
    adjusted_height = height - radius * 2;

    translate([radius, radius, radius])
    hull() {
        translate([0, 0, 0])
        sphere(r = radius);

        translate([adjusted_width, 0, 0])
        sphere(r = radius);

        translate([adjusted_width, adjusted_depth, 0])
        sphere(r = radius);

        translate([0, adjusted_depth, 0])
        sphere(r = radius);

        translate([0, 0, adjusted_height])
        sphere(r = radius);

        translate([adjusted_width, 0, adjusted_height])
        sphere(r = radius);

        translate([adjusted_width, adjusted_depth, adjusted_height])
        sphere(r = radius);

        translate([0, adjusted_depth, adjusted_height])
        sphere(r = radius);
    }
}

inner_case_width = max(battery_length, esp_board_length) + tolerance * 2;
inner_case_height = max(battery_radius * 2, esp_board_width, moisture_sensor_controller_height) + tolerance * 2;
inner_case_depth = esp_board_thickness + moisture_sensor_controller_thickness + battery_radius * 2 + tolerance * 4;

outer_case_width = inner_case_width + wall_thickness * 2;
outer_case_height = inner_case_height + wall_thickness * 2;
outer_case_depth = inner_case_depth + wall_thickness * 2;

difference() {
    rounded_cube(outer_case_width, outer_case_depth, outer_case_height, 3);

    union() {
        translate([wall_thickness, wall_thickness, wall_thickness])
        rounded_cube(inner_case_width, inner_case_depth, inner_case_height + 0.002, 3);

        translate([wall_thickness, wall_thickness, wall_thickness + inner_case_height - 0.001]) {
            hull() {
                translate([3 + 1.5, 3 + 1.5, 0])
                cylinder(r = 3, h = wall_thickness + 0.002);

                translate([3 + 1.5, inner_case_depth - 3 - 1.5, 0])
                cylinder(r = 3, h = wall_thickness + 0.002);

                translate([inner_case_width - 3 - 1.5, 3 + 1.5, 0])
                cylinder(r = 3, h = wall_thickness + 0.002);

                translate([inner_case_width - 3 - 1.5, inner_case_depth - 3 - 1.5, 0])
                cylinder(r = 3, h = wall_thickness + 0.002);
            }
        }

        translate([
            outer_case_width / 2 - moisture_sensor_controller_width / 2,
            wall_thickness + esp_board_thickness + 5,
            0
        ])
        cube([moisture_sensor_controller_width, moisture_sensor_board_thickness, wall_thickness + 0.002]);
    }
}

translate([0, -outer_case_depth, 0])
hull() {
    translate([3 + 1.5, 3 + 1.5, 0])
    cylinder(r = 3, h = wall_thickness + 0.002);

    translate([3 + 1.5, inner_case_depth - 3 - 1.5, 0])
    cylinder(r = 3, h = wall_thickness + 0.002);

    translate([inner_case_width - 3 - 1.5, 3 + 1.5, 0])
    cylinder(r = 3, h = wall_thickness + 0.002);

    translate([inner_case_width - 3 - 1.5, inner_case_depth - 3 - 1.5, 0])
    cylinder(r = 3, h = wall_thickness + 0.002);
}
