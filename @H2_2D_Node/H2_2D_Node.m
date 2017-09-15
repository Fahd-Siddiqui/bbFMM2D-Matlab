%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Black Box Fast Multipole Method
%             Written for C++ by    : Sivaram Ambikasaran, Ruoxi Wang
%             Written for Matlab by : Fahd Siddiqui and Ali Rezaei                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef H2_2D_Node < handle
% H2_2D_NODE
% Defines the nodes of the FMM tree alongwith its properties
    properties
        charge
        chargeComputed
        center
        child
        interaction
        index
        isEmpty=true
        isLeaf=true
        isRoot
        location
        N
        neighbor
        nInteraction
        nLevel
        nNeighbor
        nodeCharge
        nodeNumber
        nodePotential
        parent
        potential
        R
        radius
        scaledCnode
    end
    methods
        % Constructor of nodes in the tree
        function node = H2_2D_Node(nLevel, nodeNumber)
            if nargin 
                node.child          = H2_2D_Node;              
                node.interaction    = H2_2D_Node;
                node.neighbor       = H2_2D_Node;
                node.parent         = H2_2D_Node;
                node.center         = [0 0];
                node.charge         = 0;
                node.chargeComputed	= false;
                node.index          = [];
                node.isEmpty		= true;
                node.isLeaf		    = true;
                node.isRoot         = false;
                node.location       = [];
                node.N              = 0;
                node.nInteraction	= 0;
                node.nLevel	        = nLevel;
                node.nNeighbor      = 0;
                node.nodeNumber     = nodeNumber;
                node.nodeCharge     = [];
                node.nodePotential  = [];
                node.potential      = [];
                node.R              = [];
                node.radius         = [0 0];
                node.scaledCnode    = [];
            end
        end
    end
end


