
unit_height = 2;
unit_width = 160;

groove_spacing = 65.16;

unit_depth = 27+4.39+groove_spacing+36;

thickness = 1.8;
groove_depth = 3;

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
