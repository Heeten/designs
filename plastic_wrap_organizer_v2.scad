unit_length = 240;
unit_width = 75;
unit_height = 75;
thickness = 2;

outside_beam_width = 15;

module inner_bottom_layer() {
    difference() {
        cube([unit_width, unit_length, thickness]);
        union() {
            for(i = [-50:50:(unit_length-20)]) {
                translate([-20, i, 0])
                rotate([0, 0, -45])
                cube([20, 555, thickness]);
            }
        }
    }
}

module bottom_layer() {
    inner_bottom_layer();
    
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
    
}

bottom_layer();
side_wall();