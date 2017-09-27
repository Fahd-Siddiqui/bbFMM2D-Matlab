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

classdef H2_2D_Tree < handle
    % H2_2D_TREE The FMM Tree 
    % Generates the FMM Tree Class Object
    
    properties
        root=H2_2D_Node;
        center
        chargeTree
        cNode
        locationTree
        m
        maxLevels
        N
        nChebNodes
        R
        radius
        rank
        TNode  
    end
    
    %%
    methods
        function Tree=H2_2D_Tree(nChebNodes, location, N, m)
            % Constructor of class H2_2D_Tree
            if nargin
                Tree.nChebNodes        =	nChebNodes;
                Tree.rank              =	nChebNodes*nChebNodes;
                Tree.N                 =	N;
                Tree.m                 =	m;
                Tree.maxLevels         =	0;
                Tree.locationTree      =   location;
                
                % Get Chebyshev nodes
                Tree.cNode = H2_2D_Tree.get_Standard_Chebyshev_Nodes(Tree.nChebNodes);
                
                % Get Chebyshev polynomials evaluated at Chebyshev nodes
                Tree.TNode = H2_2D_Tree.get_Standard_Chebyshev_Polynomials( Tree.nChebNodes, Tree.nChebNodes, Tree.cNode );
                
                % Gets transfer matrices
                Tree.R     = H2_2D_Tree.get_Transfer(Tree.nChebNodes,Tree.cNode, Tree.TNode);
                
                [Tree.center, Tree.radius] = H2_2D_Tree.get_Center_Radius(location);
                % Create root
                Tree.root              = H2_2D_Node(0,0);
                Tree.root.nNeighbor    =	0;
                Tree.root.nInteraction =	0;
                Tree.root.N            =	N;
                Tree.root.center       = Tree.center;
                Tree.root.radius       = Tree.radius;
                Tree.root.index        = (1 : N);
                Tree.root.isRoot       = true;
                
                fprintf('\n\n Assigning children...');
                H2_2D_Tree.assign_Children(Tree, Tree.root , Tree.R , nChebNodes , Tree.cNode , Tree.TNode);
                fprintf(' Done.');

                H2_2D_Tree.build_Tree(Tree.root);
                fprintf('\n Maximum levels is: %d', Tree.maxLevels);
                
            end
            
        end
    end
    
    %%
    methods (Static)
        % Assigns Children
        assign_Children( Tree, node, R, nChebNodes,cNode,TNode )
                
        % Assigns Siblings and Cousins
        build_Tree(node )
                
        % Obtains charge to node when needed
        get_Charge( Tree, node )
        
        % Obtains standard Chebyshev nodes in interval [-1,1]
        [ cNode ] = get_Standard_Chebyshev_Nodes(nChebNodes)
                
        % Obtains standard Chebyshev polynomials evaluated at given set of Points;
        [ T ]  = get_Standard_Chebyshev_Polynomials( nChebPoly, N, x )
                
        % Obtains center and radius of node location
        [ center, radius ] = get_Center_Radius( location )
                
        % Obtains interpolation operator, which interpolates information from Chebyshev nodes of parent to Points in children
        [ R ] = get_Transfer_From_Parent_To_Children( N, nChebNodes, location, center, radius, TNode )
                
        % Obtains interpolation operator, which interpolates information from Chebyshev nodes of parent to Chebyshev nodes of children
        [ Transfer ] = get_Transfer_From_Parent_CNode_To_Children_CNode( nChebNodes, cNode, TNode )
                
        % Evaluates transfer from four children to parent;
        [ R ] = get_Transfer(nCheb, cNode, TNode)
        
        % Evaluates 'nChebNodes' standardized chebyshev nodes in any interval;
        get_Scaled_ChebNode( node, cNode)
                
        % Assign siblings to children of a the node
        assign_Siblings( node )
        
        % Assign cousins to children of the node
        assign_Cousin(node , neighborNumber)
                
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
