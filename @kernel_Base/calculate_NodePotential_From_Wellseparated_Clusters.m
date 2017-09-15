%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function calculate_NodePotential_From_Wellseparated_Clusters(obj, node,rank,nChebNodes)
% M2L Obtains Chebyshev node potential from well separated clusters

K = zeros(rank , rank);

for k = 1 : 4
     if~node.child(k).isEmpty
         for i= 1: node.child(k).nInteraction
             if ~node.child(k).interaction(i).isEmpty
                 K = kernel_Base.kernel_Cheb_2D(obj, nChebNodes , node.child(k).scaledCnode , nChebNodes , node.child(k).interaction(i).scaledCnode);
                 % M2L Step three from the paper (page 5 Fong et al 2009)
                node.child(k).nodePotential	=	node.child(k).nodePotential + K * node.child(k).interaction(i).nodeCharge;
             end
         end
     end
 end

end