thickness = 3*0.45;
height = 6;

length = 420-220-5;
depth = 220;
beam_width = 5;

inner_beam_width = 6*0.45;

module mesh() {
    for(i = [-500:15:500]) {
        intersection() {
            cube([length, depth, thickness]);

            translate([0, i, 0])
            rotate([0, 0, -45])
            cube([thickness, 1000, thickness]);
        }    
        
        intersection() {
            cube([length, depth, thickness]);

            translate([0, i, 0])
            rotate([0, 0, -135])
            cube([thickness, 1000, thickness]);
        }
    }
}

difference() {
    mesh();
        union() {
        translate([50, depth - 50, 0])
        cube([200, 50, thickness]);
    }
}

cube([beam_width, depth, thickness]);

color("blue")
translate([-thickness, 0, -height])
cube([thickness, depth, height + thickness]);

color("blue")
translate([-thickness, -thickness, -height])
cube([length + 2*thickness, thickness, height + thickness]);

cube([length, beam_width, thickness]);

translate([length - beam_width, 0, 0])
cube([beam_width, depth-50, thickness]);

color("blue")
translate([length, 0, -height])
cube([thickness, depth-50, thickness + height]);

translate([0, depth - beam_width, 0])
cube([50, beam_width, thickness]);

translate([50 - inner_beam_width, depth - 50, 0])
cube([inner_beam_width, 50, thickness]);

translate([50 - inner_beam_width, depth - 50 - inner_beam_width, 0])
cube([length - 50, inner_beam_width, thickness]);