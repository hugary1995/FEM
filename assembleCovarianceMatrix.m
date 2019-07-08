function G = assembleCovarianceMatrix(NodalCoord, Connectivity, cov)

numNode = size(NodalCoord,1);
[numElem,numNodePerElem] = size(Connectivity);
G = zeros(numNode);

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];

numQp = size(x,1);

for i = 1:numElem
    dofi = Connectivity(i,:);
    Ci = getElementCoordinates(i,NodalCoord,Connectivity);
    [~, detJi] = Grad_N_Mapped_T3(Ci);
    for iqp = 1:numQp
        Ni = getN_T3(x(iqp,1),x(iqp,2));
        Ni = Ni(1,1:2:2*numNodePerElem);
        xi = Ni*Ci;
        for j = 1:numElem
            dofj = Connectivity(j,:);
            Cj = getElementCoordinates(j,NodalCoord,Connectivity);
            [~, detJj] = Grad_N_Mapped_T3(Cj);
            for jqp = 1:numQp
                Nj = getN_T3(x(jqp,1),x(jqp,2));
                Nj = Nj(1,1:2:2*numNodePerElem);
                xj = Nj*Cj;
                tau = norm(xi-xj);
                G(dofi,dofj) = G(dofi,dofj) + detJi*detJj*1/6*1/6*Ni'*Nj*cov(tau);
            end
        end
    end
end

end

