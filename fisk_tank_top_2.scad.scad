thickness = 3*0.45;
height = 6;

length = 420-220-5;
depth = 220;
beam_width = 5;

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

module without_holes() {
    mesh();
    cube([beam_width, depth, thickness]);
    cube([length, beam_width, thickness]);

    translate([length - beam_width, 0, 0])
    cube([beam_width, depth, thickness]);

    translate([0, depth - beam_width, 0])
    cube([length, beam_width, thickness]);
}

without_holes();