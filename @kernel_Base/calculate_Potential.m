%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [potential] = calculate_Potential(obj, tree, node, potential)
% Calculates the potential for the node and transfers it to the Tree
import H2_2D_Tree.get_Charge
import kernel_Base.*

%% Function overloading with two arguments
if nargin ==2
    potential = zeros(tree.N , tree.m);
    set_Tree_Potential_Zero(tree.root);
    fprintf( ' Calculating potential...\n');
    potential = calculate_Potential(obj, tree, tree.root ,potential);
    fprintf(' Calculated potential.\n');
end


%% Function overloading with four arguments
if nargin ==4
    if ~node.isEmpty && node.isLeaf
        if( ~node.isRoot )
            for k = 1 : 8
                if( ~node.neighbor(k).isEmpty )
                    % Potential from neighbors
                    get_Charge(tree, node.neighbor(k));
                    node.potential   = node.potential + obj.kernel_2D(node.N , node.location , node.neighbor(k).N , node.neighbor(k).location) * node.neighbor(k).charge;
                end
            end
        end
        
        % Potential from Chebyshev nodes (Local expansion)
        node.potential = node.potential + node.R * node.nodePotential;
        
        % Self potential
        node.potential = node.potential + obj.kernel_2D(node.N , node.location , node.N , node.location) * node.charge;
        
        potential = tranfer_Potential_To_Potential_Tree(node,potential);
    else
        computePotential =	false;
        for k = 1 : 8
            if(~node.isRoot)
                if(~node.neighbor(k).isEmpty)
                    if(node.neighbor(k).isLeaf)
                        tempK            = kernel_2D(node.N , node.location , node.neighbor(k).N , node.neighbor(k).location);
                        get_Charge(node.neighbor(k));
                        node.potential   = node.potential + tempK * node.neighbor(k).charge;
                        computePotential = true;
                    end
                end
            end
        end
        
        % M2L Step three from the paper (page 5 Fong et al 2009)
        calculate_NodePotential_From_Wellseparated_Clusters(obj, node,tree.rank,tree.nChebNodes);
        
        % L2L Step four from the paper (page 5 Fong et al 2009)
        transfer_NodePotential_To_Child(node,tree.R);
        
        if computePotential
            potential = tranfer_Potential_To_Potential_Tree(node,potential);
        end
        
        for k= 1:4    
            [potential]= calculate_Potential(obj, tree, node.child(k), potential);
        end
    end
end


end
