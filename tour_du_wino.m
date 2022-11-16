clear;clc;close all;
m = 2^4; %number of trials for each point
n = 2^4; %size of grid
k = (n-2)^2; %interior pts
s = RandStream("dsfmt19937"); %seed for random number gen
%x = linspace(0,1,n);
%y = x;
%[X,Y] = meshgrid(x,y);
reward = zeros(n-2,n-2);

g = zeros(n,n);
%input BCs
g(1,:) = 0; %top
g(n,:) = 0; %bottom
g(:,1) = 0; %left
g(:,n) = 0; %right
g = repmat(g,1,1,m);
%g = sub2ind(g,n,n);
A = 1:k;
%figure()
%hold on
pos = zeros(n-2,n-2,m,2);
walk = pos;
final_pos = pos;
j = 0;

while sum(final_pos(:,:,:)==0) >= 1
    randnum = rand(s,[n-2 n-2 m]);
    walk = zeros(n-2,n-2,m,2);
    walk(randnum<=0.25,2) = -1; %left
    walk((randnum>0.25 & randnum<=0.5),2) = 1; %right
    walk(randnum>0.5 & randnum<=0.75,1) = -1; %up
    walk(randnum>0.75,1) = 1; %down
    pos = pos + walk;
    %if j >= 1
     %   pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = final_pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n);
    %end
    pos(not(final_pos==0)) = 0;
    final_pos(pos(:,:,:,1)==1 | pos(:,:,:,1)==n | pos(:,:,:,2)==1 | pos(:,:,:,2)==n,:) = pos(:,:,:,1)==1 | pos(:,:,:,1)==n | pos(:,:,:,2)==1 | pos(:,:,:,2)==n;
    %walk(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = [];
    %pos(:,pos(1,:)==1  | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = [];
    %m_ = length(pos);
    j = j + 1;
end
R_avg = sum(sum(g(final_pos(:,:,:,1),final_pos(:,:,:,2))))/m;
%pause(1)
%close all;

u = g;
u(2:n-1,2:n-1) = R_avg;

