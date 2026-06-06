// Skadis Parameters
hole_spacing = 40;

// Hook Parameters
hook_body_length = 30;
hook_thickness = 4.3;

hook_outer_radius = 4.7;
hook_bend_angle = 167.4;
hook_tip_length = 4.5;
inferior_hook_length = 2;
inferior_support_offset = 26.513;

// Hook Support Parameters
include_extra_support = true;

thickness = 0.45*3;

// Hook Module
module hook(include_support) {
    // Outer curve
    rotate([90, 0, 180])
    rotate_extrude(angle = hook_bend_angle)
    translate([hook_outer_radius, 0, 0])
    circle(hook_thickness / 2);

    // Hook body and tip
    if (include_support) {
        translate([-hook_outer_radius, 0, -hook_body_length])
        cylinder(h = hook_body_length, r = hook_thickness / 2);

        translate([-hook_outer_radius, 0, -hook_body_length])
        sphere(r = hook_thickness / 2);
    } 

    // Hook tip
    rotate([0, hook_bend_angle, 0])
    translate([-hook_outer_radius, 0, 0])
    linear_extrude(height = hook_tip_length)
    circle(hook_thickness / 2);

    // Tip endpoint sphere
    x_coord = sqrt((hook_tip_length^2) + (hook_outer_radius^2)) * cos(atan(hook_tip_length / hook_outer_radius) - (180 - hook_bend_angle));
    z_coord = -sqrt((hook_tip_length^2) + (hook_outer_radius^2)) * sin(atan(hook_tip_length / hook_outer_radius) - (180 - hook_bend_angle));
    translate([x_coord, 0, z_coord])
    sphere(r = hook_thickness / 2);

    if (include_support) {
        translate([-hook_thickness, 0, -inferior_support_offset])
        rotate([0, 90, 0])
        cylinder(h = inferior_hook_length + hook_thickness / 2, r = hook_thickness / 2);

        translate([inferior_hook_length - hook_thickness / 2, 0, -inferior_support_offset])
        sphere(r = hook_thickness / 2);
    }
}


module create_hooks(bin_width, bin_depth, number_of_hooks) {
    hook_offset = (bin_width - hole_spacing * (number_of_hooks - 1)) / 2;

    for (i = [0 : number_of_hooks - 1]) {
        translate([i * hole_spacing + hook_offset, -hook_outer_radius + hook_thickness / 2, bin_depth - hook_outer_radius - hook_thickness / 2])
        rotate([0, 0, -90])
        hook(include_extra_support);
    }
}

module mesh(width, depth) {
    cube([width, thickness, thickness]);
    
    translate([0, depth - thickness, 0])
    cube([width, thickness, thickness]);
    
    cube([thickness, depth, thickness]);
    
    translate([width - thickness, 0, 0])
    cube([thickness, depth, thickness]);
    
    cube([width, thickness, thickness]);
    for(i = [-500:15:500]) {
        intersection() {
            cube([width, depth, thickness]);

            translate([0, i, 0])
            rotate([0, 0, -45])
            cube([thickness, 1000, thickness]);
        }    
        
        intersection() {
            cube([width, depth, thickness]);

            translate([0, i, 0])
            rotate([0, 0, -135])
            cube([thickness, 1000, thickness]);
        }
    }
}

difference() {
    translate([0, -4, 0])
    create_hooks(100, 37, 2);
    
    translate([0, -50, -10])
    cube([100, 100, 10]);
}

rotate([90, 0, 0])
mesh(100, 50);

*rotate([0, -90, 0])
mesh(50, 50);

*rotate([0, -90, 0])
translate([0, 0, -100+thickness])
mesh(50, 50);

translate([0, 50, 0])
rotate([90, 0, 0])
mesh(100, 50);

mesh(100, 50);