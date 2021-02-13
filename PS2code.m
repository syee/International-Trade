%% Steven Yee
% 2/12/21
% ECON 245: International Trade
% Problem set 1

wage=linspace(1,1,10)';
wage=wage./min(wage); %Normalized wage
sigma=1.99;
A=[1:10]';
tol=10^(-4);
maxit=10000;
err=1;

% Not free trade
tau=2.*ones(10)-eye(10); % Now column labels are destination country, row labels are source country
[utility, lambda_diag] = armington(wage, tau, sigma, A, tol, err, maxit);

%Free trade
tau=ones(10);
[utility_free, lambda_diag_free] = armington(wage, tau, sigma, A, tol, err, maxit);

% Gains from trade calculation
gft_1 = utility_free./utility
gft_2 = (lambda_diag_free.^(1/(1-sigma)))./(lambda_diag.^(1/(1-sigma)))
% Gains from trade are largest for the least productive regions
plot(A, gft_1);


function [utility, lambda_diag] = armington(wage, tau, sigma, A, tol, err, maxit)
    iter = 1;
    
    % Loop ends when calculated wage matches actual wage
    while err>tol && iter<maxit
       iter = iter + 1;
       wage_old=wage;
       country_prices = (tau.*(wage./A));  % Now column labels are destination country, row labels are source country
       country_price_sum = sum(country_prices.^(1-sigma),1)'; % Sum column total to get price index for row country
       price_inv = country_price_sum.^(-1/(1-sigma));
       lambda_prep=A.^(sigma-1);
       terms_of_trade = (price_inv*wage')'.^(1-sigma); % Now column labels are destination country, row labels are source country
       first_two = (tau.^(1-sigma).*lambda_prep); % Now column labels are destination country, row labels are source country
       lambda=(first_two.*terms_of_trade); % Now column labels are destination country, row labels are source country
       wage=(lambda*wage); % Calculate wage for a region
       wage=wage./min(wage); % Normalize the least productive country to have a wage of 1
%        err=max(abs(log(w_old./wage)));
       err=max(abs(wage-wage_old));
    end
    utility = wage .* price_inv;
    lambda_diag = diag(lambda);
end
