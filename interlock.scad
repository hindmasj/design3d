//Interlocking pieces
//copyright SJ Hindmarch 2015
// ToDo: How to make the male piece smaller in the right dimensions to fit the female piece

module trapezoid(){
	linear_extrude(height=5){
		polygon(
			points=[[0,0],[3,5],[7,5],[10,0]],
			paths=[[0,1,2,3]]
		);
	}
}

module base(){
	cube([20,20,5]);
}

module lock(){
	cube([10,5,5]);
	translate([0,5,0,]){trapezoid();}
	translate([0,10,0,])mirror([0,1,0]){trapezoid();}
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

//!lock();