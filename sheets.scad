use <zipbox.scad>;
include <config.scad>;
include <positions.scad>;

// top
translate([0,0,sheet_thickness/2+.05])
  color("lavender") difference() {
    union() {
      box_side_zip([box[x],box[y]],[1,1,2,1]);

      for(side=[left,right]) {
        for(end=[front,rear]) {
          translate([(box[x]/2+sheet_thickness/2+linear_bearing_diam/2)*side,(box[y]/2+sheet_thickness-min_material_width/2)*end,0])
            cube([linear_bearing_diam+sheet_thickness*2+0.1,min_material_width,sheet_thickness],center=true);
        }
      }
    }

    cube([build[x]+15,box[y]-min_material_width*2,sheet_thickness+1],center=true);
  }

// sides
  translate([-0.05,0,0])
  translate(left_sheet_pos) rotate([0,90*left,0])
    color("green") difference() {
      box_side_zip([box[z],box[y]],[2,2,2,1]);

      cube([box[z]-min_material_width*2,box[y]-min_material_width*2,sheet_thickness+1],center=true);
    }
  translate([0.05,0,0])
  translate(right_sheet_pos) rotate([0,90*right,0])
    color("green") difference() {
      box_side_zip([box[z],box[y]],[2,1,2,2]);

      cube([box[z]-min_material_width*2,box[y]-min_material_width*2,sheet_thickness+1],center=true);
    }

// front
translate([0,-0.05,0])
translate(front_sheet_pos) rotate([90,0,0])
  color("lightblue") difference() {
    box_side_zip([box[x],box[z]],[1,1,1,1]);
    cube([box[x]-min_material_width*2,box[z]-min_material_width*2,sheet_thickness+1],center=true);
  }

// rear
translate([0,0.05,0])
translate(rear_sheet_pos) rotate([90,0,0])
  box_side_zip([box[x],box[z]],[2,1,2,1]);

// bottom
translate([0,0,-0.05])
translate(bottom_sheet_pos)
  color("orange") box_side_zip([box[x],box[y]],[1,2,2,2]);


