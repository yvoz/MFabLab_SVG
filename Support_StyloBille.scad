

rsty = 6; // rayon stylo
rbig = 43/2;  // rayon cylindre de serrage 

rv = 2.5 + 0.1; // rayon vis
rc = 3; // rayon colonnes
rr = 6; // rayon roulement bille 
rrz = 19; // roulement long



supx = 80;
supz = 20;

epr = 4;
eprr = 3; // épaisseur roulement
epz = 3;

include <Hexa.scad>;
//use<Hexa.scad>;


module rouloum(){
	difference(){
		union(){
			cylinder(r=rbig+epr, h=supz+epz);
			
		}
		// ext
		tub();
		// centre
		translate([0,0,-1]) cylinder(r=rbig-epr, h=supz+epz+2);
		//
		for(g=[0:3]){
			rotate([0,0,120*g]) translate([0,rbig-rr-1, 0])  
			translate([0,0,-1])  cylinder(r=rr+0.1, h=supz+1);
		}
		for(g=[0:3]){
			rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]) difference(){
				translate([0,0,-1])  cylinder(r=rc+2, h=supz+epz+2);
			}
		}
		
	}
	difference(){
		union(){
			for(g=[0:3]){
						rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]) difference(){
							cylinder(r=rr+eprr, h=supz+epz);
							translate([0,0,-1])  cylinder(r=rr+0.1, h=supz+epz+2);
							translate([-0.5,-rr-eprr-1,-1])  cube([1, eprr+2, supz+epz+2]);
						}
			}
		}
		tub();
	}
}

module tub(){
	j = 0.2;
	difference(){
		translate([0,0,-1]) cylinder(r=rbig+epr+1, h=supz+1);
		translate([0,0,-1]) cylinder(r=rbig+j, h=supz+2);
	}
}

module colo(){
	epcolz = 10;
	eprcol = 3.7;
	//
	for(g=[0:3]){
		rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]) difference(){
			union(){
				translate([0,0,0])  cylinder(r=rc+eprcol, h=epcolz);
				// plot
				rotate([0,0,-7])
					translate([rc,-eprcol,0]) cube([eprcol+2, eprcol*2, epcolz]);
			}
			rotate([0,0,-7]){
				translate([0,0,-1])  cylinder(r=rc+0.2, h=epcolz+2);
				// fente
				translate([2, -1, -1]) cube([eprcol*2, 2, epcolz+2]);
				// vis serrages
				translate([rc+2.5, eprcol*2, epcolz/2]) rotate([90,0,0]) cylinder(r=1.6, h=eprcol*4, $fn=9);
				translate([rc+2.5, eprcol, epcolz/2]) rotate([-90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
				translate([rc+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
			}
				
		}
	}
	//
	difference(){
		cylinder(r=rsty+eprcol, h=epcolz);
		translate([0,0,-1]) cylinder(r=rsty, h=epcolz+2);
		//
		for(g=[0:3]){
			rotate([0,0,120*g]) translate([0,rbig-rr-1, 0]){
				rotate([0,0,-7]){
					translate([rc+2.5, eprcol*2, epcolz/2]) rotate([90,0,0]) cylinder(r=1.6, h=eprcol*4+2, $fn=9);
					//translate([rc+2.5, eprcol, epcolz/2]) rotate([-90,0,0]) cylinder(r=3.5, h=eprcol);
					translate([rc+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
					translate([rc+2.5+2.5, -eprcol, epcolz/2]) rotate([90,0,0]) cylinder(r=m3r+0.4, h=m3h+0.6, $fn=6);
				}
			}
		}
		for(g=[0:3]){
			rotate([0,0,120*g -10]) translate([0,0,epcolz/2]) rotate([90,0,0]) cylinder(r=1.5, h=rsty+eprcol+1, $fn=9);
		}
	}
}

rotate([180,0,0]) rouloum();


//colo();
//translate([0,0,11]) rouloum();

//colo();
//translate([0,40,0]) colo();

