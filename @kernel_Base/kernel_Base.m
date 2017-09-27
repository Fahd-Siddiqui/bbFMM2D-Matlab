%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                   BLACK BOX FAST MULTIPOLE METHOD 2D                        %
%                             Version 1.0                                     %
%          Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang            %
%          Written for MATLAB by : Ali Rezaei, Fahd Siddiqui                  %
%                                                                             %
% =========================================================================== %
% LICENSE: MOZILLA 2.0                                                        %
%   This Source Code Form is subject to the terms of the Mozilla Public       %
%   License, v. 2.0. If a copy of the MPL was not distributed with this       %
%   file, You can obtain one at http://mozilla.org/MPL/2.0/.                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef kernel_Base
    % KERNEL_BASE 
    % Functions for calculating potential
    
    %%
    methods (Static)
        % Calculates potential
        [potential] = calculate_Potential(obj, tree, charges, node, potential)
        
        % Evaluate kernel at Chebyshev nodes
        [K] = kernel_Cheb_2D(obj,M,xVec,N,yVec)
        
        % Sets tree potential to zero
        set_Tree_Potential_Zero(node)
        
        % Tranfers potential from node to final potential matrix when needed
        [potential] = tranfer_Potential_To_Potential_Tree(node ,potential)
        
        % L2L Tranfers potential from Chebyshev node of parent to Chebyshev node of children
        transfer_NodePotential_To_Child(node,R)
        
        % M2L Obtains Chebyshev node potential from well separated clusters
        calculate_NodePotential_From_Wellseparated_Clusters(obj, node,rank,nChebNodes)   
        
        % Resets the Node Charges
        set_Node_Charge_Zero(node)
        
        % Sets new charges on the tree
        update_Charge(tree,node)
        
    end  
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%