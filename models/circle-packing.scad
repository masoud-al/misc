//	honeycomb(5width,5length,5height,honeycomb_radius,honeycomb_radius_modifier,honeycomb_thickness,honeycomb_sides);
//honeycomb(3,3,3,3,3,5,6);
sides = 100;
height = 5.5;
union(){
    difference(){
        cylinder(h = height, r = 11, center = true, $fn = sides);
        pack1(height,3.08, 3.08,sides);
    };
    translate([0,0,3.75])
    difference(){
        cylinder(h = 2, r = 11, center = true, $fn = sides);
        pack1(height,3.08, 2,sides);
    };
}


module pack1(height, radius, r2, sides){
    D =  4* radius / sqrt(3);
    cylinder(h = height, r = r2, center = true, $fn = sides);
    for (i=[0:5]){
        theta = (2*i)*30;
        translate([D*cos(theta),D*sin(theta),0]) 
        cylinder(h = height, r = r2, center = true, $fn = sides);
    }
}
