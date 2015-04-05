//Interlocking pieces
//copyright SJ Hindmarch 2015
// ToDo: How to make the male piece smaller in the right dimensions to fit the female piece.
// This solution works OK for the cube but not for the double trapezoid.
// Probably need to use trig to caluculate the points of the trapezium in order to preserve
// angles, or to upgrade my copy of OpenSCAD to gain the polygon offset function.

module trapezoid(tol){
	linear_extrude(height=5){
		polygon(
			points=[[0-tol,0],[3-tol,5],[7+tol,5],[10+tol,0]],
			paths=[[0,1,2,3]]
		);
	}
}

module base(){
	cube([20,20,5]);
}

module lock(tol){
	cube([10+(tol*2),5,5]);
	translate([tol,5,0,]){trapezoid(tol);}
	translate([tol,10,0,])mirror([0,1,0]){trapezoid(tol);}
}

module male(tol){
	translate([10,0,0])base();
	mirror([0,1,0])translate([15-tol,0,0])lock(tol);
}

module female(tol){
	mirror([1,0,0])
	difference(){
		translate([10,0,0])base();
		translate([15,0,0])lock(tol);
	}
}

male(-1);
female(0);

//!lock();