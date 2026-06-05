thickness = 3*0.45;
height = 6;

length = 220;
beam_width = 5;


for(i = [-500:15:500]) {
    intersection() {
        cube([length, length, thickness]);

        translate([0, i, 0])
        rotate([0, 0, -45])
        cube([thickness, 1000, thickness]);
    }    
    
    intersection() {
        cube([length, length, thickness]);

        translate([0, i, 0])
        rotate([0, 0, -135])
        cube([thickness, 1000, thickness]);
    }
}

color("blue")
translate([-thickness, 0, -height])
cube([thickness, length, height + thickness]);


color("blue")
translate([-thickness, -thickness, -height])
cube([length + thickness, thickness, height + thickness]);

color("blue")
translate([-thickness, length, -height])
cube([length + thickness, thickness, height + thickness]);

cube([beam_width, length, thickness]);
cube([length, beam_width, thickness]);

translate([0, length-beam_width, 0])
cube([length, beam_width, thickness]);

translate([length-beam_width, 0, 0])
cube([beam_width, length, thickness]);

translate([7, 90, 0])
linear_extrude(height = thickness)
text("Squirtle", size = 45);
