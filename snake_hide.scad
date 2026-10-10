// Oval snake hide, printed as two halves on a Bambu A1 (256 x 256 bed).
// No supports: every wall is <= 45 degrees, the roof is a short bridge,
// and the entrance is a circle with a flat-bridged top.
//
// Set `part` to "A" or "B" and export each half to STL.
// Pin the halves together with two short pieces of 1.75 mm filament.

part = "both"; // "A", "B", or "both" (assembled preview)

length = 480;          // outer length of the oval (x)
width = 240;           // outer width of the oval (y)
roof_width = 30;       // flat roof strip across the top (bridged)
wall = 4;              // horizontal wall thickness (~2.8 mm normal to the 45 deg slope)

entrance_width = 70;
entrance_height = 70;

lap = 8;               // how far the two halves overlap at the seam
clearance = 0.25;      // gap between mating lap surfaces
pin_d = 2.0;           // hole for 1.75 mm filament pin
pin_z = 12;

$fn = 120;

a = length / 2;
b = width / 2;
height = b - roof_width / 2;   // 45 deg slope from the base edge up to the roof strip

module oval(rx, ry) {
    scale([rx, ry]) circle(1);
}

// Solid dome shrunk inward by `inset`. Each horizontal slice loses the same
// amount from both semi-axes per unit of height, which keeps every surface
// at 45 degrees or steeper.
module dome(inset) {
    hull() {
        linear_extrude(0.01) oval(a - inset, b - inset);
        translate([0, 0, height - inset - 0.01])
            linear_extrude(0.01) oval(a - height, b - height);
    }
}

module shell() {
    difference() {
        dome(0);
        translate([0, 0, -0.01]) dome(wall);
    }
}

// Inner half of the wall: the lip on A that slides under B's outer half.
module inner_lip() {
    difference() {
        dome(wall / 2 + clearance / 2);
        translate([0, 0, -0.01]) dome(wall);
    }
}

// Outer half of the wall: the lip on B that covers A's inner lip.
module outer_lip() {
    difference() {
        dome(0);
        translate([0, 0, -0.01]) dome(wall / 2 - clearance / 2);
    }
}

module slab(x0, x1) {
    translate([x0, -b - 1, -1]) cube([x1 - x0, width + 2, height + 2]);
}

module teardrop(r) {
    hull() {
        circle(r);
        rotate(45) square(r);
    }
}

// Circle resting on the floor, with its top trimmed flat where it would
// overhang more than 45 degrees (a short bridge instead of supports).
module entrance() {
    r = entrance_width / 2;
    translate([a / 2, 0, 0])
    rotate([90, 0, 90])
    linear_extrude(a / 2 + 1)
    intersection() {
        translate([0, r - 1]) teardrop(r);  // dip below the floor so the edge isn't knife-thin
        translate([-r, -1]) square([entrance_width, entrance_height + 1]);
    }
}

module pin_holes() {
    translate([lap / 2, 0, pin_z])
        rotate([90, 0, 0]) cylinder(d = pin_d, h = width + 2, center = true, $fn = 24);
}

module half_a() {
    difference() {
        union() {
            intersection() { shell(); slab(-a - 1, 0); }
            intersection() { inner_lip(); slab(0, lap - clearance); }
        }
        pin_holes();
    }
}

module half_b() {
    difference() {
        union() {
            intersection() { shell(); slab(lap, a + 1); }
            intersection() { outer_lip(); slab(clearance, lap); }
        }
        pin_holes();
        entrance();
    }
}

if (part == "A") half_a();
else if (part == "B") half_b();
else {
    color("tan") half_a();
    color("peru") half_b();
}
