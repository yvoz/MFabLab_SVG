
$fn = 12;

ep = 10; // epaisseur
ez = 10; // epaisseur z
epr = ep-3; // epaisseur cylindre

rsty = 6; // rayon stylo
rres = 3.55; // rayon resort

sps = 60; // espace vis support
spc = 37; // espace colonnes
dco = 22; // distance support / colonnes

rv = 2.5 +0.1; // rayon vis
rc = 3; // rayon colonnes

rr = 6; // rayon roulement bille 
rrz = 19; // roulement long

include <Hexa.scad>;

module sercol(ro){
    difference(){
        union(){
            translate([0,0,0]) cylinder(r=ro+epr, h=ez, $fn=4*5);
            // plot serrage
            translate([-epr,0,0]) cube([epr*2,ro+epr+2,ez]);
        }
        translate([0,0,-1]) cylinder(r=ro, h=ez+2, $fn=4*5);
        // fente
        translate([-1,0,-1]) cube([2,ro+epr+rc+1,ez+2]);
        // vis serrages
        translate([-epr-epr/2, ro+epr-1.6, ez/2]) rotate([0,90,0]) cylinder(r=1.6, h=epr*3+2);
        translate([epr, ro+epr-1.6, ez/2]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=m3r+0.4, h=epr, $fn=6);
        translate([-epr*2, ro+epr-1.6, ez/2]) rotate([0,90,0]) rotate([0,0,30]) cylinder(r=m3r+0.4, h=epr, $fn=6);
    }
}

module colonnes(){
    difference(){
        cube([ep+sps+ep,ep,ez]);
        translate([ep,-1,ez/2]) rotate([-90,0,0]) cylinder(r=rv, h=ep+2);
        translate([ep+sps,-1,ez/2]) rotate([-90,0,0]) cylinder(r=rv, h=ep+2);
    }
    translate([ep+sps/2-spc/2-ep/2, 0,0]) cube([ep,dco-rc-3,ez]);
	difference(){
		translate([ep+sps/2-spc/2, dco,0]) sercol(rr+0.2);
		translate([ep-1.7,ep+1,ez/2]) rotate([-90,0,0]) cylinder(r=rv+1, h=rr*4);
	}
    translate([ep+sps/2+spc/2-ep/2, 0,0]) cube([ep,dco-rc-3,ez]);
	difference(){
		translate([ep+sps/2+spc/2, dco,0]) sercol(rr+0.2);
		translate([ep+sps+1.7,ep+1,ez/2]) rotate([-90,0,0]) cylinder(r=rv+1, h=rr*4);
	}
}
 
module stylo(){
	jspa = 0.0;
	//
    translate([ep+sps/2-spc/2-jspa, dco,0]) rotate([0,0,90]) sercol(rc+0.1);
    translate([ep+sps/2+spc/2+jspa, dco,0]) rotate([0,0,-90]) sercol(rc+0.1);
    //
    difference(){
        union(){
            translate([ep+sps/2-spc/2+rc, dco-ep/2,0]) cube([spc-rc*2,ep,ez]);
            translate([ep+sps/2-spc/2+spc/2, dco,0]) cylinder(r=rsty+epr, h=ez, $fn=4*5);
        }
        translate([ep+sps/2-spc/2+spc/2, dco,-1]) cylinder(r=rsty, h=ez+2, $fn=4*5);
        // vis serrages
        translate([ep+sps/2-spc/2+spc/2, dco,ez/2]) rotate([-90,0,45]) cylinder(r=1.5, h=rsty+epr+1);
        translate([ep+sps/2-spc/2+spc/2, dco,ez/2]) rotate([-90,0,-45]) cylinder(r=1.5, h=rsty+epr+1);
    }
}

module plaquevis(){
	sps_z = 40;
	bor = 4;
	//
	difference(){
		cube([bor+rv+sps+rv+bor, bor+rv+sps_z+rv+bor, bor]);
		
		translate([bor+rv, bor+rv, -1]) cylinder(r=rv, h=bor+2);
		translate([bor+rv+sps, bor+rv, -1]) cylinder(r=rv, h=bor+2);
		translate([bor+rv+sps, bor+rv+sps_z, -1]) cylinder(r=rv, h=bor+2);
		translate([bor+rv, bor+rv+sps_z, -1]) cylinder(r=rv, h=bor+2);
		
	}
}

//translate([0,0,0]) stylo();
//translate([0,30,0]) stylo();
//plaquevis(); 
translate([0,0,0]) colonnes();
translate([0,40,0]) colonnes();
