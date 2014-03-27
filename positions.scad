include <config.scad>;

top_sheet_pos    = [0,                                 0,                                 sheet_thickness/2];
bottom_sheet_pos = [0,                                 0,                                 (box[z]+sheet_thickness/2)*bottom];
rear_sheet_pos   = [0,                                 (box[y]/2+sheet_thickness/2)*rear, box[z]/2*bottom];
front_sheet_pos  = [0,                                 (box[y]/2+sheet_thickness/2)*front,box[z]/2*bottom];
left_sheet_pos   = [(box[x]/2+sheet_thickness/2)*left, 0,                                 box[z]/2*bottom];
right_sheet_pos  = [(box[x]/2+sheet_thickness/2)*right,0,                                 box[z]/2*bottom];

y_rod_len  = box[y]-20;

y_rod_lift = linear_bearing_diam/2+ziptie_thickness; // should be enough for linear bearings with zip ties to clear box
y_rod_pos  = [build[x]/2,0,top_sheet_pos[z]+sheet_thickness/2+y_rod_lift];
