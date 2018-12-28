function K = assembleStiffnessMatrix(NodalCoord, Connectivity, D, thickness)

Nnode = size(NodalCoord,1);
Nelem = size(Connectivity,1);
K = zeros(2*Nnode,2*Nnode);

for i = 1:Nelem
    C = getElementCoordinates(i, NodalCoord, Connectivity);
    Ke = getStiffnessMatrixT6(C, D, thickness);
    node = Connectivity(i,:);
    dof(1:2:12) = 2*node-1;
    dof(2:2:12) = 2*node;
    for p = 1:12
        for q = 1:12
            K(dof(p),dof(q)) = K(dof(p),dof(q)) + Ke(p,q);
        end
    end
end

end

