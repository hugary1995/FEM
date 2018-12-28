function [EssentialBcs_new] = getEBCs(EssentialBcs,NodalCoord,hfun)

[Dimension,~] = size(EssentialBcs);
EssentialBcs_new = [];

for i = 1:Dimension
    EBC = getEBC(EssentialBcs{i,1},EssentialBcs{i,2},NodalCoord,hfun);
    EssentialBcs_new = [EssentialBcs_new EBC]; 
end
end
