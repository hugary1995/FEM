function strain = getStrain(d, NodalCoord, Connectivity)

[Nelem, ~] = size(Connectivity);
[Nnode, ~] = size(NodalCoord);
strain = zeros(Nnode,4);

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];

for i = 1:Nelem
    C = getElementCoordinates(i,NodalCoord,Connectivity);
    node = Connectivity(i,:);
    d_elem = [];
    for m = 1:6
        d_elem = [d_elem d(node(m)*2-1) d(node(m)*2)];
    end
    epsilon = [0;0;0];
    area = 0;
    for j = 1:3
        [gradN, detJ] = Grad_N_Mapped_T6(x(j,1),x(j,2),C);
        B = get_B_T6(gradN);
        epsilon = epsilon + 1/6 * B * d_elem' * detJ;
        area = area + 1/6 * detJ;
    end
    for m = 1:6
        strain(node(m),1) = strain(node(m),1) + 1;
        strain(node(m),2:4) = strain(node(m),2:4) + epsilon'/area;
    end
end

strain(:,2) = strain(:,2) ./ strain(:,1);
strain(:,3) = strain(:,3) ./ strain(:,1);
strain(:,4) = strain(:,4) ./ strain(:,1);
strain = strain(:,2:4);

end