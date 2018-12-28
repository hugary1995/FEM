function [NodalCoord, new_Connectivity] = convertT3toT6(NodalCoord, Connectivity)

[Nelem, ~] = size(Connectivity);
[Nnode, ~] = size(NodalCoord);

midnode = Nnode;

new_Connectivity = [];
visited_sides = [0 0];
visited_midnodes = [0];

for i = 1:Nelem
    elem_dof = [Connectivity(i,:),Connectivity(i,1)];
    new_elem_dof = [];
    for j = 1:3
        side1 = [elem_dof(j),elem_dof(j+1)];
        side2 = [elem_dof(j+1),elem_dof(j)];
        if ismember(side1,visited_sides,'rows')
            [~,index] = ismember(side1,visited_sides,'rows');
            new_elem_dof(2*j-1) = elem_dof(j);
            new_elem_dof(2*j) = visited_midnodes(index);
        else
            if ismember(side2,visited_sides,'rows')
                [~,index] = ismember(side2,visited_sides,'rows');
                new_elem_dof(2*j-1) = elem_dof(j);
                new_elem_dof(2*j) = visited_midnodes(index);
            else
                midnode_coord = 0.5 * (NodalCoord(elem_dof(j),:) + NodalCoord(elem_dof(j+1),:));
                NodalCoord = [NodalCoord; midnode_coord];
                midnode = midnode + 1;
                new_elem_dof(2*j-1) = elem_dof(j);
                new_elem_dof(2*j) = midnode;
                visited_sides = [visited_sides;elem_dof(j),elem_dof(j+1)];
                visited_midnodes = [visited_midnodes;midnode];
                
            end
        end
    end
    
    % replace with new connectivity
    new_Connectivity = [new_Connectivity;new_elem_dof];
end

end