function [NodalCoord,Connectivity] = getMesh(node,edge,hfun)

disp('Generating mesh using Mesh2D...')
pause(0.1)
[NodalCoord, ~, Connectivity, ~] = refine2(node,edge,[],[],hfun) ;
disp('Converting mesh from T3 to T6...')
pause(0.1)
[NodalCoord, Connectivity] = convertT3toT6(NodalCoord, Connectivity);

end