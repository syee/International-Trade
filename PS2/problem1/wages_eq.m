% ECON245
% Armington Model
% Equilibrium Solver



function [lambda, w_new] = eq(p,tau,w,L)
% wages
err = 1;
iter = 0;

while err>1e-3
    % wages
    % Price of local varieties in each destination
    price  = (w./p.A).*tau;

    % Matrix of trade shares
    lambda = price.^(1-p.sigma);
    lambda = lambda./repmat(sum(lambda,1),p.S,1);
    % Updating wages using goods market clearing
    w_new = (1./L).*sum(lambda.*repmat((w.*L)',p.S,1),2); %sum over rows because we want lambda_ji
    
    % Enforcing normalization
    w_new = w_new./w_new(1,1);

    % Convergence criterion
    err = max(abs(log(w./w_new)));

    % Updating wages with tuning factor theta
    w = p.theta*w_new+(1-p.theta)*w;

    % Iteration counter
    iter = iter +1;

    % Print Error 
%     fprintf('Iteration Inner %.4f, Error %.4f \n',iter, err);

end 

end


