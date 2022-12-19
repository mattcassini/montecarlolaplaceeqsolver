%Monte Carlo PDE Solver
%M450H

function u = tour_du_wino(n,m)
%m = 1000; %number of trials for each point
%n = 8; %size of grid
h = 1/n;
k = (n-2)^2; %interior pts
s = RandStream("dsfmt19937"); %seed for random number gen
%x = linspace(0,1,n);
%y = x;

g = zeros(n,n);
%input BCs
g(1,:) = 0; %top
g(n,:) = 0; %bottom
g(:,1) = 0; %left
g(:,n) = 12; %right
u = g;

pos1 = repmat((2:n-1)',1,n-2,m);
pos2 = permute(pos1,[2 1 3]);
pos1 = pos1(:);
pos2 = pos2(:);
pos1 = repmat(pos1,1,2);
pos2 = repmat(pos2,1,2);

reward = zeros(n,n);
j = 0;
r = m*k;
while size(pos1,1) >= 1
    randnum = rand(s,[r 1]);
    walk1 = zeros(size(randnum));
    walk2 = walk1;
    walk1(randnum<=0.25) = -1; %up
    walk1((randnum>0.25 & randnum<=0.5)) = 1; %down
    walk2(randnum>0.5 & randnum<=0.75) = -1; %left
    walk2(randnum>0.75) = 1; %right
    pos1(:,1) = pos1(:,1) + walk1;
    pos2(:,1) = pos2(:,1) + walk2;
    z = pos1(:,1)==1 | pos1(:,1)==n | pos2(:,1)==1 | pos2(:,1)==n;
    q = sub2ind([n n],pos1(z,2),pos2(z,2));
    reward(q) = reward(q) + g(sub2ind([n n],pos1(z,1),pos2(z,1)));
    pos1(z,:) = [];
    pos2(z,:) = [];
    j = j + 1;
    r = size(pos1,1);
end
R_avg = reward/m;
u(2:n-1,2:n-1) = R_avg(2:n-1,2:n-1);
% mesh(u)

%equipotent lines
% eps = 10^-1;
% ii = 2:n-1;
% jj = ii;
% ux = (u(ii+1,jj) - u(ii,jj)) / h;
% uy = (u(ii,jj+1) - u(ii,jj)) / h;
% equipotent_lines = u(ii,jj).*(ux<=eps & ux>=-eps & uy<=eps & uy>=-eps);

end