x=linspace(0,7,200);
y=linspace(0,9,200);
[x,y]=meshgrid(x,y);

uo=(35./sinh(9.*pi/7)).*sin(x.*pi.*i./7).*sinh(y.*pi.*i./7);
usol=0;
 for i=2:100
     un=35./sinh(9*pi*i/7).*sin(x*pi*i/7).*sinh(y*pi*i/7);
     usol=un+uo;
     uo=un;
 end
 
contour(x,y,usol)