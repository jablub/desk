dx = 600;
dy = 900;
dzl = 60;
dzh = 110;
x=0;
y=1;
z=2;

ls=[96,22,1800];
ss=[dx,44,44];

module leg(d){
     translate(d){
          cube(ls);
          translate([0,ls[y],0]) cube(ss);
          translate([0,ls[y] + ss[y],0]) cube(ls);
     }
}

leg([0,0,0]);
leg([0,dy,0]);
echo(ls[z]);
