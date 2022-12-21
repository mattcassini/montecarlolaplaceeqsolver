%Analytical Solution of Laplaces Eq
%& Generation of Equipotential lines

%function usol = equipotential_lines(n)
n = 350;
x=linspace(0,7,n);
y=linspace(0,9,n);
[x,y]=meshgrid(x,y);

u = @(x,y,i) (48./sinh(9*pi*i/7)).*sin(x*pi*i/7).*sinh(y*pi*i/7)/(i*pi);

usol=zeros(n,n);
usol(1,:) = 0;
usol(:,1) = 0;
usol(:,n) = 0;
usol(n,:) = 12;

for i=1:2:180
    un = u(x,y,i);
    usol(2:end-1,2:end-1) = usol(2:end-1,2:end-1) + un(2:end-1,2:end-1);
end
 
contour(usol');
%  figure()
%  mesh(usol)

%end