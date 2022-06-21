$fa = 1;
$fs = 0.5;

wall_thickness = 1.2;

moisture_sensor_board_thickness = 2;
moisture_sensor_controller_height = 20;
moisture_sensor_controller_width = 20;
moisture_sensor_controller_thickness = 5;

esp_board_width = 20;
esp_board_length = 40;
esp_board_thickness = 10;

battery_radius = 18 / 2;
battery_length = 50;

tolerance = 2;

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

    translate([wall_thickness, wall_thickness, wall_thickness])
    rounded_cube(inner_case_width, inner_case_depth, inner_case_height + 20, 3);
}
