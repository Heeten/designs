triangle_base = 2;
triangle_height = 1.5;
thickness = 2;

module plane(plane_top_width, plane_bottom_width, plane_width) {
    for(i = [30:25:224]) {
        translate([0, i, 0])
        color("red")
        cube([plane_width, 10, thickness]);
    }
    color("pink")
    translate([0, 0, 0])
    cube([plane_bottom_width,252,thickness]);
    
    translate([67, 0, 0])
    cube([plane_top_width,252,thickness]);
    
    color("blue")
    translate([0, 0, 0])
    cube([plane_width,15,thickness]);
    
    color("blue")
    translate([0, 237, 0])
    cube([plane_width,15,thickness]);
}

module plane_with_grooves() {
    difference() {
        plane(10, 10, 75);
        union() {
            color("green")
            rotate([-90, 180, 0])
            translate([-4, 0, 0])
            linear_extrude(252)
                polygon(points = [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);

            color("green")
            rotate([-90, 180, 0])
            translate([-75, 0, 0])
            linear_extrude(252)
                polygon(points = [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);
        }
    }
}

module unit() {
    rotate([0, 90, 0])
    translate([-74, 0, 2])
    plane(5, 10, 72);

    rotate([0, 90, 0])
    translate([-74, 0, 73])
    plane(5, 10, 72);

    plane_with_grooves();
    
    color("orange")
            rotate([-90, 180, 0])
            translate([-4, 74, 0])
            linear_extrude(252)
                polygon(points = [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);

    color("orange")
            rotate([-90, 180, 0])
            translate([-75, 74, 0])
            linear_extrude(252)
                polygon(points = [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);
}

unit();

translate([71, 0, 0])
unit();

translate([142, 0, 0])
unit();