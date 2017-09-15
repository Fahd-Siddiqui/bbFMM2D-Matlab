%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function build_Tree( node )
% Builds the FMM Tree
if ~node.isEmpty
    if ~node.isLeaf
        for i = 1 : 4
            for j = 1 : 8
                node.child(i , 1).neighbor(j , 1) = H2_2D_Node(0,0);
            end
        end
        
        H2_2D_Tree.assign_Siblings(node);                      
        
        for k = 1 : 8
            if ~node.isRoot
                if ~node.neighbor(k).isLeaf  && ~node.neighbor(k).isEmpty
                    H2_2D_Tree.assign_Cousin(node , k);          
                end
            end
        end
        
        for k=1:4
            H2_2D_Tree.build_Tree(node.child(k));
        end
    end
end
end

