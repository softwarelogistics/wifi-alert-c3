$fn=50;

diameter = 8;
width = 43 - (diameter / 1);
length = 68.5 - (diameter / 1);
height = 15;
bottom_height = 5;

dht_width = 15.7;
dht_length = 20.6;

base_height = 1.5;
thickness = 1.5;

led_width = 5.2;
led_length = 5.2;

two_button = true;

lip = 1.5;

led_offset = (two_button == true) ? 20 : 10;


btn2offset = two_button ? 20 : 15;

module pcb() {
    // https://www.amazon.com/YEJMKJ-Development-ESP32-C3-MINI-1-ESP32-C3FN4-Single-Core/dp/B0CNGH75XD/ref=sxin_17_sbv_search_btf?content-id=amzn1.sym.7032aefd-3c59-4a1e-aaf4-8d3a944207a4%3Aamzn1.sym.7032aefd-3c59-4a1e-aaf4-8d3a944207a4&crid=395OJ50NAVZAT&cv_ct_cx=ESP32-C3+Module&dib=eyJ2IjoiMSJ9.uJp9bF2SBHfKiqRqdsrtQw.ktimBnXgzJlVtYp2jeYI1u94rYevjxNk1ucoBqf2pQg&dib_tag=se&keywords=ESP32-C3+Module&pd_rd_i=B0CNGH75XD&pd_rd_r=d791a79a-8d80-49be-bcdb-e14da1376ce2&pd_rd_w=oHrMy&pd_rd_wg=OIyul&pf_rd_p=7032aefd-3c59-4a1e-aaf4-8d3a944207a4&pf_rd_r=4H8QXTEM5YRC4EFJTPBV&qid=1733254946&s=electronics&sbo=RZvfv%2F%2FHxDF%2BO5021pAnSA%3D%3D&sprefix=esp32-c3+module%2Celectronics%2C116&sr=1-1-5190daf0-67e3-427c-bea6-c72c1df98776
    translate([-25.8/2, -31.5/2,0])    union() {difference() {
            color("green") cube([25.8,31.5,1.6]);
            translate([2.5, 2.69, -0.1]) cylinder(d=3, h=5);
            translate([2.5 + 20.83, 2.69, -0.1]) cylinder(d=3, h=5);
        }
        
        
        translate([25.8 / 2 - 4.5 , 31.5-10, 1.6]) color("silver") cube([9,10, 3.28]);
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
                    for(y=[-1,1])
                         translate([x * (width / 2), y * (length / 2), 0]){
                                    cylinder(height - lip, d=diameter - 3);   
              
                }
                
                /*
                translate([width /1.35 - 10, length /3 , base_height]) difference() {
                    cylinder(height - (base_height), r1=3.25, r2=2.5);
                    translate([0,0, 8]) cylinder(height + 3, d=2);
                }

                translate([width /1.35 - 10, length / 3 -  21, base_height]) difference() {
                    cylinder(height - (base_height), r1=3.25, r2=2.5);
                    translate([0,0, 8]) cylinder(height + 3, d=2);
                }
                */
                
                translate([-20.83/2, 4.8, base_height]) difference() {
                    cylinder(height - (base_height + 1.6), r1=3.25, r2=2.5);
                    translate([0,0, 8]) cylinder(height + 3, d=2);
                }

                translate([20.83/2, 4.8, base_height]) difference() {
                    cylinder(height - (base_height + 1.6), r1=3.25, r2=2.5);
                    translate([0,0, 8]) cylinder(height + 3, d=2);
                }
                
             }
             
             for(x=[-1,1])
                    for(y=[-1,1])         {
                        //translate([x * (width / 2), y * (length / 2),-0.1]) cylinder(8, d=6); /* top offset for screw head */
                        translate([x * (width / 2), y * (length / 2),5]) cylinder(height + 2, d=2.5); /* screw hole */
                    }                             
              
              translate([0, led_offset,-0.1]) cylinder(4,d=4);
              translate([-led_width / 2, (led_offset - 0) - (led_width / 2),1]) cube([led_width,led_length,5]);     

            
                    
            if(two_button == true) 
              translate([0,0,-0.1]) cylinder(5, d=16);

            translate([0,-btn2offset,-0.1]) cylinder(5, d=16);
         
            translate([-11.5,length/2-2,height-1.6]) cube([23,10,1.8]);
            translate([-5,length/2,height-(1.6 + 3.4)]) cube([9.5,6,3.5]);
            
            //translate([0, length /2 + diameter / 2, height / 2 + 1 ]) rotate([90,0,0]) cylinder(5, d=8.5); 
         }
         
         translate([-2.5, -btn2offset + 8-0.5,0]) cube([5,1,base_height]);
         translate([-2.5, -btn2offset +-8-0.5,0]) cube([5,1,base_height]);

         if(two_button == true) {
            translate([-2.5,8-0.5,0]) cube([5,1,base_height]);
            translate([-2.5,-8 - 0.5,0]) cube([5,1,base_height]);
         }
     }
     
     
     
     difference() {
        translate([-7, led_offset - 7, 2]) cube([14,14,1]);
        translate([0, led_offset,1]) rotate([0,0,22.5]) cylinder($fn = 8, $fa = 12, $fs = 2, h = 4, r1 = 5.5, r2 = 5.5, center = false);                
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
                     
                     translate([-11.5,length/2-2,bottom_height]) cube([23,10,1.8]);
                 }                   
                 
                 for(x=[-1,1])
                    for(y=[-1,1])
                         translate([x * (width / 2), y * (length / 2), 0]){
                                    cylinder(bottom_height + lip, d=diameter - 3);   
              
                }
             }
             
             for(x=[-1,1])
                    for(y=[-1,1])         {
                        translate([x * (width / 2), y * (length / 2),-0.1]) cylinder(bottom_height * 2, d=3); /* screw hole */
                        translate([x * (width / 2), y * (length / 2),-0.1]) cylinder(3, r1=3, r2=1.5); /* screw hole */
                    }                             
         }
         
     }     
 }
// translate([0,16,20]) rotate([180,0,180]) pcb();
 top();
 translate([75,0,0]) bottom();

  