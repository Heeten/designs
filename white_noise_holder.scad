thickness = 5 * 0.45;

difference() {
    cube([22+2*thickness, 35+2*thickness, 10]);
    
    translate([thickness, thickness, 0])
    cube([22, 35, 30]);
}