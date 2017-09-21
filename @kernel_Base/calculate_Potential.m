%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [potential] = calculate_Potential(obj, tree, charges, node, potential)
% Calculates the potential for the node and transfers it to the Tree

%% Function overloading with three arguments
if nargin ==3
    potential = zeros(tree.N , tree.m);
    kernel_Base.set_Tree_Potential_Zero(tree.root);
    
    kernel_Base.set_Node_Charge_Zero(tree.root);
    tree.chargeTree        =	charges;
    kernel_Base.update_Charge(tree,tree.root);
    
    fprintf( ' Calculating potential...\n');
    potential = kernel_Base.calculate_Potential(obj, tree, [], tree.root ,potential);
    fprintf(' Calculated potential.\n');
end


%% Function overloading with five arguments
if nargin ==5
    if ~node.isEmpty
        if    node.isLeaf
            if( ~node.isRoot )
                for k = 1 : 8
                    if( ~node.neighbor(k).isEmpty )
                        % Potential from neighbors
                        H2_2D_Tree.get_Charge(tree, node.neighbor(k));
                        node.potential   = node.potential + obj.kernel_2D(node.N , node.location , node.neighbor(k).N , node.neighbor(k).location) * node.neighbor(k).charge;
                    end
                end
            end
            
            % Potential from Chebyshev nodes (Local expansion)
            node.potential = node.potential + node.R * node.nodePotential;
            
            % Self potential
            node.potential = node.potential + obj.kernel_2D(node.N , node.location , node.N , node.location) * node.charge;
            
            potential = kernel_Base.tranfer_Potential_To_Potential_Tree(node,potential);
        else
            computePotential =	false;
            for k = 1 : 8
                if(~node.isRoot)
                    if(~node.neighbor(k).isEmpty)
                        if(node.neighbor(k).isLeaf)
                            tempK            = obj.kernel_2D(node.N , node.location , node.neighbor(k).N , node.neighbor(k).location);
                            H2_2D_Tree.get_Charge(tree, node.neighbor(k));
                            node.potential   = node.potential + tempK * node.neighbor(k).charge;
                            computePotential = true;
                        end
                    end
                end
            end
            
            % M2L Step three from the paper (page 5 Fong et al 2009)
            kernel_Base.calculate_NodePotential_From_Wellseparated_Clusters(obj, node,tree.rank,tree.nChebNodes);
            
            % L2L Step four from the paper (page 5 Fong et al 2009)
            kernel_Base.transfer_NodePotential_To_Child(node,tree.R);
            
            if computePotential
                potential = kernel_Base.tranfer_Potential_To_Potential_Tree(node,potential);
            end
            
            for k= 1:4
                [potential]= kernel_Base.calculate_Potential(obj, tree, [], node.child(k), potential);
            end
        end
        
    end


end
