holder_height_toothbrush = 30;
thickness = 1.5;

module hollow_cube(width, depth, height) {
    difference() {
        cube([width+2*thickness, depth+2*thickness, height]);
        
        translate([thickness, thickness, 0])
        cube([width, depth, height]);
    }
}

for( i = [0:3]) {
    translate([i * (35 + thickness), 0, 0])
    hollow_cube(35, 42, holder_height_toothbrush);
}

for( i = [0:3]) {
    translate([i * (25 + thickness) + 22, -25-thickness, 0])
    hollow_cube(25, 25, holder_height_toothbrush);
}