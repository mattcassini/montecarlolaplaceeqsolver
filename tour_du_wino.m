clear;clc;close all;
m = 2^6; %number of trials for each point
n = 2^6; %size of grid
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

final_pos1 = zeros(n-2,n-2,m);
final_pos2 = final_pos1;

j = 0;

while sum(final_pos1(:)==0) >= 1
    randnum = rand(s,[n-2 n-2 m]);
    walk1 = zeros(n-2,n-2,m);
    walk2 = walk1;
    walk1(randnum<=0.25) = -1; %up
    walk1((randnum>0.25 & randnum<=0.5)) = 1; %down
    walk2(randnum>0.5 & randnum<=0.75) = -1; %left
    walk2(randnum>0.75) = 1; %right
    pos1 = pos1 + walk1;
    pos2 = pos2 + walk2;
    pos1(not(final_pos1==0)) = 0;
    pos2(not(final_pos2==0)) = 0;
    final_pos1(pos1==1 | pos1==n | pos2==1 | pos2==n) = pos1(pos1==1 | pos1==n | pos2==1 | pos2==n);
    final_pos2(pos1==1 | pos1==n | pos2==1 | pos2==n) = pos2(pos1==1 | pos1==n | pos2==1 | pos2==n);
    j = j + 1;
end
R_avg = sum(g(sub2ind([n n],final_pos1,final_pos2)),3)/m;

u(2:n-1,2:n-1) = R_avg;
mesh(u)

load gong
sound(y,Fs)