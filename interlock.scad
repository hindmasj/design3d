//Interlocking pieces
//copyright SJ Hindmarch 2015

module base(){
	cube([20,20,5]);
}

module lock(){
	cube([10,5,5]);
	polyhedron(
		points=[[0,5,0],[10,5,0],[3,10,0],[7,10,0]],
		faces=[[0,1,2,3]]
	);
}

module male(){
	translate([10,0,0])base();
	mirror([0,1,0])translate([15,0,0])lock();
}

module female(){
	mirror([1,0,0])
	difference(){
		translate([10,0,0])base();
		translate([15,0,0])lock();
	}
}

male();
female();

!lock();