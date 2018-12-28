function [ ForceElem ] = getElementForce(C, b, thickness)

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];
ForceElem = zeros(12,1);

C_rearranged(1:2:12,1) = C(:,1);
C_rearranged(2:2:12,1) = C(:,2);

for i = 1:3
    [~, detJ] = Grad_N_Mapped_T6(x(i,1),x(i,2), C);
    N = getN_T6(x(i,1),x(i,2));
    physical_coord = N*C_rearranged;
    ForceElem = ForceElem + thickness * N'* b(physical_coord(1),physical_coord(2))...
        * detJ * 1/6;
end
end

