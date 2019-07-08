%% preamble
clc
clear
addpath('Mesh2D');
addpath('FEM');
libpath();

%% case
% 1: complicated P test
% 2: patch test
% 3: method of manufactured solution
predefined_case = 1;

%% get model definition
if predefined_case == 3
    helem = (1/2).^(1:6);
    %     helem = [1];
else
    helem = 0;
end
L2_error = [];
for i = 1:length(helem)
    [node,edge,hfun] = defineMesh(predefined_case);
    if predefined_case == 3
        hfun = helem(i);
        fprintf('\n\n\n=======================================================\n')
        fprintf('mesh size = %.4e\n', hfun);
    end
    [NodalCoord,Connectivity] = getMesh(node,edge,hfun);
    [E,nu,D,b,h] = defineMaterialAndBodyForce(predefined_case);
    EBCs = defineEBCs(predefined_case);
    EBCs = getEBCs(EBCs,NodalCoord,hfun/10);
    Fpoint = definePointForces(NodalCoord);
    scale = 1;
    
    %% Assemble stiffness matrix
    disp('Assemblying stiffness matrix...')
    pause(0.01)
    K = assembleStiffnessMatrix(NodalCoord, Connectivity, D, h);
    
    %% Get force vector
    disp('Assemblying load vector...')
    pause(0.01)
    % force due to gravity
    Fb = getBodyForce(NodalCoord, Connectivity, b, h);
    F = Fb + Fpoint;
    
    %% Apply Essential Boundary conditions
    disp('Applying EBCs...')
    pause(0.01)
    [K, F] = applyEBC(K, F, EBCs);
    
    %% solve the system
    disp('Solving...')
    pause(0.01)
    d = sparse(K)\sparse(F);
    
    %% postprocessing
    disp('Postprocessing...')
    pause(0.01)
    
    dx = full(d(1:2:end));
    dy = full(d(2:2:end));
    if predefined_case ~= 3
        makePlots
    else
        dx_exact = @(x,y)0.01*sin(4*pi*x)+0.01*x^2*y;
        dy_exact = @(x,y)0.01*sin(4*pi*y)+0.01*x*y^2;
        dx_error = L2error(dx,dx_exact,NodalCoord,Connectivity,h);
        dy_error = L2error(dy,dy_exact,NodalCoord,Connectivity,h);
        total_error = sqrt(dx_error^2+dy_error^2);
        fprintf('L2error = %.4e\n',total_error)
        L2_error = [L2_error total_error];
    end
end
if predefined_case == 3
    figure
    loglog(helem,L2_error,'o-')
    P = polyfit(log(helem),log(L2_error),1);
    title(sprintf('convergence rate = %.4f',P(1)))
end

%% get covariance matrix
disp('Assembly covariance matrix...')
pause(0.01)

L = 0.4;
sigma = 0.07;
cov = @(tau) sigma^2*exp(-tau^2/L^2);

G = assembleCovarianceMatrix(NodalCoord,Connectivity,cov);

%% get mass matrix
disp('Assembly mass matrix...')
pause(0.01)

M = assembleMassMatrix(NodalCoord,Connectivity);

%% solve generalized eigenvalue problem
disp('Solving FIE2...')
pause(0.01)

[V,D] = eig(G,M);
[d,ind] = sort(diag(D),'descend');
V = V(:,ind);

%% sample random field
disp('Sample random field...')
pause(0.01)

for m = 1:length(d)
    if 1-sum(d(1:m))/trace(M\G) < 0.05
        break
    end
end
xi = randn(m,1);
H = V(:,1:m)*(sqrt(d(1:m)).*xi);

PlotFieldonDefoMesh(NodalCoord,Connectivity,1,0*[dx dy],H,'H')
axis equal