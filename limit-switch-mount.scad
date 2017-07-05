//union(){    
difference() {
    union(){
	cube([25, 21, 30]);
    translate([0,-12,20]) cube([25, 12, 10]);
    }
    union(){
	union()  union(){{
	translate([3, 3, 0]) cube([19, 14.5, 28]);
	translate([3, -2.5, 25]) cube([19, 20, 5]);
}
union(){
translate([2.5,-12,21.5])cube([20, 13, 7]); 
 translate([7,17,25])cube([11, 4, 4]); 
}
}
translate([10,10,0])rotate([0, 90, 0]) cylinder(h = 33, r = 5.5, center = true);
}
	union() translate([13, 2, 14]) {
	rotate([90, 0, 0]) cylinder(h = 38, r = 6, center = true);
	union() {
		translate([-12, 8, 8]) rotate([0, 90, 0]) cylinder(h = 4, r = 4, center = true);
		translate([11, 8, 8]) rotate([0, 90, 0]) cylinder(h = 4, r = 4, center = true);
	}
}
}
//translate([13,11,13])rotate([90, 0, 0]) difference(){cylinder(h = 16, r = 6.4, center = true);
//    cylinder(h = 16, r = 5.6, center = true);}
//
//}
