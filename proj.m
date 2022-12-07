%Analytical Solution of Laplaces Eq
%& Generation of Equipotential lines

clear;close all;
x=linspace(0,7,1000);
y=linspace(0,9,1000);
[x,y]=meshgrid(x,y);

u = @(x,y,i) (pi*48./sinh(9*pi*(2*i+1)/7)).*sin(x*pi*(2*i+1)/7).*sinh(y*pi*(2*i+1)/7)/(2*i+1);
usol=0;

for i=0:90
    un = u(x,y,i);
    usol= usol + un;
end
 
 %contour(usol);
 mesh(usol)