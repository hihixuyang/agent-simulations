%% Convenience method to run the first simulation
%   Creates a grid world with basic rules and mov't to test a HBA agent.
%   Bhavin G. and Aditya D. 

function [] = runSim (numBlind, numChaser, numFleer, numIter)

agents = {'BLIND', numBlind; 'CHASER', numChaser; 'FLEER', numFleer};

server(agents, numIter)

