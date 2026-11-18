// Fit test for a two-piece fish tank lid (Bambu A1, 256 x 256 bed).
//
// The full lid drops INSIDE the tank's plastic rim and rests on the ledge
// there, instead of sitting on top of the rim. That keeps it under 256 mm
// wide, so the whole lid is just two halves that overlap in the middle.
// Half B lifts straight out (for feeding); half A stays put.
//
// part = "fit" (default) prints one plain strip that spans the full distance
// front to back inside the rim, at the real lid thickness, but only
// fit_len wide. Drop it into the tank to check:
//   - it fits between the front and back walls without binding or rattling,
//   - both ends sit flat on the ledge with enough overlap,
//   - how its top sits relative to the top of the rim.
//
// part = "A" / "B" print small coupons of the two halves at the seam
// (test_w wide) to check the overlap joint. Set test_w = lid_w for full-width
// strips. B is laid out upside down so its overlap lip is on the bed.
//
// Everything prints flat with no supports.

part = "fit"; // "fit", "A", "B", or "both" (A + B assembled); previews show a ghost rim

// ---- Measure your tank (these are guesses for a standard 10-gallon) ----
rim_inner_w = 250;  // across the short way, between the rim's inside walls, just above the ledge
ledge_w     = 8;    // how far the ledge sticks inward from that wall
ledge_drop  = 6;    // how far the ledge sits below the top of the rim

// ---- Fit ----
edge_gap = 1.0;     // gap between lid and rim wall, each side
seam_gap = 0.3;     // gap inside the overlap seam

// ---- Lid ----
t        = 3.2;     // lid thickness (16 layers at 0.2 mm)
frame_w  = 8;       // solid border around each piece
rib      = 3*0.45;  // mesh rib width (3 lines, same as the old lid)
pitch    = 15;      // mesh spacing (same diamond pattern as the old lid)
lap      = 12;      // how far the two halves overlap at the seam

// ---- How much to print ----
fit_len   = 30;     // how wide the fit strip is (along the tank's length)
test_w    = 50;     // width of the coupon from the side wall; lid_w for a full-width strip
slice_len = 40;     // how much of each half to print, measured from the seam

bed = 256;

lid_w = rim_inner_w - 2*edge_gap;
worst_overlap = ledge_w - 2*edge_gap;  // lid shoved hard against one wall

echo(str("Lid width: ", lid_w, " mm"));
echo(str("Ledge overlap: ", ledge_w - edge_gap, " mm centred, ",
         worst_overlap, " mm on the far side if shoved to one wall"));
assert(lid_w <= bed - 4, "Lid is too wide for the A1 bed: two pieces won't work");
assert(worst_overlap >= 3, "Too little ledge overlap: shrink edge_gap");
assert(test_w <= lid_w, "test_w can't be wider than the lid");

// Diamond holes on a 45 degree grid; perpendicular rib spacing is pitch/sqrt(2).
module diamonds(w, l) {
    d = pitch / sqrt(2) - rib;
    for (j = [0 : ceil(l / (pitch/2)) + 1])
        for (i = [-1 : ceil(w / pitch) + 1])
            translate([i*pitch + (j % 2)*pitch/2, j*pitch/2])
                rotate(45) square(d, center = true);
}

// Flat mesh panel w x l with a solid border, lying at the origin.
module panel(w, l) {
    linear_extrude(t)
    difference() {
        square([w, l]);
        intersection() {
            translate([frame_w, frame_w]) square([w - 2*frame_w, l - 2*frame_w]);
            diamonds(w, l);
        }
    }
}

// Seam is the line y = 0, running across the tank's width.
// A sits at y < 0 and has a lower tongue reaching across the seam.
// B sits at y > 0 and has an upper lip that rests on A's tongue.
module half_A(w, len) {
    translate([0, -len, 0]) panel(w, len - lap/2);
    translate([0, -lap/2 - frame_w, 0])
        cube([w, frame_w + lap - seam_gap, t/2]);
}

module half_B(w, len) {
    translate([0, lap/2, 0]) panel(w, len - lap/2);
    translate([0, -lap/2 + seam_gap, t/2])
        cube([w, lap - seam_gap + frame_w, t/2]);
}

// Just enough of the rim to see how a piece sits: walls plus ledges.
// The lid's underside (z = 0) rests on the ledge tops.
module ghost_rim(y0, yl, both_sides) {
    walls  = both_sides ? [-edge_gap - 5, lid_w + edge_gap] : [-edge_gap - 5];
    ledges = both_sides ? [-edge_gap, lid_w + edge_gap - ledge_w] : [-edge_gap];
    for (x = walls)  translate([x, y0, -3]) cube([5, yl, ledge_drop + 3]);  // wall up to the rim top
    for (x = ledges) translate([x, y0, -3]) cube([ledge_w, yl, 3]);         // ledge
}

if (part == "fit") {
    panel(lid_w, fit_len);
    %ghost_rim(-10, fit_len + 20, true);
} else if (part == "A") {
    // Print top-up; tongue is already on the bed.
    translate([0, slice_len, 0]) half_A(test_w, slice_len);
} else if (part == "B") {
    // Flip so the lip is on the bed; the lid's top face prints against the plate.
    translate([0, 0, t]) mirror([0, 0, 1]) translate([0, lap/2 - seam_gap, 0]) half_B(test_w, slice_len);
} else {
    color("SteelBlue") half_A(test_w, slice_len);
    color("Orange") half_B(test_w, slice_len);
    %ghost_rim(-slice_len - 10, 2*slice_len + 20, test_w >= lid_w);
}
