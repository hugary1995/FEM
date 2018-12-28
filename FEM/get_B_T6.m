function [B] = get_B_T6(gradN)

B = [gradN(1,1) 0 gradN(1,2) 0 gradN(1,3) 0 gradN(1,4) 0 gradN(1,5) 0 gradN(1,6) 0;
    0 gradN(2,1) 0 gradN(2,2) 0 gradN(2,3) 0 gradN(2,4) 0 gradN(2,5) 0 gradN(2,6);
    gradN(2,1) gradN(1,1) gradN(2,2) gradN(1,2) gradN(2,3) gradN(1,3) gradN(2,4) gradN(1,4) gradN(2,5) gradN(1,5) gradN(2,6) gradN(1,6)];

end

