$fn=50;



diameter = 8;
//width = 43 - (diameter / 1);
width = 67.5 - (diameter / 1);
length = 67.5 - (diameter / 1);
height = 14;
bottom_height = 10;

base_height = 1.5;
thickness = 1.5;

led_width = 5.2;
led_length = 5.2;

two_button = false;

lip = 1.5;

//led_offset = (two_button == true) ? 20 : 10;
led_offset = 20;

pcb_width = 63.5;
pcb_height = 63.5;

btn2offset = 16;

module pcb() {
     union() {difference() {
            color("green") hull() {
                xc = pcb_width - 5.08;
                yc = pcb_height - 5.08;
             
                echo(xc, yc);

                translate([5.08, 5.08, 0]) cylinder(1.6, r=5.08);
                translate([5.08, yc, 0]) cylinder(1.6, r=5.08);
                translate([xc, 5.08, 0]) cylinder(1.6, r=5.08);
                translate([xc, yc, 0]) cylinder(1.6, r=5.08);
            }
            
            xdc = (pcb_width) - 6.35;
            ydc = (pcb_height) - 6.35;

            translate([6.35, 6.35, -0.1]) cylinder(2, d=3.3);
            translate([xdc, 6.35, -0.1]) cylinder(2, d=3.3);
            translate([6.35, ydc, -0.1]) cylinder(2, d=3.3);
            translate([xdc, ydc, -0.1]) cylinder(2, d=3.3);            
                       
        }        
        
        color("gray") translate([500 / 39.37, 1750 / 39.37, 1.6]) cylinder(13, d=15);
        color("gray") translate([1250 / 39.37, 1750 / 39.37, 1.6]) cylinder(13, d=15);
        color("gray") translate([2000 / 39.37, 1750 / 39.37, 1.6]) cylinder(13, d=15);

        color("gray") translate([500 / 39.37, 1750 / 39.37, 1.6 + 12]) cylinder(2, r2=8, r1=9);
        color("gray") translate([1250 / 39.37, 1750 / 39.37, 1.6 + 12]) cylinder(2, r2=8, r1=9);
        color("gray") translate([2000 / 39.37, 1750 / 39.37, 1.6 + 12]) cylinder(2, r2=8, r1=9);
        
        color("red") translate([500 / 39.37, 1750 / 39.37, 1.6 + 12 + 2]) cylinder(1.5, d=14);
        color("yellow") translate([1250 / 39.37, 1750 / 39.37, 1.6 + 12 + 2]) cylinder(1.5, d=14);
        color("green") translate([2000 / 39.37, 1750 / 39.37, 1.6 + 12 + 2]) cylinder(1.5, d=14);
        
                color("red") translate([500 / 39.37, 1750 / 39.37, 1.6 + 12 + 2 + 1.5]) cylinder(.5, r1=7, r2=6.5);
        color("yellow") translate([1250 / 39.37, 1750 / 39.37, 1.6 + 12 + 2 + 1.5]) cylinder(.5, r1=7, r2=6.5);
        color("green") translate([2000 / 39.37, 1750 / 39.37, 1.6 + 12 + 2 + 1.5]) cylinder(.5, r1=7, r2=6.5);
        
        
        color("white") translate([1250 / 39.7 - 2.5, 750 / 39.7 - 2.5, 1.6]) cube([5,5,2]);
        
        color("silver") translate([1250 / 39.7 - 4.4, -2, 1.6]) cube([8.8,7.5,2]);
    }
}  


