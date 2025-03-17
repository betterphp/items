$fa = 1;
$fs = 1.75 / 2;

linear_extrude(height = 1)
scale([0.15, 0.15])
import(file = "glasses.svg", center = true);
