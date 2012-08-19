function [ output_args ] = drawArcLineArrow( nodePos, prevPos, radius, val, dist )

%     [nodePos, prevPos, val, dist]

    val = round(val*100)/100;
    
    if nodePos(2)>prevPos(2)
        [arY arX] = circle(nodePos(2)-dist/2,nodePos(1),dist/2,0);
    else
        [arY arX] = circle(nodePos(2)+dist/2,nodePos(1),dist/2,0);
    end

    [arX2 ind]=find(arX<nodePos(1));
    arY = arY(ind);
    arX = arX(ind);
    
    arX = max(arX) - (max(arX)-arX)*(1/dist);
    
    plot(arY,arX,'g');
    if nodePos(1)>prevPos(end);
        arX=arX+0.01;
        arrow([arY(2) arX(2)],[arY(1) arX(1)],'Facecolor','g','Length',5);
%         arrow([arY(end-1) arX(end-1)],[arY(end) arX(end)],'Facecolor','g','Length',5);
        text(arY(ceil(end/2)), arX(ceil(end/2))-0.01,num2str(val));
    else
        arX=arX-0.01;
        arrow([arY(2) arX(2)],[arY(1) arX(1)],'Facecolor','g','Length',5);
        text(arY(ceil(end/2)), arX(ceil(end/2))-0.05,num2str(val));
    end

end
