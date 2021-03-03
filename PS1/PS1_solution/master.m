% ECON245
% Armington Model

clc
clear
close all


% -- Call Parameters
run param.m


% -- Scenario 1: tau = 2

% Trade costs
tau = ones(p.S,p.S)*2;
tau(1:p.S+1:end) = 1;

% Equilibrium
[lambda_1, w_1] = trade_eq(p,tau);



% -- Scenario 1: tau = 1

% Trade costs
tau = tau./tau;

% Equilibrium
[lambda_2, w_2] = trade_eq(p,tau);



% -- Analysis
ownshare_1 = diag(lambda_1);
ownshare_2 = diag(lambda_2);

welfare_change = (ownshare_2./ownshare_1).^(1./(1-p.sigma));

plot(p.A,welfare_change)
xlabel('Productivity of Location')
ylabel('Welfare Change')
