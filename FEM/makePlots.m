% plot strain xx on deformed mesh
strain = getStrain(d, NodalCoord, Connectivity);
stress = getStress(strain, D);

% make plots

disp('          plotting mesh and EBCs...')
figure
plotMesh(NodalCoord, Connectivity,EBCs,'-');
axis equal

disp('          plotting x displacement...')
figure
PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], dx,'u_x')
axis equal

disp('          plotting y displacement...')
figure
PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], dy,'u_y')
axis equal


% disp('          plotting xx strain...')
% figure
% PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], strain(:,1),'\epsilon_{xx}')
% axis equal
% 
% disp('          plotting yy strain...')
% figure
% PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], strain(:,2),'\epsilon_{yy}')
% axis equal
% 
% disp('          plotting xy strain...')
% figure
% PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], strain(:,3),'\epsilon_{xy}')
% axis equal
% 
% % plot stress on deformed mesh
% 
% disp('          plotting xx stress...')
% figure
% PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], stress(:,1),'\sigma_{xx}')
% axis equal
% 
% disp('          plotting yy stress...')
% figure
% PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], stress(:,2),'\sigma_{yy}')
% axis equal
% 
% disp('          plotting xy stress...')
% figure
% PlotFieldonDefoMesh(NodalCoord, Connectivity, scale, [dx dy], stress(:,3),'\sigma_{xy}')
% axis equal