function [gradN, detJ] = Grad_N_Mapped_T6(x,y,C)

% Grad N
GN = [  4*x-1,  4*y,    0,      -4*y,       4*x+4*y-3,  -8*x-4*y+4;
        0,      4*x,    4*y-1,  -8*y-4*x+4, 4*x+4*y-3,  -4*x];

% Jacobian matrix
J     = GN*C;

% determinant of Jacobian
detJ  = det(J);

% Gradient of the shape function
gradN     = J\GN;

end
