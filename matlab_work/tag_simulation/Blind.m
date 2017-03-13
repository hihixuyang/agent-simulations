classdef Blind
    %BLIND Type of agent
    %   Exhibits random movement. Stays away from walls and other agents.
    
    properties
        score = 0;
    end
    
    methods(Static)
        function movt = returnAction(surroundings)
            % identify walls to simplify updateGameState logic
            borderPos = [3, 2, 1; 3, 4, 2; 2, 3, 3; 4, 3, 4 ];
            walls = zeros(1, 5);
            for i = 1:4
                if (surroundings(borderPos(i, 1),(borderPos(i, 2)))~= 0)
                    walls(i + 1) = NaN;
                end
            end
            
            movt = randi(5) - 1;
            while (walls(movt + 1) ~= 0)
                movt = randi(5) - 1;
            end
        end
    end
    
end

