function M = getMassMatrix(NodalCoord, Connectivity)

[numElem,numNode] = size(Connectivity);

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];

numQp = size(x,1);

M = zeros(size(NodalCoord,1));

for i = 1:numElem
    Ci = getElementCoordinates(i, NodalCoord, Connectivity);
    dofi = Connectivity(i,:);
    for iqp = 1:numQp
        Ni = getN_T3( x(iqp,1), x(iqp,2) );
        Ni = Ni(1,1:2:2*numNode);
        [~, detJi] = Grad_N_Mapped_T3(Ci);
        M(dofi,dofi) = M(dofi,dofi) + detJi * 1/6 * (Ni' * Ni);
    end
end

end