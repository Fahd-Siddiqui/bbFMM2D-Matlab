%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function set_Tree_Potential_Zero(node)
% Sets tree potential to zero
if ~node.isEmpty
    node.potential     =   zeros(size(node.potential));
    node.nodePotential =   zeros(size(node.nodePotential));
    
    for k = 1 : length(node.child)
        kernel_Base.set_Tree_Potential_Zero(node.child(k));
    end
end

end