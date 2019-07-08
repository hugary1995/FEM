function K = assembleStiffnessMatrix(NodalCoord, Connectivity, D, thickness)

Nnode = size(NodalCoord,1);
Nelem = size(Connectivity,1);
K = zeros(2*Nnode,2*Nnode);

for i = 1:Nelem
    C = getElementCoordinates(i, NodalCoord, Connectivity);
    Ke = getStiffnessMatrixT3(C, D, thickness);
    node = Connectivity(i,:);
    dof(1:2:2*length(node)) = 2*node-1;
    dof(2:2:2*length(node)) = 2*node;
    K(dof,dof) = K(dof,dof) + Ke;
end

end

