difference() {
    cylinder(h = 5, d = 20.4, $fn = 32);
    
    cylinder(h = 5, d = 18, $fn = 32);
}

translate([0, 0, 5])
difference() {
    cylinder(h = 40, d1 = 20.4, d2 = 5.7, $fn = 32);
    cylinder(h = 40, d1 = 18, d2 = 5, $fn = 32);
}