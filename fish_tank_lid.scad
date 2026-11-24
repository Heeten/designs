// Two-piece fish tank lid (Bambu A1, 256 x 256 bed).
//
// The lid drops INSIDE the tank's plastic rim and rests on the ledge there.
// The two halves overlap in the middle: B's upper lip rests on A's lower
// tongue, so the top is flush and the rim keeps them from sliding apart.
// Lift B out by its finger hole for feeding; A comes out after.
//
// Set `part` to "A" or "B" and export each to STL. Both print flat with no
// supports. B is laid out upside down so its overlap lip is on the bed.
//
// Coordinates: x runs along the tank's length, y front to back, z up.
// The back edge is y = lid_w.

part = "both"; // "A", "B", or "both" (assembled preview with a ghost rim)

// ---- Tank ----
tank_w = 270;       // outside, front to back
tank_l = 515;       // outside, end to end
// The fit-test strip (fish_tank_lid_slice.scad) confirmed 250 mm wall to wall
// across the short way, so the rim takes 20 mm off the outside size.
rim_inner_w = 250;
rim_inner_l = tank_l - (tank_w - rim_inner_w);
ledge_w     = 8;    // how far the ledge sticks inward from the wall
ledge_drop  = 6;    // how far the ledge sits below the top of the rim (preview only)

// ---- Fit ----
side_gap = 1.0;     // gap to the front and back walls (what the fit strip used)
end_gap  = 2.5;     // gap to each end wall; bigger in case the 515 was rounded up
seam_gap = 0.3;     // gap inside the overlap seam

// ---- Lid ----
t        = 3.2;     // lid thickness (16 layers at 0.2 mm)
frame_w  = 8;       // solid border around each half
rib      = 3*0.45;  // mesh rib width (3 lines, same as the old lid)
pitch    = 15;      // mesh spacing (same diamond pattern as the old lid)
lap      = 12;      // how far the two halves overlap at the seam
corner_r = 10;      // outer corner radius, so it clears the rim's inside corners
finger_d = 25;      // lifting hole near each half's outer end
finger_x = 35;      // distance of that hole's centre from the end of the lid

// Cutouts in the back edge for a filter, cords, etc. Each is
// [centre measured from the left end, width, depth].
// One notch for two cords side by side, on half A (the half that stays put)
// so lifting B out for feeding doesn't disturb them.
notches = [[60, 30, 15]];

bed = 256;

lid_l = rim_inner_l - 2*end_gap;
lid_w = rim_inner_w - 2*side_gap;
seam_x = lid_l / 2;
a_len = seam_x + lap/2 - seam_gap;          // length of half A on the bed
b_len = lid_l - (seam_x - lap/2 + seam_gap); // length of half B on the bed

echo(str("Lid: ", lid_l, " x ", lid_w, " mm"));
echo(str("Half A: ", a_len, " x ", lid_w, " mm; half B: ", b_len, " x ", lid_w, " mm"));
assert(max(a_len, lid_w) <= bed - 2, "Half A is too big for the A1 bed");
assert(max(b_len, lid_w) <= bed - 2, "Half B is too big for the A1 bed");

// ---------- 2D ----------

module outline() {
    difference() {
        offset(r = corner_r) offset(delta = -corner_r) square([lid_l, lid_w]);
        for (n = notches)
            translate([n[0] - n[1]/2, lid_w - n[2]]) square([n[1], n[2] + 1]);
    }
}

// Strip of the outline between x0 and x1.
module band(x0, x1) {
    intersection() {
        outline();
        translate([x0, -1]) square([x1 - x0, lid_w + 2]);
    }
}

// Diamond holes on a 45 degree grid; perpendicular rib spacing is pitch/sqrt(2).
module diamonds() {
    d = pitch / sqrt(2) - rib;
    for (j = [0 : ceil(lid_w / (pitch/2)) + 1])
        for (i = [-1 : ceil(lid_l / pitch) + 1])
            translate([i*pitch + (j % 2)*pitch/2, j*pitch/2])
                rotate(45) square(d, center = true);
}

// Full-thickness part of a half: mesh inside a solid border, with a finger hole.
module half_body(x0, x1, hole_x) {
    difference() {
        band(x0, x1);
        intersection() {
            difference() {
                offset(delta = -frame_w) band(x0, x1);
                translate([hole_x, lid_w/2]) circle(d = finger_d + 2*frame_w, $fn = 64);
            }
            diamonds();
        }
        translate([hole_x, lid_w/2]) circle(d = finger_d, $fn = 64);
    }
}

// ---------- 3D ----------

module half_A() {
    body_end = seam_x - lap/2;
    linear_extrude(t) half_body(0, body_end, finger_x);
    linear_extrude(t/2) band(body_end - frame_w, seam_x + lap/2 - seam_gap);  // lower tongue
}

module half_B() {
    body_start = seam_x + lap/2;
    linear_extrude(t) half_body(body_start, lid_l, lid_l - finger_x);
    translate([0, 0, t/2])
        linear_extrude(t/2) band(seam_x - lap/2 + seam_gap, body_start + frame_w);  // upper lip
}

// The rim as seen from inside: walls all round, with the ledge the lid sits on.
module ghost_rim() {
    module inner() translate([-end_gap, -side_gap]) square([rim_inner_l, rim_inner_w]);
    translate([0, 0, -3]) linear_extrude(ledge_drop + 3) difference() { offset(delta = 5) inner(); inner(); }
    translate([0, 0, -3]) linear_extrude(3) difference() { inner(); offset(delta = -ledge_w) inner(); }
}

if (part == "A") {
    // Print top-up; the tongue is already on the bed.
    half_A();
} else if (part == "B") {
    // Flip so the lip is on the bed; the lid's top face prints against the plate.
    translate([0, 0, t]) mirror([0, 0, 1])
        translate([-(seam_x - lap/2 + seam_gap), 0, 0]) half_B();
} else {
    color("SteelBlue") half_A();
    color("Orange") half_B();
    %ghost_rim();
}
