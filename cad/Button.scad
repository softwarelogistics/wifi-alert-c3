$fn=50;
union() {
    difference() {
    union() {
        translate([0,0,5]) cylinder(1, r1=9.5/2, r2=4);
        cylinder(5, d=9.5);
        cylinder(1, r1=11.5/2, r2=9.5/2);
    }
    translate([0,0,-0.1]) cylinder(2, d=6.5);
  }
  translate([0,0,1]) cylinder(3,d=3);
}
