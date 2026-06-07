difference() {
    cylinder(h = 5, d = 20.4, $fn = 64);
    
    cylinder(h = 5, d = 16, $fn = 64);
}

translate([0, 0, 5])
difference() {
    cylinder(h = 50, d1 = 20.4, d2 = 5.7, $fn = 64);
    cylinder(h = 50, d1 = 16, d2 = 3, $fn = 64);
}