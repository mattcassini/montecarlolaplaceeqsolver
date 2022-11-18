%Monte Carlo PDE Solver
%Math450H

clear;clc;close all;
m = 2^6; %number of trials for each point
n = 2^8; %size of grid
k = (n-2)^2; %interior pts
s = RandStream("dsfmt19937"); %seed for random number gen
%x = linspace(0,1,n);
%y = x;

g = zeros(n,n);
%input BCs
g(1,:) = 1; %top
g(n,:) = 1; %bottom
g(:,1) = 0; %left
g(:,n) = 0; %right
u = g;
%g = repmat(g,1,1,m);

pos1 = repmat((2:n-1)',1,n-2,m);
pos2 = permute(pos1,[2 1 3]);
pos1 = pos1(:);
pos2 = pos2(:);
pos1 = repmat(pos1,1,2);
pos2 = repmat(pos2,1,2);

final_pos1 = zeros(n-2,n-2,m);
final_pos1 = final_pos1(:);
final_pos2 = final_pos1;
final_pos2 = final_pos2(:);

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
    %final_pos1(z) = pos1(z,1);
    %final_pos2(z) = pos2(z,1);
    q = sub2ind([n n],pos1(z,2),pos2(z,2));
    reward(q) = reward(q) + g(sub2ind([n n],pos1(z,1),pos2(z,1)));
    pos1(z,:) = [];
    pos2(z,:) = [];
    j = j + 1;
    r = size(pos1,1);
end
%R_avg = sum(g(sub2ind([n n],final_pos1,final_pos2)),3)/m;
R_avg = reward/m;
u(2:n-1,2:n-1) = R_avg(2:n-1,2:n-1);
mesh(u)

load gong
sound(y,Fs)