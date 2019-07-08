function [C] = getElementCoordinates(elemNum, NodalCoord, Connectivity)
%This function returns the nodal coordinates of an element in the format
%C=[x1 y1; x2 y2, x3 y3, ..., x6 y6]
%

C = NodalCoord(Connectivity(elemNum,:),:);

end

