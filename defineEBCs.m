function EBCs = defineEBCs(predefined_case)
if predefined_case == 1
    % complicated P test
    EBCs = {...
        [4 1 1]  @(x,y)0.1;
        [0 NaN 2]   @(x,y)0;
        [0 NaN 1]   @(x,y)0};
else
    if predefined_case == 2
        % patch test
        EBCs = {...
            [NaN 0 1]   @(x,y)0;
            [NaN 0 2]   @(x,y)0;
            [NaN 1 1]   @(x,y)-0.1;
            [NaN 1 2]   @(x,y)0;
            [0 NaN 2]   @(x,y)0;
            [1 NaN 2]   @(x,y)0;};
    else
        if predefined_case == 3
            % mms
            EBCs = {...
                [1 NaN 1]   @(x,y)0.01*sin(4*pi*x)+0.01*x^2*y;
                [1 NaN 2]   @(x,y)0.01*sin(4*pi*y)+0.01*x*y^2;
                [NaN 1 1]   @(x,y)0.01*sin(4*pi*x)+0.01*x^2*y;
                [NaN 1 2]   @(x,y)0.01*sin(4*pi*y)+0.01*x*y^2;
                [2 NaN 1]   @(x,y)0.01*sin(4*pi*x)+0.01*x^2*y;
                [2 NaN 2]   @(x,y)0.01*sin(4*pi*y)+0.01*x*y^2;
                [NaN 2 1]   @(x,y)0.01*sin(4*pi*x)+0.01*x^2*y;
                [NaN 2 2]   @(x,y)0.01*sin(4*pi*y)+0.01*x*y^2;};
        end
    end
end
end