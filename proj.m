x=linspace(0,7,500);
y=linspace(0,9,500);
[x,y]=meshgrid(x,y);

u = @(x,y) (48./sinh(9*pi*i/7)).*sin(x*pi*i/7).*sinh(y*pi*i/7);
usol=0;
 for i=1:100
     un = u(x,y);
     usol= usol + un;
 end
 
 contour(x,y,usol)