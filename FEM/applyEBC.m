function [K, F] = applyEBC(K, F, EssentialBcs)

Dimension = length(EssentialBcs(1,:));

magnitude = max(max(K));
% magnitude = 1;

for i=1:Dimension
    dof = EssentialBcs(1,i);
    F = F - K(:,dof).*EssentialBcs(2,i);
    K(:,dof) = 0;
    K(dof,:) = 0;
    K(dof,dof) = magnitude;
    F(dof) = magnitude * EssentialBcs(2,i);
end

end

