thickness = 5;
hole_width = 5;
hole_height = 15;

module peg2() {
    translate([0, 0, -4.5])
    cube([4.5, thickness, 4.5]);
    
    hull() {        
        translate([0, thickness, -4.5])
        cube([4.5, thickness, 4.5]);
        
        translate([4.5/2, thickness, -10])
        rotate([-90, 0, 0])
        cylinder(r = 4.5/2, h = thickness, $fn = 32);
    }
}

peg2();