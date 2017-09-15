%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ R ] = get_Transfer(nCheb, cNode, TNode)
% Evaluates transfer from four children to parent

R    = cell(4 , 1);
S = H2_2D_Tree.get_Transfer_From_Parent_CNode_To_Children_CNode(nCheb , cNode , TNode);
Transfer{1} = S(1 : nCheb , 1 : nCheb);
Transfer{2} = S(nCheb + 1 : 2 * nCheb , 1 : nCheb);

R{1} = kron(Transfer{1},Transfer{1});
R{2} = kron(Transfer{1},Transfer{2});
R{3} = kron(Transfer{2},Transfer{1});
R{4} = kron(Transfer{2},Transfer{2});

end


