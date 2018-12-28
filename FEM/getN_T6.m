function [N] = getN_T6( x, y )

N1 = x * (2 * x - 1);
N2 = 4 * x * y;
N3 = y * (2 * y - 1);
N4 = 4 * y * (1 - x - y);
N5 = (1 - x - y) * (2 * (1 - x - y) - 1);
N6 = 4 * (1 - x - y) * x;

N=[N1 0 N2 0 N3 0 N4 0 N5 0 N6 0;
    0 N1 0 N2 0 N3 0 N4 0 N5 0 N6];

end

