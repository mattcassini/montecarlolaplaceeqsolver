%Analytical Solution of Laplaces Eq
%& Generation of Equipotential lines

clear;close all;
x=linspace(0,7,1000);
y=linspace(0,9,1000);
[x,y]=meshgrid(x,y);

u = @(x,y,i) (40./sinh(9*pi*i/7)).*sin(x*pi*i/7).*sinh(y*pi*i/7);
usol=0;

for i=1:1000
    un = u(x,y,i);
    usol= usol + un;
end
 
 contour(usol);