thickness = 4*0.45;

intersection() {
    cube([220, 220, thickness]);

    union() {
        for(i = [-500:15:500]) {
            translate([0, i, 0])
            rotate([0, 0, -45])
            cube([thickness, 1000, thickness]);
            
            translate([0, i, 0])
            rotate([0, 0, -135])
            cube([thickness, 1000, thickness]);
        }
    }
}

cube([10, 220, thickness]);
cube([220, 10, thickness]);

translate([0, 220-10, 0])
cube([220, 10, thickness]);

translate([220-10, 0, 0])
cube([10, 220, thickness]);

translate([15, 100, 0])
linear_extrude(height = thickness)
text("Squirtle", size = 40);
