%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function set_Node_Charge_Zero(node)
% Sets node charge to zero
if  node.isLeaf
    node.charge     =   zeros(size(node.charge));
    node.nodeCharge =   zeros(size(node.nodeCharge));
    node.chargeComputed=false;
else
    node.nodeCharge =   zeros(size(node.nodeCharge));
    for k = 1 : length(node.child)
        kernel_Base.set_Node_Charge_Zero(node.child(k));
    end
end

end