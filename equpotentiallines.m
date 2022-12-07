x=linspace(1,7,500);
y=linspace(1,9,500);
[x,y]=meshgrid(x,y);

uo=(48./sinh(9.*pi/7)).*sin(x.*pi./7).*sinh(y.*pi./7);
usol=0;
 for i=2:100
     un=48./sinh(9.*pi.*i./7).*sin(x.*pi.*i./7).*sinh(y.*pi.*i./7);
     usol=un+uo;
     uo=un;
 end
 
 contour(x,y,usol)