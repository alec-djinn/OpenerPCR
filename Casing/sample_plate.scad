// DIYbio OpenerPCR
// Sample Plate
// www.diybiogroningen.org
// Version: beta 1

// Variables
width = 25;
height = 25;
thickness = width/3;
rows = 8;
columns = 8;

module well(width,height,thickness){
	difference(){
		minkowski(){
			cube([width,height,thickness], center=true);
			cylinder(r=2, h=1, center=true);
		}
		cylinder(2*thickness, width/3, width/3,center=true);
	}
}

module plate(){
	for(row=[0:rows-1]){
		translate([0,row*(height+0*thickness),0]){
			for(col=[0:columns-1]){
				translate([col*(width+0*thickness),0,0]){
					well(width,height,thickness);
				}
			}
		}
	}
}

plate();