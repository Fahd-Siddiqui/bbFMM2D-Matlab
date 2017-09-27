%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                   BLACK BOX FAST MULTIPOLE METHOD 2D                        %
%                             Version 1.0                                     %
%          Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang            %
%          Written for MATLAB by : Ali Rezaei, Fahd Siddiqui                  %
%              https://github.com/DrFahdSiddiqui/bbFMM2D                      %
%                                                                             %
% =========================================================================== %
% LICENSE: MOZILLA 2.0                                                        %
%   This Source Code Form is subject to the terms of the Mozilla Public       %
%   License, v. 2.0. If a copy of the MPL was not distributed with this       %
%   file, You can obtain one at http://mozilla.org/MPL/2.0/.                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function update_Charge( Tree, node)
% Updates the charges on the Tree

% Operation on leaf cell 
if node.isLeaf == true
    H2_2D_Tree.get_Charge(Tree,node);
    %  Step one from the paper (page 5 Fong et al 2009)
    node.nodeCharge = node.nodeCharge + node.R' * node.charge;
else
    % Calling assign children to each child 
    for k=1:4
        kernel_Base.update_Charge(Tree, node.child(k,1));
        if ~node.child(k).isEmpty
            % Step two from the paper (page 5 Fong et al 2009)
            node.nodeCharge = node.nodeCharge + transpose(Tree.R{k}) * (node.child(k).nodeCharge);
        end
    end
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