module top(){
    union() {
        difference() {
            union() {
                difference() {
                    hull() 
                    
                    for(x=[-1,1])
                        for(y=[-1,1])
                            translate([x * (width / 2), y * (length / 2), 0])
                               cylinder(height, d=diameter);

                    hull() {
                    for(x=[-1,1])
                        for(y=[-1,1])
                            translate([x * ((width - (thickness * 2)) / 2), y * ((length - (thickness * 2)) / 2), base_height])
                            {
                                difference() {
                                    cylinder(height, d=diameter);
                                }
                            }
                     }
                     
                    hull() {
                        for(x=[-1,1])
                            for(y=[-1,1])
                                translate([x * ((width - (thickness)) / 2), y * ((length - (thickness)) / 2), height - lip])
                                {
                                difference() {
                                    cylinder(height, d=diameter);
                                }
                            }
                     }
                 }
                 
                 for(x=[-1,1])
                    for(y=[-1,1]) {
                         translate([x * ((pcb_width / 2)- 6.35), y * ((pcb_height / 2) - 6.35), 0])
                                    cylinder(15 - base_height, d=6);                                
                         translate([x * ((pcb_width / 2)- 6.35), y * ((pcb_height / 2) - 6.35), 0])
                                    cylinder(15 - base_height + 1.6, d=3.2);   
                             
                         
              
                    }
       
                                
             }
             
             for(x=[-1,1])
                    for(y=[-1,1])         {
                        translate([x * ((pcb_width / 2) - 6.35), y * ((pcb_height / 2) - 6.35),5]) cylinder(height + 2, d=2.3);                }                             
              
              translate([0, 500 / 37.9,-0.1]) cylinder(4,d=8);
            
                    
            translate([-750/ 39.7,-500 / 39.37,-0.1]) cylinder(5, d=16);
            translate([750 / 39.7,-500 / 39.37, -0.1]) cylinder(5, d=16);
//            translate([0,-500 / 39.37,-0.1]) cylinder(5, d=16);
         }
         
         translate([-5,length/2+ 3.24,height-(1.6 + 2)]) cube([9.5,0.75,4.7]);
         
     }
 }
 
 module bottom() {
     union() {
        difference() {
            union() {
                difference() {
                    union() {
                        hull() 
                        for(x=[-1,1])
                            for(y=[-1,1])
                                translate([x * (width / 2), y * (length / 2), 0])
                                cylinder(bottom_height, d=diameter);
                        hull() {
                            for(x=[-1,1])
                               for(y=[-1,1])
                                    translate([x * ((width - (thickness)) / 2), y * ((length - (thickness)) / 2), bottom_height])
                                    {
                                        difference() {
                                            cylinder(lip, d=diameter);
                                        }
                                    }
                             }
                             
                        translate([0, length / 2 + 7.5,0]) cylinder(thickness * 2, d=10);
                        translate([-10/2, length / 2 -2.5,0]) cube([10,10,thickness * 2]);
                        translate([0, -length / 2 - 7.5,0]) cylinder(thickness * 2, d=10);
                        translate([-10/2, -length / 2 - 7.5,0]) cube([10,10,thickness * 2]);                             
                     }
                     
                     translate([0, -length / 2 - 9,-0.1])cylinder(5, d=4);
                     translate([0, length / 2 + 9 ,-0.1])cylinder(5, d=4);

                    hull() {
                    for(x=[-1,1])
                        for(y=[-1,1])
                            translate([x * ((width - (thickness * 2)) / 2), y * ((length - (thickness * 2)) / 2), base_height])
                            {
                                difference() {
                                    cylinder(bottom_height + 20, d=diameter);
                                }
                            }
                     }
                     
                     translate([-5,length/2-2,bottom_height-4]) cube([10,10,10]);
                 }                   
                 
                for(x=[-1,1])
                    for(y=[-1,1]) {
                         translate([x * ((pcb_width / 2)- 6.35), y * ((pcb_height / 2) - 6.35), 0]) cylinder(bottom_height - base_height, d=6);                                                                      
                    }
             }
             
             for(x=[-1,1])
                    for(y=[-1,1])         {
                        translate([x * ((pcb_width / 2)- 6.35), y * ((pcb_height / 2) - 6.35), -0.1]) cylinder(bottom_height * 2, d=3); /* screw hole */
                        translate([x * ((pcb_width / 2)- 6.35), y * ((pcb_height / 2) - 6.35), -0.1]) cylinder(3.2, r=2.5); /* screw hole */
                        translate([x * ((pcb_width / 2)- 6.35), y * ((pcb_height / 2) - 6.35), 3]) cylinder(2, r1=2.5, r2=1.5); /* screw hole */
                    }                             
         }
         
     }     
 }
 //translate([-pcb_width / 2, pcb_height / 2, 13+base_height -1]) rotate([0,180,180]) pcb();
 top();
 //translate([74,0,0]) bottom();

  