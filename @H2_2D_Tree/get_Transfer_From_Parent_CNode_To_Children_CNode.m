%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ Transfer ] = get_Transfer_From_Parent_CNode_To_Children_CNode( nChebNodes, cNode, TNode )
%   Obtains interpolation operator, which interpolates information from Chebyshev nodes of parent to Chebyshev nodes of children

childcNode(1 : nChebNodes , 1) = 0.5 * (cNode - 1);
childcNode(nChebNodes + 1 : 2 * nChebNodes , 1)	= 0.5 * (cNode + 1);
Transfer = H2_2D_Tree.get_Standard_Chebyshev_Polynomials(nChebNodes , 2 * nChebNodes , childcNode);
Transfer = (2.0 * Transfer * TNode' - 1) / nChebNodes;

end

