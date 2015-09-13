// The TashProtect(TM)
// copyright SJ Hindmarch 2015

height=5;
radius=50;
thickness=2;

difference(){
	cylinder(h=height,r=radius);
	translate([0,0,thickness])cylinder(h=height-thickness,r=radius-thickness);
	translate([radius*1.5,0,0])cylinder(h=height,r=radius);
	translate([-20,60,0])cylinder(h=height,r=radius);
	translate([-20,-60,0])cylinder(h=height,r=radius);
	
}