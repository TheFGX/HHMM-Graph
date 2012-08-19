function [ output_args ] = drawArcArrow( nodePos, radius, val )

    val = round(val*100)/100;

    [y x] = circle(nodePos(2),nodePos(1),radius,0);
    [arY arX] = circle(nodePos(2),min(x),radius,0);

    [arX2 ind]=find(arX<(nodePos(1)-(radius/2)));
    arX = arX(ind);
    arY = arY(ind);

%     plot(y,x);
    plot(arY,arX,'g');
    arrow([arY(end-1) arX(end-1)],[arY(end) arX(end)],'Facecolor','g','Length',5);
    text(arY(ceil(end/2)), arX(ceil(end/2)),num2str(val));

end
