//Interlocking pieces for the bird table design
//copyright SJ Hindmarch 2015

module lug(tol){
	cylinder(h=3+tol,r=6+tol,$fn=30);
}

module screwhole(){
	cylinder(h=5,r=1,$fn=30);
}

module base(){
	cube([20,20,5]);
}

module lock(tol){
	cube([6+(tol*2),5,3+tol]);
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
		translate([9,0,2])lock(tol);
	}
}

difference(){
	male(-0.2);
	translate([12,-9,0])screwhole();
}

difference(){
	female(0);
	translate([-12,9,0])screwhole();
}


//!lock(0);
//!base();