// A bird table roof extension in 6 parts
// copyright SJ Hindmarch 2015
// Effort  #2: Getting correct dimensions. Making (most) dims constants.
// To do: Improve design of fixing lug for more stability.
// To do: Check feasibility of manufacture: size of piece; dimension control.

// Real Dimensions
dia_table=356;  //outer diameter of table
lip_width=10;   //width of the lip the cover will rest on
notch_width=16; //width of the notch that appears on the lip. There are 3, 120 deg apart

// Design decisions
roof_width=50;  //width of the roof
inner_ht=5;     //height of roof at inner radius
outer_ht=2;     //height of roof at outer radius
lug_width=6;    //width of the lug piece for connecting
lug_length=30;  //length of connecting lug
lug_ht=2;   	//height of connecting lug
lug_fit=0.1;    //tolerance fit of lug
fnum=180;		// number of arc fragments to use in cylinder that is centre hole

// Derived dimensions
r_inner=(dia_table/2)-lip_width; //radius of inner cylinder
r_outer=r_inner+roof_width;      //radius of outer cylinder
slope_ht=inner_ht-outer_ht;      //height of slope

// The main ring
module ring(){
	difference(){
		union(){
			translate([0,0,outer_ht]){
				cylinder(h=slope_ht,r1=r_outer,r2=r_inner);
			}
			cylinder(h=outer_ht,r=r_outer);
		}
		cylinder(h=inner_ht+outer_ht,r=r_inner,$fn=fnum);
	}
}

// A big slab for removing half of the object
module slab(){
	translate([-r_outer,-r_outer,0])cube([r_outer,r_outer*2,5]);
}

// A tab for connecting pieces
module lug(tol){
	translate([r_inner+5,-lug_width,0])
		cube([lug_length+tol*2,lug_width*2+tol*2,lug_ht+tol]);
}

// The notch on the existing roof
module notch(){
	translate([0,-notch_width/2,0])
		cube([r_inner+lip_width,notch_width+0.5,inner_ht]);
}

// Main part of the roof. Draw as a cylinder and a cone then remove 300 deg
// to get only a 60 deg sector.
difference(){
	ring();                // The main ring
	// Remove all but a 60 deg sector
	rotate([0,0,60])slab();
	rotate([0,0,-60])slab();
	rotate([0,0,-30])lug(0); // Space for fixing lug
	notch(); // Sfpace for notch
}
rotate([0,0,30])lug(-lug_fit); // A fixing lug

