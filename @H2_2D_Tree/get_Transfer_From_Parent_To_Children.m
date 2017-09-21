%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ R ] = get_Transfer_From_Parent_To_Children( N, nChebNodes, location, center, radius, TNode )
% Obtains interpolation operator, which interpolates information from Chebyshev nodes of parent to Points in children
standlocation=zeros(N,2);
for i=1:2
    standlocation(:,i) = ((location(:,i) - center(i)) ./ radius(i));
end
Transfer = cell(2 , 1);

for k = 1 : 2
    % Calculating Tk (Evaluating Chebysheves at locations)
    Transfer{k} = H2_2D_Tree.get_Standard_Chebyshev_Polynomials(nChebNodes , N , standlocation(: , k));
    % Calculating Sn (Location to nodes)
    Transfer{k}	= (2.0 * Transfer{k} * TNode' - 1) / nChebNodes;
end

rank =	nChebNodes * nChebNodes;
R    =	zeros(N , rank);

for i = 1 : nChebNodes
    for j = 1 : nChebNodes
        R(: , i + nChebNodes * (j - 1)) = Transfer{1}(: , i) .* Transfer{2}(: , j);
    end
end


end

