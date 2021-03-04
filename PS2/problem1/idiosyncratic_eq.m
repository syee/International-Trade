% ECON245
% Armington Model
% Equilibrium Solver



function [L_final, real_wage, nominal_wage] = eq(p,tau,nominal_wage,L_initial)
% population

% For testing
% tau = ones(p.S,p.S)*2;
% tau(1:p.S+1:end) = 1;
% nominal_wage = ones(p.S,1);
% L_current = p.L;
% L_current = L_current./sum(L_current);

L_current = L_initial;
err = 1;
iter = 0;

while err>1e-5
%     display(Lnew);
    [lambda, nominal_wage] = wages_eq(p,tau,nominal_wage,L_current);
    price_index = sum((nominal_wage./p.A).^(1-p.sigma),1)^(1/(1-p.sigma));
%     price_index = sum((w./p.A).^(1-p.sigma),1);
    real_wage = (p.U .* nominal_wage)./price_index;
    L_final = L_current;
    L_new = (real_wage.^p.scaling)./sum(real_wage.^p.scaling);
    L_current = (1-p.theta)*L_current + p.theta*L_new;
    err = max(abs(L_current - L_final));
  
    
    % Iteration counter
    iter = iter +1;

    % Print Error 
    fprintf('Iteration Outer %.4f, Error %.4f \n',iter, err);
    

end 

end


