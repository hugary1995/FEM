function [N] = getN_T3( x, y )

N1 = 1-x-y;
N2 = x;
N3 = y;

N=[N1 0 N2 0 N3 0;
    0 N1 0 N2 0 N3];

end

