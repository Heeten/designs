difference() {
    cylinder(h = 5, d = 20.4, $fn = 64);
    
    cylinder(h = 5, d = 20.4-(4*0.45), $fn = 64);
}

translate([0, 0, 5])
difference() {
    cylinder(h = 30, d1 = 20.4, d2 = 9.7, $fn = 64);
    cylinder(h = 30, d1 = 20.4-(4*0.45), d2 = 9.7-(4*0.45), $fn = 64);
}
