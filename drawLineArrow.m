function [ output_args ] = drawLineArrow( nodePos, prevPos, radius, val )

    val = round(val*100)/100;
    lineXprev = linspace(nodePos(2),prevPos(2),50);
    lineYprev = linspace(nodePos(1),prevPos(1),50);

    i=1:length(lineXprev);
    d1 = (lineXprev(i)-nodePos(2)).^2+(lineYprev(i)-nodePos(1)).^2;
    t1 = d1>radius^2;
    d2 = (lineXprev(i)-prevPos(2)).^2+(lineYprev(i)-prevPos(1)).^2;
    t2 = d2>radius^2;
    t = find(t1+t2 == 2);

    lineX = lineXprev(t);
    lineY = lineYprev(t);
    if lineY(1)==lineY(end) && lineX(1)>lineX(end);
        lineY=lineY+0.01;
        arrow([lineX(1),lineY(1)],[lineX(end),lineY(end)],'Facecolor','g','Length',5);
        text(lineX(ceil(end/2)), lineY(ceil(end/2))+0.01,num2str(val));
    else if lineY(1)==lineY(end) && lineX(1)<lineX(end);
        lineY=lineY-0.01;
        arrow([lineX(1),lineY(1)],[lineX(end),lineY(end)],'Facecolor','g','Length',5);
        text(lineX(ceil(end/2)), lineY(ceil(end/2))-0.05,num2str(val));
	else
        if val~=0
            arrow([lineX(1),lineY(1)],[lineX(end),lineY(end)],'Facecolor','g','Length',5);
            text(lineX(ceil(end/2)), lineY(ceil(end/2)),num2str(val));
        else
            plot(lineX,lineY,'.','MarkerSize',2);
        end
        end


end
