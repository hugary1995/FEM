function [Fb] = getBodyForce(NodalCoord, Connectivity, b, thickness)

Nnode = size(NodalCoord,1);
Nelem = size(Connectivity,1);
Fb = zeros(2*Nnode,1);

for i = 1:Nelem
    C = getElementCoordinates(i, NodalCoord, Connectivity);
    Fe = getElementForce(C, b, thickness);
    node = Connectivity(i,:);
    dof(1:2:2*length(node)) = 2*node-1;
    dof(2:2:2*length(node)) = 2*node;
    Fb(dof) = Fb(dof) + Fe;
end


end

