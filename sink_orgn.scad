// SKÅDIS Pegboard - OpenSCAD
// Dimensions: 160x280x5mm

width = 160;
height = 80;
thickness = 5;
hole_width = 5;
hole_height = 15;
board_radius = 8;

translate([10, 0, 0])
cube([40, thickness, 55]);


translate([width - 40 - 10, 0, 0])
cube([40, thickness, 55]);


module board() {
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
        
        for(y = [20.0:40:height-20]) {
            for(x = [20:40:width-20]) {
                translate([x, y, -0.5])
                hull() {
                translate([0, -5.00, 0])
                    cylinder(r=2.50, h=6, $fn=16);
                translate([0, 5.00, 0])
                    cylinder(r=2.50, h=6, $fn=16);
                }
            }
        }
        
        for(y = [40.0:40:height-20]) {
            for(x = [40:40:width-20]) {
                translate([x, y, -0.5])
                hull() {
                translate([0, -5.00, 0])
                    cylinder(r=2.50, h=6, $fn=16);
                translate([0, 5.00, 0])
                    cylinder(r=2.50, h=6, $fn=16);
                }
            }
        }
        
    }
}

board();

translate([0, 0, 55])
board();