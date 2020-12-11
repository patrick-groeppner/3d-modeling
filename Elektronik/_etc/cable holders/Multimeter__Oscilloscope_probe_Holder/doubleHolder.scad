
module hanger(Rin,Rex,Xc,Yc)
{
   c = Rex / sqrt(2);
   translate([Xc,Yc,0]){
	   difference(){
		   circle(r=Rex);
		   circle(r=Rin);
		   polygon(points = [[0,0],[c,c],[0,2*c],[-c,c]]);
	   }
	   translate([  (Rex + Rin)/(2*sqrt(2)),(Rex + Rin)/(2*sqrt(2)),0  ]) {
	   circle(r = (Rex-Rin)/2, $fs = 0.5);
	   }
	   translate([  -(Rex + Rin)/(2*sqrt(2)),(Rex + Rin)/(2*sqrt(2)),0  ]) {
	   circle(r = (Rex-Rin)/2, $fs = 0.5);
	   }
   }
}

   difference(){
   linear_extrude(height = 10)
   union(){
      translate([0,-7.5,0]) {square([60,4], center=true);}
      hanger(5.5, 8.5, 10, 0);
      hanger(5.5, 8.5, -10, 0);
   }

   translate([25,-8.25,5]){
      rotate(a = -90, v = [1, 0, 0]) {
         union(){
            cylinder(h = 3, r1 = 1.5, r2 = 3, center = false, $fs = 0.2);
            translate([0,0,-2]){
               cylinder(h = 2, r = 1.5, center=false, $fs = 0.2);
            }
         }
      }
   }

   translate([-25,-8.25,5]){
      rotate(a = -90, v = [1, 0, 0]) {
         union(){
            cylinder(h = 3, r1 = 1.5, r2 = 3, center = false, $fs = 0.2);
            translate([0,0,-2]){
               cylinder(h = 2, r = 1.5, center=false, $fs = 0.2);
            }
         }
      }
   }
}





