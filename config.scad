// used when accessing dimension vectors
x = 0;
y = 1;
z = 2;

// used when translating/rotating/etc to make more sense
front = -1;
rear = 1;
back = 1;
left = -1;
right = 1;
top = 1;
bottom = -1;

build = [200,200,200];
build = [150,150,150];

min_material_width = 25;
sheet_thickness = 6;

// FIXME: the box is going to need to include overhead
box = [build[x]+50,build[y]+30,build[z]+30];

ziptie_thickness = 1.5;

linear_bearing_diam = 15;
linear_bearing_len  = 24;

/* 608
bearing_outer = 22;
bearing_inner = 8;
bearing_height = 7;
*/

/* 625
*/
bearing_outer = 15;
bearing_inner = 5;
bearing_height = 5;

rod_diam = 8;
