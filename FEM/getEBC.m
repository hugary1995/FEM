function dof = getEBC(A,u_g,NodalCoord,hfun)

dof = [];

if sum(isnan(A)) == 0
    x = A(1);
    y = A(2);
    [index, ~] = find( ...
        NodalCoord(:,1) > (x-hfun/2) & ...
        NodalCoord(:,1) < (x+hfun/2) & ...
        NodalCoord(:,2) > (y-hfun/2) & ...
        NodalCoord(:,2) < (y+hfun/2));
    if ~isempty(index)
        for j = 1:length(index)
            x_node = NodalCoord(index(j),1);
            y_node = NodalCoord(index(j),2);
            dof = [dof [2*index(j)+A(3)-2;u_g(x_node,y_node)]];
        end
    end
else % defined a line
    if isnan(A(2)) % only x is defined
        x = A(1);
        [index, ~] = find( ...
            NodalCoord(:,1) > (x-hfun/2) & ...
            NodalCoord(:,1) < (x+hfun/2));
        if ~isempty(index)
            for j = 1:length(index)
                x_node = NodalCoord(index(j),1);
                y_node = NodalCoord(index(j),2);
                dof = [dof [2*index(j)+A(3)-2;u_g(x_node,y_node)]];
            end
        end
    else % only y is defined
        y = A(2);
        [index, ~] = find( ...
            NodalCoord(:,2) > (y-hfun/2) & ...
            NodalCoord(:,2) < (y+hfun/2));
        if ~isempty(index)
            for j = 1:length(index)
                x_node = NodalCoord(index(j),1);
                y_node = NodalCoord(index(j),2);
                dof = [dof [2*index(j)+A(3)-2;u_g(x_node,y_node)]];
            end
        end
    end
end
end