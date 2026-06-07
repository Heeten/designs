thickness = 5;
hole_width = 5;
hole_height = 15;

module peg() {
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

module mesh(width, depth, beam_width) {
    cube([width, beam_width, thickness]);
    
    translate([0, depth - beam_width, 0])
    cube([width, beam_width, thickness]);

    cube([beam_width, depth, thickness]);
    
    translate([width - beam_width, 0, 0])
    cube([beam_width, depth, thickness]);
    
    cube([width, beam_width, thickness]);
    
    for(i = [-500:thickness*5:500]) {
        intersection() {
            cube([width, depth, thickness]);

            translate([0, i, 0])
            rotate([0, 0, -45])
            cube([thickness, 1000, thickness]);
        }    
        intersection() {
            cube([width, depth, thickness]);

            translate([0, i, 0])
            rotate([0, 0, -135])
            cube([thickness, 1000, thickness]);
        }
    }
}

peg();

translate([40, 0, 0])
peg();

mesh(160, 50, 6);