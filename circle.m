function [ y x ] = circle( nodeY,nodeX,radius,ende )

if ende==1
    phi = 0:0.1:2*pi;
else
    phi = 0:0.01:2*pi;
end
        
y = nodeY+radius*sin(phi);
x = nodeX+radius*cos(phi);

end
