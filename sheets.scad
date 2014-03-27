use <zipbox.scad>;
include <positions.scad>;

// top
translate([0,0,sheet_thickness/2+.05])
  color("lavender") difference() {
    box_side_zip([box[x],box[y]],[1,2,2,2]);

    //cube([box[x]-min_material_width*2,box[y]-min_material_width*2,sheet_thickness+1],center=true);
    cube([y_rod_pos[x]*2+linear_bearing_diam+ziptie_thickness*2,box[y]-min_material_width*2,sheet_thickness+1],center=true);
  }

// sides
  translate(left_sheet_pos) rotate([0,90*left,0])
    color("lightgreen") difference() {
      box_side_zip([box[z],box[y]],[2,1,2,1]);

      cube([box[z]-min_material_width*2,box[y]-min_material_width*2,sheet_thickness+1],center=true);
    }
  translate(right_sheet_pos) rotate([0,90*right,0])
    color("lightgreen") difference() {
      box_side_zip([box[z],box[y]],[2,1,2,1]);

      cube([box[z]-min_material_width*2,box[y]-min_material_width*2,sheet_thickness+1],center=true);
    }

// front
translate(front_sheet_pos) rotate([90,0,0])
  color("lightblue") difference() {
    box_side_zip([box[x],box[z]],[1,1,1,1]);
    cube([box[x]-min_material_width*2,box[z]-min_material_width*2,sheet_thickness+1],center=true);
  }

// rear
translate(rear_sheet_pos) rotate([90,0,0])
  box_side_zip([box[x],box[z]],[2,1,2,1]);

// bottom
translate(bottom_sheet_pos)
  color("orange") box_side_zip([box[x],box[y]],[1,2,2,2]);


