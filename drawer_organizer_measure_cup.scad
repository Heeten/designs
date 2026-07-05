thickness = 1.8;

unit_height = 57.4+thickness;
unit_width = 188;

bar_width = 16;
bar_grip_height = 5;

groove_spacing = 65.16;

unit_depth = 27+4.39+groove_spacing+36;

groove_depth = 2.8;

cube([thickness, unit_depth, unit_height]);

translate([-groove_depth, 27.1, 0])
cube([groove_depth + thickness, 4.2, unit_height]);

translate([-groove_depth, 27+4.39+groove_spacing+.1, 0])
cube([groove_depth + thickness, 4.2, unit_height]);

cube([unit_width, thickness, unit_height]);

translate([0, unit_depth, 0])
cube([unit_width, thickness, unit_height]);

translate([unit_width-thickness, 0, 0])
cube([thickness, 27+4.39+groove_spacing+36, unit_height]);

translate([unit_width-thickness, 27.1, 0])
cube([groove_depth + thickness, 4.2, unit_height]);

translate([unit_width-thickness, 27+4.39+groove_spacing+.1, 0])
cube([groove_depth + thickness, 4.2, unit_height]);

color("blue")
translate([-bar_width, 0, unit_height-thickness])
cube([bar_width+thickness, unit_depth, thickness]);

color("green")
translate([-bar_width-thickness, 0, unit_height-bar_grip_height-thickness])
cube([thickness, unit_depth, bar_grip_height+thickness]);

color("blue")
translate([unit_width-thickness, 0, unit_height-thickness])
cube([bar_width+thickness, unit_depth, thickness]);

color("green")
translate([unit_width+bar_width-thickness, 0, unit_height-bar_grip_height-thickness])
cube([thickness, unit_depth, bar_grip_height+thickness]);
