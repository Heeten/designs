difference() {
    cylinder(h = 5, d = 20.4, $fn = 64);
    
    cylinder(h = 5, d = 20.4-(3*0.45), $fn = 64);
}

translate([0, 0, 5])
difference() {
    cylinder(h = 50, d1 = 20.4, d2 = 5.7, $fn = 64);
    cylinder(h = 50, d1 = 20.4-(3*0.45), d2 = 5.7-0.45, $fn = 64);
}

translate([0, 0, 55])
difference() {
    cylinder(h = 2.5, d = 5.7, $fn = 64);
    cylinder(h = 2.5, d = 5.7-0.45, $fn = 64);
}