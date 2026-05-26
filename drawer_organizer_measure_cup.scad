
unit_height = 10;
unit_width = 160;
thickness = 1.8;
groove_depth = 3;

cube([thickness, 27+4.39+73+36, unit_height]);

translate([-groove_depth, 27.1, 0])
cube([groove_depth + thickness, 4.2, unit_height]);

translate([-groove_depth, 27+4.39+73.69+.1, 0])
cube([groove_depth + thickness, 4.2, unit_height]);

*cube([unit_width, thickness, unit_height]);