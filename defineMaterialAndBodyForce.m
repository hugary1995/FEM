function [E,nu,D,b,h] = defineMaterialAndBodyForce(predefined_case)
if predefined_case == 1
    % complicated P test
    E = 200E9;
    nu = 0.3;
    rho = 7800;
    g = 9.8;
    b = @(x,y) [0;-rho*g];
    h = 0.1;
else
    if predefined_case == 2
        % patch test
        E = 1;
        nu = 0;
        b = @(x,y) [
            0;
            0];
        h = 1;
    else
        if predefined_case == 3
            % mms
            E = 1;
            nu = 0;
            b = @(x,y) [
                0.16*pi^2*sin(4*pi*x)-0.03*y;
                0.16*pi^2*sin(4*pi*y)-0.03*x;];
            h = 1;
        end
    end
end
%% plane stress
% a = E/(1-nu^2);
% D = a * [1 nu 0; nu 1 0; 0 0 (1-nu)/2];

%% plane strain
a = E/(1+nu)/(1-2*nu);
D = a * [1-nu nu 0; nu 1-nu 0; 0 0 (1-2*nu)/2];

end