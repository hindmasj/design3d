LEN=60;
OFFSET=25;

polyhedron(
points = [[OFFSET,0,0],[OFFSET,10,0],[LEN+OFFSET,0,0],[LEN+OFFSET,10,0],[OFFSET,0,5],[OFFSET,10,5]],
triangles = [[0,1,3],[2,0,3],[3,1,5],[0,2,4],[5,1,0],[4,5,0],[2,5,4],[2,3,5]]
);
translate([OFFSET+(LEN*3/5),0,0]){
	cube([(LEN*2/5),10,2]);
}