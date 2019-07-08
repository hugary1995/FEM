function [NodalCoord,Connectivity] = getMesh(node,edge,hfun)

disp('Generating mesh using Mesh2D...')
pause(0.1)
[NodalCoord, ~, Connectivity, ~] = refine2(node,edge,[],[],hfun) ;

end