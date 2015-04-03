difference(){
	union(){
		cylinder(h=2,r=10);
		translate([0,0,2]){cylinder(h=2,r=5);}
		translate([0,0,4]){cylinder(h=2,r=10);}
	}
	cylinder(h=6,r=2);
}