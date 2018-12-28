function [Fb] = getBodyForce(NodalCoord, Connectivity, b, thickness)

Nnode = size(NodalCoord,1);
Nelem = size(Connectivity,1);
Fb = zeros(2*Nnode,1);

for i = 1:Nelem
    C = getElementCoordinates(i, NodalCoord, Connectivity);
    Fe = getElementForce(C, b, thickness);
    node = Connectivity(i,:);
    dof(1:2:12) = 2*node-1;
    dof(2:2:12) = 2*node;
    for p = 1:12
        Fb(dof(p)) = Fb(dof(p)) + Fe(p);
    end
end


end

