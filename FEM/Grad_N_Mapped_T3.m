function [gradN, detJ] = Grad_N_Mapped_T3(C)

% Grad N
GN = [  -1,  1,  0;
        -1,  0,  1];

% Jacobian matrix
J     = GN*C;

% determinant of Jacobian
detJ  = det(J);

% Gradient of the shape function
gradN     = J\GN;

end
