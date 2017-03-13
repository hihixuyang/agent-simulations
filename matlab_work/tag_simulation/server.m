%% 'Main' method for the first simulation
%   Creates a grid world with basic rules and mov't to test a HBA agent.
%   Bhavin G. and Aditya D. 

function [] = server (agents, maxIterations)

[gameState, types, colors] = loadGameState(agents, 0);

clc;
close all;
scatter(types(2, :), types(3, :), 150, colors, 'filled');
pause(0.1);
for iter = 1:maxIterations   
    [gameState, types] = updateGameState(gameState, types);
    scatter(types(2, :), types(3, :), 150, colors, 'filled');
    pause(0.15);
end

close all;

