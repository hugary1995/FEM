function [C] = getElementCoordinates(elemNum, NodalCoord, Connectivity)
%This function returns the nodal coordinates of an element in the format
%C=[x1 y1; x2 y2, x3 y3, ..., x6 y6]
%

for i=1:6
    node = Connectivity(elemNum, i);
    C(i,1)=NodalCoord(node, 1);
    C(i,2)=NodalCoord(node, 2);
end

end

