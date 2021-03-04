% ECON245
% Armington Model
% Parameter File

% Countries
p.S = 10;

% Elasticity of Substitution
p.sigma = 2;

% Productivities
p.A = 1:1:p.S;
p.A = p.A';

% Amenities
p.U = flip(p.A);

% Workers
p.L = ones(p.S,1);

% Tuning factor
p.theta = .1;
p.gamma = 1/20000;
p.scaling = 8;