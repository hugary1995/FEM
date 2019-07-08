function [ Ke ] = getStiffnessMatrixT3(C, D, thickness)

x = [1/6 1/6;
    2/3 1/6;
    1/6 2/3];

numNode = size(C,1);

Ke = zeros(2*numNode);

for i=1:3
    [gradN, detJ] = Grad_N_Mapped_T3(C);
    B = get_B_T3(gradN);
    Ke = Ke + B' * D * B * detJ * thickness * 1/6;
end

end

