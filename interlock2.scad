//Interlocking pieces for the bird table design
//copyright SJ Hindmarch 2015

module lug(tol){
	cylinder(h=3,r=6-tol);
}

module screwhole(){
	cylinder(h=5,r=1);
}

module base(){
	cube([20,20,5]);
}

module lock(tol){
	cube([6+(tol*2),5,3]);
	translate([3+tol,9,0,]){lug(tol);}
}

module male(tol){
	translate([2,0,0])base();
	mirror([0,1,0])translate([9-tol,0,0]){
		lock(tol);
	}
}

module female(tol){
	mirror([1,0,0])
	difference(){
		translate([2,0,0])base();
		translate([9,0,0])lock(tol);
	}
}

male(-0.2);
female(0);

//!lock(0);
//!base();