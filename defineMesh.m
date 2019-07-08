function [node,edge,hfun] = defineMesh(predefined_case)
if predefined_case == 1
%     node = [                % list of xy "node" coordinates
%         0, 0                % outer square
%         1, 0
%         2, 0
%         3, 0
%         4, 0                % inner square
%         4, 1
%         3, 1
%         2, 1
%         1, 1
%         0, 1] ;
%     
%     edge = [                % list of "edges" between nodes
%         1, 2                % outer square
%         2, 3
%         3, 4
%         4, 5
%         5, 6                % inner square
%         6, 7
%         7, 8
%         8, 9
%         9, 10
%         10, 1] ;
    node = [                % list of xy "node" coordinates
        0, 0
        4, 0                % inner square
        4, 1
        0, 1] ;
    
    edge = [                % list of "edges" between nodes
        1, 2                % outer square
        2, 3
        3, 4
        4, 1] ;
    
    hfun = 0.1;
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