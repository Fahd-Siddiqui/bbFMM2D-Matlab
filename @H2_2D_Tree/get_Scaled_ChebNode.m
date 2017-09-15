%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  get_Scaled_ChebNode( node, cNode)
% Evaluates 'nChebNodes' standardized chebyshev nodes in any interval
node.scaledCnode = node.center + node.radius .* cNode;

end

