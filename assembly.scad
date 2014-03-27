include <sheets.scad>;

for(side=[left,right]) {
  % mirror([1-side,0,0]) {
    translate(y_rod_pos) {
      rotate([90,0,0])
        cylinder(r=rod_diam/2,h=y_rod_len,center=true);

      for(end=[front,rear]) {
        translate([0,(linear_bearing_len/2+5)*end,0])
          rotate([90,0,0])
            cylinder(r=linear_bearing_diam/2,h=linear_bearing_len,center=true);
      }
    }
  }
}
