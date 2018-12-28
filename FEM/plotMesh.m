function [] = plotMesh(NodalCoord, Connectivity, EBCs, symbol )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dim = size(Connectivity);

for i=1:dim(1)
    for j=1:dim(2)
        node = Connectivity(i,j);
        Xel(j) = NodalCoord(node,1);
        Yel(j) = NodalCoord(node,2);
    end
    Xel(j+1) =  Xel(1);
    Yel(j+1) = Yel(1);
    plot(Xel,Yel, symbol);
    hold on
end

for i = 1:size(EBCs,2)
    if mod(EBCs(1,i),2)==1
        xnode = NodalCoord((EBCs(1,i)+1)/2,1);
        ynode = NodalCoord((EBCs(1,i)+1)/2,2);
        plot(xnode,ynode,'>')
        hold on
    else
        xnode = NodalCoord(EBCs(1,i)/2,1);
        ynode = NodalCoord(EBCs(1,i)/2,2);
        plot(xnode,ynode,'^')
        hold on
    end
end

hold off

end

