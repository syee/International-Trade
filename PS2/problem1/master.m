% ECON245
% Armington Model

clc
clear
close all


% -- Call Parameters
run param.m

% Initial wage guess
w = ones(p.S,1);



% -- Scenario 1: tau = 2
% Trade costs
tau = ones(p.S,p.S)*2;
tau(1:p.S+1:end) = 1;

% Initial populations and normalize them to sum to 1
L = p.L;
L = L./sum(L);
% Equilibrium
[final_population, real_wage, nominal_wage] = population_eq(p,tau,w, L);


% -- Scenario 1: tau = 1
% Trade costs
tau = tau./tau;
% Equilibrium
[final_population2, real_wage2, nominal_wage2] = population_eq(p,tau,w, L);



% -- Analysis

population_change = final_population - final_population2;

plot(p.A,population_change)
xlabel('Productivity of Location')
ylabel('Welfare Change')
