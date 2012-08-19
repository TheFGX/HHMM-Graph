clc;
clear all;
close all;

nodePos = [10 0.5];
radius = 1;

plot(nodePos(2), nodePos(1),'.r');
hold on;
drawArcArrow(nodePos,radius,5);
drawArcArrow([10 50],radius,4);

drawLineArrow(nodePos, [10 50], radius, 9);