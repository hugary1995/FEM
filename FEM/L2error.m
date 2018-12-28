function norm = L2error(f, f_exact, NodalCoord, Connectivity, thickness)

Nelem = size(Connectivity,1);
x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];
norm = 0;

for i = 1:Nelem
    C = getElementCoordinates(i, NodalCoord, Connectivity);
    C_rearranged(1:2:12,1) = C(:,1);
    C_rearranged(2:2:12,1) = C(:,2);
    node = Connectivity(i,:);
    f_elem = f(node);
    for j = 1:3
        [~,detJ] = Grad_N_Mapped_T6(x(j,1),x(j,2),C);
        N_rearranged = getN_T6(x(j,1),x(j,2));
        physical_coord = N_rearranged*C_rearranged;
        fe = f_exact(physical_coord(1),physical_coord(2));
        
        N = N_rearranged(1,1:2:12);
        fh = N*f_elem;
        norm = norm + 1/6 * (fh-fe)^2 * detJ * thickness;
    end
end

norm = sqrt(norm);

end