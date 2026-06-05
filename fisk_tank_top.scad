thickness = 3*0.45;
height = 6;


for(i = [-500:15:500]) {
    intersection() {
        cube([220, 220, thickness]);

        translate([0, i, 0])
        rotate([0, 0, -45])
        cube([thickness, 1000, thickness]);
    }    
    
    intersection() {
        cube([220, 220, thickness]);

        translate([0, i, 0])
        rotate([0, 0, -135])
        cube([thickness, 1000, thickness]);
    }
}

color("blue")
translate([-thickness, 0, -height])
cube([thickness, 220, height + thickness]);


color("blue")
translate([-thickness, -thickness, -height])
cube([220 + thickness, thickness, height + thickness]);

color("blue")
translate([-thickness, 220, -height])
cube([220 + thickness, thickness, height + thickness]);

cube([10, 220, thickness]);
cube([220, 10, thickness]);

translate([0, 220-10, 0])
cube([220, 10, thickness]);

translate([220-10, 0, 0])
cube([10, 220, thickness]);

translate([15, 100, 0])
linear_extrude(height = thickness)
text("Squirtle", size = 40);
