module box_side_zip(dimensions=[0,0],sides=[0,0,0,0],thickness=6) {
  // TODO: compensate for laser cutter kerf
  // TODO: clean up slivers at corner

  IS_NONE = 0;
  IS_TAB  = 1;
  IS_SLOT = 2;

  ziptie_width=3.5;
  ziptie_thickness=1.5;

  module tabs_for_line(to_fill=0,offset=0) {
    min_tab_len = 35;
    num_fit     = floor(to_fill/min_tab_len);
    // ensure we have an odd number of spaces
    num_tabs    = (num_fit % 2) ? num_fit : num_fit+1;
    tab_len     = to_fill / num_tabs;

    translate([(-to_fill/2-tab_len/2)+(tab_len*offset),0,0]) {
      for(i=[1-offset:num_tabs-offset]) {
        render() translate([i*tab_len,0,0]) {
          for(side=[-1,1]) {
            translate([0,(thickness/2+4)*side,0])
              cube([ziptie_width,ziptie_thickness,thickness+0.05],center=true);
          }
        }
      }

      for(i=[0:num_tabs/2+1-offset]) {
        translate([i*tab_len*2,0,0]) {
          render() cube([tab_len,thickness,thickness+0.05],center=true);
        }
      }
    }
  }

  function len_for_side(side)    = dimensions[side%2] + thickness * 2 - 0.05;
  function offset_for_side(side) = (dimensions[1-side%2] + thickness)/2;

  module base_sheet(){
    cube([len_for_side(0),len_for_side(1),thickness],center=true);
  }

  difference() {
    base_sheet();

    for(side=[0,1,2,3]) {
      rotate([0,0,-90*side]) {

        // trim if no tab/slot
        if (sides[side] == IS_NONE) {
          translate([0,offset_for_side(side),0])
            cube([len_for_side(side)+1,thickness,thickness+1],center=true);
        }

        // if tab, skip the corner
        if (sides[side] == IS_TAB) {
          translate([0,offset_for_side(side),0])
            tabs_for_line(len_for_side(side)-thickness*2);
        }

        // if slot, make sure corner is clipped
        if (sides[side] == IS_SLOT) {
          translate([0,offset_for_side(side),0])
            tabs_for_line(len_for_side(side)-thickness*2,1);
        }
      }
    }
  }
}

x = 0;
y = 1;
z = 2;
box = [200,200,200];
thickness = 6;
min_material_width = 25;

// top
translate([0,0,thickness/2+.5])
  color("lavender") difference() {
    box_side_zip([box[x],box[y]],[1,2,2,2]);

    cube([box[x]-min_material_width*2,box[y]-min_material_width*2,thickness+1],center=true);
  }

// sides
for(side=[-1,1]) {
  translate([(box[x]/2+thickness/2+.5)*side,0,-box[z]/2]) rotate([0,90*side,0])
    color("lightgreen") difference() {
      box_side_zip([box[z],box[y]],[2,1,2,1]);

      cube([box[z]-min_material_width*2,box[y]-min_material_width*2,thickness+1],center=true);
    }
}

// front
translate([0,-box[y]/2-thickness/2-.5,-box[z]/2]) rotate([90,0,0])
  color("lightblue") difference() {
    box_side_zip([box[x],box[z]],[1,1,1,1]);
    cube([box[x]-min_material_width*2,box[z]-min_material_width*2,thickness+1],center=true);
  }

// rear
translate([0,box[y]/2+thickness/2+.5,-box[z]/2]) rotate([90,0,0])
  box_side_zip([box[x],box[z]],[2,1,2,1]);

// bottom
translate([0,0,-box[z]-thickness/2-.5])
  color("orange") box_side_zip([box[x],box[y]],[1,2,2,2]);
