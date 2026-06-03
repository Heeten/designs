thickness = 5 * 0.45;

difference() {
    cube([22+2*thickness, 35+2*thickness, 30]);
    
    translate([thickness, thickness, 0])
    cube([22, 35, 30]);
}

color("red")
translate([-thickness, -35/2 - thickness, 0])
cube([thickness, 77, 77]);

color("blue")
translate([-thickness-2, -35/2 - thickness, 0])
cube([2, 2, 77]);

color("blue")
translate([-thickness-2, 77 - 35/2 - 2 - thickness , 0])
cube([2, 2, 77]);


color("orange")
translate([-thickness-2, -35/2 - thickness, 0])
cube([2, 77, 2]);

color("orange")
translate([-thickness-2, -35/2 - thickness, 75])
cube([2, 77, 2]);