include<card_lib.scad>;

linear_extrude(height = 1) {
    offset(r = -0.25) {
        render_text();
    }
}
