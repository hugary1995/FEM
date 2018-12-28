function [node,edge,hfun] = defineMesh(predefined_case)
if predefined_case == 1
    % complicated P test
    node = [                % list of xy "node" coordinates
        0, 0                % outer square
        5, 0
        5, 10
        15, 10
        15, 20                % inner square
        0, 20
        5, 12.5
        10, 12.5
        10, 17.5
        5, 17.5] ;
    
    edge = [                % list of "edges" between nodes
        1, 2                % outer square
        2, 3
        3, 4
        4, 5
        5, 6                % inner square
        6, 1
        7, 8
        8, 9
        9, 10
        10, 7] ;
    
    hfun = 0.5;
else
    if predefined_case == 2
        % patch test
        node = [                % list of xy "node" coordinates
            0, 0                % outer square
            1, 0
            1, 1
            0, 1];
        
        edge = [                % list of "edges" between nodes
            1, 2                % outer square
            2, 3
            3, 4
            4, 1];
        
        hfun = 1;
    else
        if predefined_case == 3
            node = [                % list of xy "node" coordinates
                1, 1                % outer square
                2, 1
                2, 2
                1, 2];
            
            edge = [                % list of "edges" between nodes
                1, 2                % outer square
                2, 3
                3, 4
                4, 1];
            
            hfun = 1;
        end
    end
end
end