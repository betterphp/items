$fa = 1;
$fs = 0.875;

// Configurable variables
moisture_sensor_inset = 50;
pot_rim_thickness = 3;
pot_diameter = 100;

// Internal variables
moisture_sensor_bar_thickness = 5;

wall_thickness = 1.2;
esp_board_width = 20;
esp_board_length = 30;
esp_board_thickness = 5;

moisture_sensor_width = 20;
moisture_sensor_thickness = 2;
moisture_sensor_controller_height = 10;
moisture_sensor_controller_thickness = 5;

// Helpful calculated variables
pot_radius = pot_diameter / 2;
widest_board_width = max(esp_board_width, moisture_sensor_width);
full_outer_width = widest_board_width + wall_thickness * 2;

moisture_sensor_case_outer_thickness = moisture_sensor_controller_thickness + wall_thickness * 2;
pot_inner_distance = esp_board_thickness + wall_thickness * 2 + 1 + pot_rim_thickness;

// Bar that connects to the sensor to controller
cube([
    full_outer_width,
    pot_inner_distance + moisture_sensor_inset + moisture_sensor_case_outer_thickness / 2,
    moisture_sensor_bar_thickness,
]);

// Case for the controller
translate([0, 0, moisture_sensor_bar_thickness])
difference() {
    cube([
        widest_board_width + wall_thickness * 2,
        esp_board_thickness + wall_thickness * 2,
        esp_board_length + wall_thickness * 2,
    ]);

    translate([wall_thickness, wall_thickness, wall_thickness])
    cube([
        widest_board_width,
        esp_board_thickness,
        esp_board_length + wall_thickness * 2,
    ]);
}

// Slot for the pot edge
difference() {
    translate([
        0,
        esp_board_thickness + wall_thickness * 2,
        moisture_sensor_bar_thickness,
    ])
    cube([full_outer_width, pot_rim_thickness * 3, 10]);

    translate([
        full_outer_width / 2,
        pot_radius + esp_board_thickness + wall_thickness * 2 + 1,
        moisture_sensor_bar_thickness + 0.001,
    ])
    difference() {
        cylinder(r = pot_radius, h = 10 + 0.001);
        translate([0, 0, -0.001])
        cylinder(r = pot_radius - pot_rim_thickness, h = 10 + 0.002);
    }
}

// Case for the moisture sensor
translate([
    0,
    pot_inner_distance + moisture_sensor_inset - moisture_sensor_case_outer_thickness / 2,
    moisture_sensor_bar_thickness,
])
difference() {
    cube([
        full_outer_width,
        moisture_sensor_case_outer_thickness,
        moisture_sensor_controller_height + wall_thickness,
    ]);

    translate([wall_thickness, wall_thickness, wall_thickness])
    cube([
        widest_board_width,
        moisture_sensor_bar_thickness,
        moisture_sensor_controller_height + 0.001,
    ]);
}
