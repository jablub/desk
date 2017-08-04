// Outer dimensions of entire desk in sitting position
x=800; // depth of the table
y=900; // width of the table
z=700; // height of the table excluding the table top thickness and top thickness

// The extra height required
extension=0;

// Thickness of wood pieces
t1=22;
t2=44;

// distance the leg is from the back wall
leg_wall_distance=300;


base_leg=[t2, t1, z];
base_leg_cross_support=[3*t2, t2, t2];
module m_base_leg(){
     translate() cube(base_leg);
     translate([t2+t2, 0, 0]) cube(base_leg);
     translate([0, t1+t2, 0]) cube(base_leg);
     translate([t2+t2, t1+t2, 0]) cube(base_leg);
     translate([0, t1, z-t2]) cube(base_leg_cross_support);
}

base_stand=[x, t2, t2];
module m_base_01(width_offset){
     translate(width_offset){
          translate([leg_wall_distance, 0, 0]) {
               m_base_leg();
          }
          translate([0,t1,0]) cube(base_stand);
     }
}

base_cross_support_bottom=[t2, y-2*t1-2*t2, t2];
base_cross_support_top=[t2, y, t2];
module m_base(){
     //left leg
     m_base_01([0, 0, 0]);

     // right leg
     m_base_01([0, y-t1-t1-t2, 0]);

     // cross supports
     translate([leg_wall_distance-t2, t1+t2, 0]) cube(base_cross_support_bottom);
     translate([leg_wall_distance+3*t2, t1+t2, 0]) cube(base_cross_support_bottom);
     translate([leg_wall_distance-t2, 0, z-t2]) cube(base_cross_support_top);
     translate([leg_wall_distance+3*t2, 0, z-t2]) cube(base_cross_support_top);

}

top_leg=[t2, t1, z+t2];
top_leg_cross_support=[3*t2, t2, t2];

module m_top_leg(){
     translate([]) cube(top_leg);
     translate([0, t1+t2, 0]) cube(top_leg);
     translate([-t2, t1, t2]) cube(base_leg_cross_support);
     translate([-t2, t1, t2+t2]) cube(base_leg_cross_support);
}

module m_top_leg_and_support(width_offset){
     translate(width_offset){
          translate([leg_wall_distance+t2, 0, 0]) {
               m_top_leg();
          }
          translate([0,t1,z]) cube(base_stand);
     }
}

top_support=[x, t2, t2];
module m_top(){
     translate([0, 0, extension]){
          // left leg
          m_top_leg_and_support([0,0,0]);

          // right leg
          m_top_leg_and_support([0, y-t1-t1-t2, 0]);

          // cross supports bottom
          translate([leg_wall_distance-t2, t1+t2, z]) cube(base_cross_support_bottom);
          translate([leg_wall_distance+3*t2, t1+t2, z]) cube(base_cross_support_bottom);
     }

}

m_base();
m_top();
