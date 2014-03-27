include <config.scad>;
include <positions.scad>;
include <sheets.scad>;

// y rods/bearings
% for(side=[left,right]) {
  mirror([1-side,0,0]) {
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

% for(end=[front,rear]) {
  // x rods
  translate([0,x_rod_spacing/2*end,0]) {
    translate(x_rod_pos)
      rotate([0,90,0])
        cylinder(r=rod_diam/2,h=x_rod_len,center=true);
  }

  // xy idlers
  for(side=[left,right]) {
    //translate([(x_rod_len/2+bearing_outer/2)*side,(bearing_outer/2+.5)*end,x_rod_pos[z]]) {
    mirror([1-side,0,0])
      mirror([0,1-end,0])
        translate(xy_idler_pos)
          cylinder(r=bearing_outer/2,h=bearing_height,center=true);
  }
}

for(side=[left,right]) {
  // return bearing
  //translate([(x_rod_len/2+bearing_outer)*side,box[y]/2*front,x_rod_pos[z]-bearing_outer/2]) {
  mirror([1-side,0,0]) {
    % translate(return_idler_pos)
      rotate([0,90,0])
        cylinder(r=bearing_outer/2,h=bearing_height,center=true);

    translate(xy_idler_mount_pos)
      cube([linear_bearing_diam*2,linear_bearing_len*3,sheet_thickness],center=true);
  }
}
