clear;clc;close all;
m = 2^8; %number of trials for each point
n = 2^10; %size of grid
k = (n-2)^2; %interior pts
s = RandStream("dsfmt19937"); %seed for random number gen
%x = linspace(0,1,n);
%y = x;
%[X,Y] = meshgrid(x,y);
reward = zeros(n-2,n-2);

g = zeros(n,n);
%input BCs
g(1,:) = 0; %top
g(n,:) = 1; %bottom
g(:,1) = 1; %left
g(:,n) = 1; %right
%g = sub2ind(g,n,n);
for i = 1:k
    A = i;
    %figure()
    %hold on
    pos = zeros(2,m);
    final_pos = pos;
    j = 0;
    m_ = m;
    [pos10, pos20] = ind2sub([n-2 n-2],A);
    if pos10 == 1 | pos10 == n | pos20 == 1 | pos20 == n
        continue
    end
    pos(1,:) = pos10;
    pos(2,:) = pos20;
    while sum(final_pos(1,:)==0) >= 1
        randnum = rand(s,[1 m_]);
        walk(1,randnum<=0.25) = 1;
        walk(1,(randnum>0.25 & randnum<=0.5)) = -1;
        walk(2,randnum>0.5 & randnum<=0.75) = 1;
        walk(2,randnum>0.75) = -1;
        pos = pos + walk;
        %if j >= 1
         %   pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = final_pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n);
        %end
        pos(:,not(final_pos(1,:)==0)) = 0;
        final_pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n);
        %walk(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = [];
        %pos(:,pos(1,:)==1 | pos(1,:)==n | pos(2,:)==1 | pos(2,:)==n) = [];
        %m_ = length(pos);
        j = j + 1;
    end
    reward(pos10,pos20) = sum(sum(g(final_pos(1,:),final_pos(2,:))))/m;
    %pause(1)
    %close all;
end
R_avg = reward/m;
u = g;
u(2:n-1,2:n-1) = R_avg;

