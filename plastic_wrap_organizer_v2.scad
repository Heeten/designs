
unit_length = 240;
unit_width = 75;
unit_height = 75;
thickness = 2;

outside_beam_width = 10;

triangle_base = 2;
triangle_height = 1.5;

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
    cube([outside_beam_width, unit_length, thickness]);
    
    color("green")
    cube([unit_width, outside_beam_width, thickness]);
    
    translate([unit_width - outside_beam_width, 0, 0])
    cube([outside_beam_width, unit_length, thickness]);
    
    color("green")
    translate([0, unit_length - outside_beam_width, 0])
    cube([unit_width, outside_beam_width, thickness]);    
}

module side_wall() {
    cube([thickness, unit_length, outside_beam_width]);
    
    translate([0, 0, unit_height - outside_beam_width])
    cube([thickness, unit_length, outside_beam_width]);
    
    cube([thickness, outside_beam_width, unit_height]);
    
    translate([0, unit_length - outside_beam_width, 0])
    cube([thickness, outside_beam_width, unit_height]);
    
    start = outside_beam_width + 10;
    stop = unit_length - outside_beam_width - 5;
    for(i = [start:40:stop]) {
        translate([0, i, 0])
        cube([thickness, 5, unit_height]);
    }
    
    // top groove
    color("green")
    rotate([-90, 180, 0])
    translate([-triangle_base, unit_height, 0])
    linear_extrude(unit_length)
                polygon(points = [[0, 0], [triangle_base, 0], [triangle_base/2, triangle_height]]);
}

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
