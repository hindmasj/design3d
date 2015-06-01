// The Percostop(TM)
// copyright SJ Hindmarch 2015

difference(){
	translate([0,0,1]){
		//The stem
		resize([3.8,3.8,35])sphere(10);
		//The cap
		resize([8,8,4])sphere(10);
	}
	translate([-4,-4,-18])cube([8,8,18]);
}
