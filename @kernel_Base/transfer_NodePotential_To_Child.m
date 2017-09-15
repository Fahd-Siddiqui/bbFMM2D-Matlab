%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function transfer_NodePotential_To_Child(node,R)
% L2L Tranfers potential from Chebyshev node of parent to Chebyshev node of children

% L2L Step four from the paper (page 5 Fong et al 2009)
for k = 1 : 4
    if(~node.child(k).isEmpty)
        node.child(k).nodePotential	= node.child(k).nodePotential + R{k} * node.nodePotential;
    end
end


end