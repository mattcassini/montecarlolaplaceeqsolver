%Analytical Solution of Laplaces Eq
%& Generation of Equipotential lines

function usol = equipotential_lines(n)
x=linspace(0,7,n);
y=linspace(0,9,n);
[x,y]=meshgrid(x,y);

u = @(x,y,i) (48./sinh(9*pi*i/7)).*sin(x*pi*i/7).*sinh(y*pi*i/7)/(i*pi);

usol=0;

for i=1:2:180
    un = u(x,y,i);
    usol= usol + un;
end
 
%  contour(usol);
%  figure()
%  mesh(usol)

end