classdef Chaser
    % Chaser Type of agent
    %   Attempts to follow other agents to raise its score.
    
    properties
        score  
    end
    
    methods(Static)
        function movt = returnAction(surroundings)
            movt = 0;
            numAgents = 0;
            for idx = 1:numel(surroundings)
                if (surroundings(idx) ~= 0 && surroundings(idx) ~= -1 && ~isnan(surroundings(idx)))
                    numAgents = numAgents + 1;
                end
            end
            % this represents the "prob" we will head left-right-up-down
            % as agents are found, we multiply some elems by 0.4, for ex.
            prob = [1, 1, 1, 1];
 
            %           i
            %        e  a  f
            %     l  d  X  b  j
            %        h  c  g  
            %           k
            
            % handle any agents or walls in a-b-c-d. 
            borderPos = [3, 2, 1; 3, 4, 2; 2, 3, 3; 4, 3, 4];
            for i = 1:4
                if (surroundings(borderPos(i, 1), borderPos(i, 2)) ~= 0)
                    % if there is something in a-b-c-d
                    prob(borderPos(i, 3)) = 0; % don't move there
                    if (surroundings(borderPos(i, 1), borderPos(i, 2)) ~= -1)
                        if (numAgents == 1)
                            prob = [0, 0, 0, 0]; % if only agent, stay!
                        else
                            prob = prob * 0.4; % if agent, don't move in general
                        end
                    end
                end
            end
            
            % handle any agents in e-f-g-h
            diagonPos = [2, 2, 1, 3; 2, 4, 2, 3; 4, 2, 1, 4; 4, 4, 2, 4];
            for i = 1:4
                if (Chaser.isAgent(surroundings(diagonPos(i, 1), diagonPos(i, 2))))
                    % if agent in e-f-g-h
                    prob = prob * 0.4; 
                    % pull the same trick as fleer, but TOWARDS the agent
                    prob(diagonPos(i,3))= 2*prob(diagonPos(i,3));
                    prob(diagonPos(i,4))= 2*prob(diagonPos(i,4));
                end
            end
            
            % handle any agents in i-j-k-l.
            distantPos = [1, 3, 3; 3, 1, 1; 5, 3, 4; 3, 5, 2];
            for i = 1:4
                % if agent in i-j-k-l
                if (Chaser.isAgent(surroundings(distantPos(i, 1), distantPos(i, 2))))
                    prob = prob * 0.9; % disad everything but moving towards
                    prob(distantPos(i, 3)) = prob(distantPos(i, 3)) / 0.9;
                end
            end
            
            % extract the best moves and randomly pick from those
            max = 0.0000001;
            for i = 1:4
                    % this is a little complicated to allow for picking >2
                    % moves that have the same probability with equal chance
                if prob(i) > max
                    movt = i;
                    max = prob(i);
                elseif prob(i) == max
                        movt = horzcat(movt, i); % don't pre-allocate
                end
            end
            
            % pick a random movt from the list of desired movts
            movt = movt(randi(size(movt, 2)));
        end
        
        function bool = isAgent(value)
            if (value == 0 || value == -1)
                bool = false;
            else
                bool = true;
            end
        end 
    end
    
end

