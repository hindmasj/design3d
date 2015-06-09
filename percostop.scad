// The Percostop(TM)
// copyright SJ Hindmarch 2015

difference(){
	union(){
		//The stem
		translate([0,0,0])
		resize([7.6,7.6,70])sphere(10);
		//The cap
		translate([0,0,3])
		resize([16,16,8])sphere(10);
	}
	translate([-8,-8,-36])cube([16,16,36]);
}
