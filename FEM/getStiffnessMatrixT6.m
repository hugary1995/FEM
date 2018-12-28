function [ Ke ] = getStiffnessMatrixT6(C, D, thickness)

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];

Ke = zeros(12,12);

for i=1:3
    [gradN, detJ] = Grad_N_Mapped_T6(x(i,1),x(i,2),C);
    B = get_B_T6(gradN);
    Ke = Ke + B' * D * B * detJ * thickness * 1/6;
end



end

