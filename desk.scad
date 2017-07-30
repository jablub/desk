dx = 600;
dy = 900;
dzl = 600;
dzh = 1100;

x=0;
y=1;
z=2;

inlegy=44; // inside the leg width
ls=[44,22,1800];
ss=[dx,inlegy,inlegy];
apronsupport=[dx,inlegy,inlegy];
tixs=220;
iss=[22,22,dzl + tixs];
dfb=100;
crosssupport=[iss[x] + iss[x] + ls[x],inlegy,inlegy];

module leg(d){
     translate(d){
          translate([0,ls[y],0]) cube(apronsupport);
          translate([dfb,0,0]){
               cube(ls);
               translate([0,ls[y] + ss[y],0]) cube(ls);
          }
     }
}

module base(){
     leg([0,0,0]);
     leg([0,dy - (ls[y] + ls[y] + ss[y]),0]);
     translate([dfb - ls[x],inlegy + ls[y],0]) cube([inlegy, dy - 2*inlegy - 2*ls[y], inlegy]); //bottom cross support
     translate([dfb,0,ls[z]]) cube([inlegy, dy, inlegy]); // top cross support
}

module apronmiddle(d){
     translate(d){
          translate([0,ls[y],0]) cube(apronsupport);
          translate([dfb,0,0]){
               translate([-iss[x], iss[y], ss[z]-dzl]) cube(crosssupport); // cross support bottom
               translate([-iss[x], iss[y], ss[z]-dzl+iss[z]-crosssupport[z]]) cube(crosssupport); // cross support bottom
          }
     }
}

module apronouty(d){
     translate(d){
          translate([dfb,0,0]){
               translate([-iss[x],ls[y] + ss[y], -dzl + ss[z]]) cube(iss);
               translate([ls[x],ls[y] + ss[y], -dzl + ss[z]]) cube(iss);
         }
     }
}

module aproniny(d){
     translate(d){
          translate([dfb,0,0]){
               translate([-iss[x],0, -dzl + ss[z]]) cube(iss);
               translate([ls[x],0, -dzl + ss[z]]) cube(iss);
          }
     }
}

module apron(d){
     aproniny(d);
     apronmiddle(d);
     apronouty(d);
}

module top(d){
     translate(d){
          apron([0,0,0]); // leg iny
          apron([0,dy - (ls[y] + ls[y] + ss[y]),0]); //leg outy
          translate([0,0,apronsupport[z]]) cube([dx,dy,20]); // table top
     }
}

base();
top([0,0,dzl]);
//top([0,0,dzh]);
