// Some pleasing mushroom shapes
// copyright SJ Hindmarch 2015

// A mushroom of distorted spheres
translate([10,10,10]){
	resize([7.5,7.5,20])sphere(10);
	translate([0,0,7.5])resize([20,20,5])sphere(10);
}

// A circular mushroom
translate([-10,10,0]){
	cylinder(r=3.25,h=15);
	translate([0,0,15])cylinder(r1=10,r2=1,h=5);
}

// A pointed, square mushroom
translate([6.25,-13.75,0]){
	cube([7.5,7.5,15]);
}
translate([10,-10,15]){
	for(r=[0:3]){
		rotate(r*90)linear_extrude(height=5,scale=0.1,centre=true){square([10,10]);}
	}
}

// A flat, square mushroom
translate([-13.75,-13.75,0]){
	cube([7.5,7.5,15]);
}
translate([-20,-20,15])linear_extrude(height=5){
	square([20,20]);
}

// A sphere mushroom with umbrella top
translate([30,10,10]){
	resize([7.5,7.5,20])sphere(10);
	translate([0,0,5])resize([20,20,5])difference(){
		sphere(10);
		translate([-10,-10,-10])cube([20,20,10]);
	}
}

// A sphere mushroom with upturned umbrella top
translate([30,-10,10]){
	resize([7.5,7.5,20])sphere(10);
	translate([0,0,10])resize([20,20,5])difference(){
		sphere(10);
		translate([-10,-10,0])cube([20,20,10]);
	}
}

