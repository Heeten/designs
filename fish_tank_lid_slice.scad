// Fit test for a two-piece fish tank lid (Bambu A1, 256 x 256 bed).
//
// The full lid drops INSIDE the tank's plastic rim and rests on the ledge
// there, instead of sitting on top of the rim. That keeps it under 256 mm
// wide, so the whole lid is just two halves that overlap in the middle.
// Half B lifts straight out (for feeding); half A stays put.
//
// By default this prints a small coupon of each half: the corner where the
// seam meets one side wall (50 mm of width, 40 mm each side of the seam).
// The left end (x = 0) is the real lid edge. Snap A and B together, then
// hold that edge down on the ledge against the side wall to check:
//   - it sits on the ledge without rocking, and the ledge is wide enough,
//   - how the top sits relative to the top of the rim,
//   - the overlap seam lines up flush and B lifts off easily.
// Set test_w = lid_w to print a full-width strip instead, which also checks
// the overall width and how much it sags.
//
// Set `part` to "A" or "B" and export each to STL. Both print flat with no
// supports. B is laid out upside down so its overlap lip is on the bed.

part = "both"; // "A", "B", or "both" (assembled preview with a ghost rim)

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

// Just enough of the rim to see how the piece sits: wall plus ledge.
// The lid's underside (z = 0) rests on the ledge top.
module ghost_rim(len) {
    y0 = -len - 10;
    yl = 2*len + 20;
    walls   = test_w < lid_w ? [-edge_gap - 5] : [-edge_gap - 5, lid_w + edge_gap];
    ledges  = test_w < lid_w ? [-edge_gap]     : [-edge_gap, lid_w + edge_gap - ledge_w];
    for (x = walls)  translate([x, y0, -3]) cube([5, yl, ledge_drop + 3]);  // wall up to the rim top
    for (x = ledges) translate([x, y0, -3]) cube([ledge_w, yl, 3]);         // ledge
}

if (part == "A") {
    // Print top-up; tongue is already on the bed.
    translate([0, slice_len, 0]) half_A(test_w, slice_len);
} else if (part == "B") {
    // Flip so the lip is on the bed; the lid's top face prints against the plate.
    translate([0, 0, t]) mirror([0, 0, 1]) translate([0, lap/2 - seam_gap, 0]) half_B(test_w, slice_len);
} else {
    color("SteelBlue") half_A(test_w, slice_len);
    color("Orange") half_B(test_w, slice_len);
    %ghost_rim(slice_len);
}
