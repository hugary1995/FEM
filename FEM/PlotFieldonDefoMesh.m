function PlotFieldonDefoMesh(NodalCoord,Connectivity,scale,d,f,plottitle)

ux = d(:,1);
uy = d(:,2);

NodalCoordX = NodalCoord(:,1);
NodalCoordY = NodalCoord(:,2);

X = NodalCoordX(Connectivity)';
Y = NodalCoordY(Connectivity)';

UX = ux(Connectivity)';
UY = uy(Connectivity)';

profile = f(Connectivity)';

% Plotting the profile of a property on the deformed mesh
defoX = X+scale*UX ;
defoY = Y+scale*UY ;
plot(defoX,defoY,'k')
fill(defoX,defoY,profile,'EdgeColor','none')
title(plottitle) ;
axis off ;
colorbar
colormap jet

end









