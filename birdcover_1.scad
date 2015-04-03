// A bird table roof extension in 6 parts
// copyright SJ Hindmarch 2015
// Effort  #1: Getting correct shape
// To do: Get correct dimensions from life
// To do: Sort out interference fit between male and female lug
// Idea: Make the fixing an in and out part for more stability

// The main ring
module ring(){
	difference(){
		union(){
			translate([0,0,2]){
				cylinder(h=3,r1=50,r2=30);
			}
			cylinder(h=2,r=50);
		}
		cylinder(h=5,r=20);
	}
}

// A big slab for removing large portions of the object
module slab(){
	translate([-50,-50,0])cube([50,100,5]);
}

// A tab for connecting pieces
module lug(){
	translate([22,-2,0])cube([20,4,2]);
}

difference(){
	ring();                // The main ring
	// Remove all but a 60 deg sector
	rotate([0,0,60])slab();
	rotate([0,0,-60])slab();
	// Remove space for the notch on the existing roof
	translate([0,-2.5,0])cube([25,5,5]);
	rotate([0,0,-30])lug(); // Space for fixing lug
}

rotate([0,0,30])lug(); // A fixing lug
