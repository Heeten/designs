// SKÅDIS Pegboard - OpenSCAD
// Dimensions: 160x280x5mm

width = 160;
height = 280;
thickness = 5;
hole_width = 5;
hole_height = 15;
board_radius = 8;
screw_hole_diameter = 5;
screw_hole_inset = 10;

cube([40, thickness, 55]);

translate([0, 0, 55-thickness])
cube([40, 30, thickness]);

translate([120, 0, 0])
cube([40, thickness, 55]);

translate([120, 0, 55-thickness])
cube([40, 30, thickness]);

difference() {
    hull() {
        translate([board_radius, board_radius, 0])
            cylinder(r=board_radius, h=thickness, $fn=32);
        translate([width-board_radius, board_radius, 0])
            cylinder(r=board_radius, h=thickness, $fn=32);
        translate([board_radius, height-board_radius, 0])
            cylinder(r=board_radius, h=thickness, $fn=32);
        translate([width-board_radius, height-board_radius, 0])
            cylinder(r=board_radius, h=thickness, $fn=32);
    }
    
    translate([20.00, 20.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([40.00, 40.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([20.00, 60.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([40.00, 80.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([20.00, 100.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([40.00, 120.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([20.00, 140.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([40.00, 160.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([20.00, 180.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([40.00, 200.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([20.00, 220.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([40.00, 240.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([20.00, 260.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 20.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([80.00, 40.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 60.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([80.00, 80.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 100.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([80.00, 120.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 140.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([80.00, 160.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 180.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([80.00, 200.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 220.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([80.00, 240.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([60.00, 260.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 20.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([120.00, 40.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 60.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([120.00, 80.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 100.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([120.00, 120.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 140.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([120.00, 160.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 180.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([120.00, 200.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 220.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([120.00, 240.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([100.00, 260.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 20.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 60.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 100.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 140.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 180.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 220.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
    translate([140.00, 260.00, -0.5])
        hull() {
            translate([0, -5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
            translate([0, 5.00, 0])
                cylinder(r=2.50, h=6, $fn=16);
        }
}