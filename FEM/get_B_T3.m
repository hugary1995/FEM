function [B] = get_B_T3(gradN)

B = [gradN(1,1) 0 gradN(1,2) 0 gradN(1,3) 0;
    0 gradN(2,1) 0 gradN(2,2) 0 gradN(2,3);
    gradN(2,1) gradN(1,1) gradN(2,2) gradN(1,2) gradN(2,3) gradN(1,3)];

end

