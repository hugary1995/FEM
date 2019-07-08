function A = getArea(NodalCoord, Connectivity)

numElem = size(Connectivity,1);

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];

NumQP = size(x,1);

A = 0;

for i = 1:numElem
    Ci = getElementCoordinates(i, NodalCoord, Connectivity);
    for iqp = 1:NumQP
        [~, detJi] = Grad_N_Mapped_T3(Ci);
        A = A + detJi * 1/6;
    end
end

end