%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function update_Charge( Tree, node)
% Updates the charges on the Tree

% Operation on leaf cell ---------------------------------------------------
if node.isLeaf == true
    H2_2D_Tree.get_Charge(Tree,node);
    %  Step one from the paper (page 5 Fong et al 2009)
    node.nodeCharge = node.nodeCharge + node.R' * node.charge;
else
    % Calling assign children to each child --------------------------------
    for k=1:4
        kernel_Base.update_Charge(Tree, node.child(k,1));
        if ~node.child(k).isEmpty
            % Step two from the paper (page 5 Fong et al 2009)
            node.nodeCharge = node.nodeCharge + transpose(Tree.R{k}) * (node.child(k).nodeCharge);
        end
    end
end


end

