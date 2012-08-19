function [ output_args ] = drawHHMM( q, A, PI, B )

MAXY = size(q,2);
MAXX = size(q,2);

[stateY stateX] = find(q(:,:,1)~=0);
nodePos = [MAXY-stateY stateX];
radius = 0.2;


[y x] = circle(1,MAXY-1,radius,0);
plot(y,x);
axis([0 MAXX+1 1 MAXY]);
hold on;
for i=1:length(stateX);
    if(stateY(i)~=1)
        if q(stateY(i),stateX(i),1)==2
            [y x] = circle(nodePos(i,2),nodePos(i,1),radius,1);
            plot(y,x,'.','MarkerSize',2);
        else
            [y x] = circle(nodePos(i,2),nodePos(i,1),radius,0);
            plot(y,x);
        end
        val = A(stateX(i),stateX(i),stateY(i)-1);
        if(val~=0)
            drawArcArrow(nodePos(i,:),radius,val);
        end
        if stateX(i) > 1
            val = A(stateX(i),stateX(i)-1,stateY(i)-1);
            if(val~=0)
                prevPos = [MAXY-stateY(i) stateX(i)-1];
                drawLineArrow(nodePos(i,:), prevPos, radius,val);
            end
        end
        if MAXX > stateX(i)
            val = A(stateX(i),stateX(i)+1,stateY(i)-1);
            if(val~=0)
                prevPos = [MAXY-stateY(i) stateX(i)+1];
                drawLineArrow(nodePos(i,:),prevPos,radius,val);
            end
        end
        
        for g = 1:MAXX;
        	val = PI(g,stateX(i),stateY(i)-1);
            if(val~=0)
                prevPos = [MAXY-stateY(i)+1, g];
                drawLineArrow(prevPos,nodePos(i,:),radius,val);
            end
        end
        for g = 1:MAXX;
        	val = A(stateX(i),g,stateY(i)-1);
            if(val~=0 && abs(stateX(i)-g)>1)
            	prevPos = [MAXY-stateY(i) g];
                drawArcLineArrow(nodePos(i,:),prevPos,radius,val,abs(stateX(i)-g));
            end
        end
        if q(stateY(i),stateX(i),1)==2
            parent_i = find(cumsum(q(stateY(i)-1,:,2))>=stateX(i));
            prevPos = [MAXY-stateY(i)+1 parent_i(1)];
            drawLineArrow(nodePos(i,:),prevPos,radius,val);
        end
    end
end

[prodY prodX] = find(q(:,:,1)==1 & q(:,:,2)==0);
for i=1:length(prodY);
    for j=1:length(B(1,1,:));
        val = round(100*B(prodY(i),prodX(i),j))/100;
%         if( val~=0 );
            text(prodX(i)-0.1,(MAXY-prodY(i))-((j-1)/10)-0.7,num2str(val));
%         end
    end
end
box off;
axis off;
end
