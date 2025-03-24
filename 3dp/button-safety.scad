$fn=50;

module bottom() {
    difference() {
        union() {
            translate([0,-12.5,0]) cube([17.5,25,4]);
            translate([0,0,0]) cylinder(4, d=29);
            translate([0,0,0]) cylinder(5, d=23);
            translate([-14.4,2.5,2.5]) rotate([90,90,0]) cylinder(5,d=4.8, $fn=3);
        }
        translate([0,0,-0.1]) cylinder(10, d=19);
        
        translate([15.5,-8.5,1]) rotate([90,90,0]) cylinder(5,d=3 );    
        translate([14, -12.6,-0.1]) cube([3,4.1,1.25]);
        
        translate([15.5,12.6,1]) rotate([90,90,0]) cylinder(4,d=3 );    
        translate([14, 8.6,-0.1]) cube([3,4.1,1.25]);    
    }
}

module bottom2() {
    difference() {
        union() {
            translate([0,0,0]) cylinder(3, d=29);
            translate([0,0,3]) cylinder(3, r1=14.5, r2=11.5);
        }
        translate([0,0,-0.1]) cylinder(10, d=19.3);
        
    }
}

module top() {
    difference() {
        union() {
            translate([0,-14.5,2]) cube([17.5,29,5]);
            translate([-16.5,-2.5,0]) rotate([0,-31,0]) cube([1,5,7.6]);
            
            translate([-16.2,-2.5,5]) rotate([-90,-30,0]) cylinder(5,d=8, $fn=3);
            
            
            translate([0,0,2]) cylinder(5, d=29.2);
            
            translate([12.5, 12.7,.33]) cube([5,1.8,3]);    
            translate([12.5, -14.5,.33]) cube([5,1.8,3]);    
            translate([15, 14.5,.5]) rotate([90,0,0]) cylinder(d=5,h=1.8);                    
            translate([15, -12.7,.5]) rotate([90,0,0]) cylinder(d=5,h=1.8);                    
            translate([15, 14,-1]) rotate([90,0,0]) cylinder(3, d=2);    
            translate([15, -11,-1]) rotate([90,0,0]) cylinder(3, d=2);    
            
        }
        translate([0,0,1.9]) cylinder(4, d=24);
        //translate([15, 15,0]) rotate([90,0,0]) cylinder(30, d=2);    
    }
}

module twoButton() {
    difference() {
        union() {
            bottom2();
            translate([0,20,0]) bottom2();
        }
        
        translate([0,0,-0.1]) cylinder(10, d=19.3);
        translate([0,20,-0.1]) cylinder(10, d=19.3);
    }
}

bottom2();
//twoButton();

//bottom();

//color("green") top();



