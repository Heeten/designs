
unit_length = 240;
unit_width = 75;
unit_height = 75;
thickness = 0.42 * 4;

outside_beam_width = 10;
inside_beam_width = outside_beam_width / 2.0;

triangle_base = thickness;
triangle_height = 0.75 * thickness;

module shared_inner_bottom_layer(num_units) {
    difference() {
        cube([num_units * unit_width, unit_length, thickness]);
        union() {
            for(i = [-500:50:500]) {
                translate([-20, i, 0])
                rotate([0, 0, -45])
                cube([27, 555, thickness]);
            }
        }
    }
}

module outer_bottom_layer() {    
    cube([inside_beam_width, unit_length, thickness]);
    
    color("green")
    cube([unit_width, outside_beam_width, thickness]);
    
    translate([unit_width - inside_beam_width, 0, 0])
    cube([inside_beam_width, unit_length, thickness]);
    
    color("green")
    translate([0, unit_length - inside_beam_width, 0])
    cube([unit_width, outside_beam_width, thickness]);    
}

module side_wall() {
    cube([thickness, unit_length, outside_beam_width]);
    
    translate([0, 0, unit_height - outside_beam_width])
    cube([thickness, unit_length, outside_beam_width]);
    
    cube([thickness, outside_beam_width, unit_height]);
    
    translate([0, unit_length - outside_beam_width, 0])
    cube([thickness, outside_beam_width, unit_height]);
    
    start = outside_beam_width + 35;
    stop = unit_length - 30;
    for(i = [start:45:stop]) {
        translate([0, i, 0])
        cube([thickness, 5, unit_height]);
    }
    
    // top groove
    color("green")
    rotate([-90, 180, 0])
    translate([-triangle_base, unit_height, 0])
    linear_extrude(unit_length)
    polygon(points = 
        [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);
}

module units() {
    shared_inner_bottom_layer(3);
    outer_bottom_layer();
    side_wall();

    translate([unit_width, 0, 0])
    outer_bottom_layer();

    translate([unit_width - thickness/2, 0, 0])
    side_wall();

    translate([2*unit_width, 0, 0])
    outer_bottom_layer();

    translate([2 * unit_width - thickness/2, 0, 0])
    side_wall();

    translate([3 * unit_width - thickness, 0, 0])
    side_wall();
}

difference() {
    units();
    
    // Bottom grooves
    union() {
        for (i = [0, -unit_width + thickness/2, -2*unit_width + thickness/2, -3*unit_width + thickness]) {
            color("blue")
            rotate([-90, 180, 0])
            translate([i-triangle_base, 0, 0])
            linear_extrude(unit_length)
            polygon(points = 
                [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);        
        }
    }
}

translate([inside_beam_width, 0, 0])
cube([outside_beam_width - inside_beam_width, unit_length, thickness]);

translate([-2, 0, 0])
cube([2, unit_length, thickness]);

translate([unit_width * 3, 0, 0])
cube([2, unit_length, thickness]);

translate([3*unit_width - outside_beam_width, 0, 0])
cube([outside_beam_width - inside_beam_width, unit_length, thickness]);
