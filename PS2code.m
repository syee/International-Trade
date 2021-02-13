%% Step 1

% guess the vector of 10 w_i 

%use formula for lambda_j on page based on wages. 
% calculate P_j from basic formula ?w/A

%get new the wages using labor market clearing



%No free trade

%iterate until the new wages are the old wages
wage=linspace(1,1,10)';
wage=wage./min(wage);
% tau=ones(10);
% tau=1.01*ones(10)-0.001.*eye(10);
tau=2.*ones(10)-eye(10); %now column labels are destination country, row labels are source country
sigma=1.99;
A=[1:10]';
tol=10^(-4);
maxit=10000;
err=1;
iter=1;
while err>tol && iter<maxit
       iter = iter + 1;
       %store the old wages
       w_old=wage;
       country_prices = (tau.*(wage./A));  %now column labels are destination country, row labels are source country
       country_price_sum = sum(country_prices.^(1-sigma),1)'; %Sum column total to get price index for row country
       price_inv = country_price_sum.^(-1/(1-sigma));
       lambda_prep=A.^(sigma-1);
       terms_of_trade = (price_inv*wage')'.^(1-sigma); %now column labels are destination country, row labels are source country
       first_two = (tau.^(1-sigma).*lambda_prep); %now column labels are destination country, row labels are source country
       lambda=(first_two.*terms_of_trade); %now column labels are destination country, row labels are source country
       wage=(lambda*wage);
       wage=wage./min(wage);
%        err=max(abs(log(w_old./wage)));
       err=max(abs(wage-w_old));
end

utility = wage .* price_inv;
lambda_jj = diag(lambda);


%Free trade

wage=linspace(1,1,10)';
wage=wage./min(wage);
tau=ones(10);
% tau=1.01*ones(10)-0.001.*eye(10);
% tau=2.*ones(10)-eye(10); %now column labels are destination country, row labels are source country
sigma=1.99;
A=[1:10]';
tol=10^(-4);
maxit=10000;
err=1;
iter=1;
while err>tol && iter<maxit
       iter = iter + 1;
       %store the old wages
       w_old=wage;
       country_prices = (tau.*(wage./A));  %now column labels are destination country, row labels are source country
       country_price_sum = sum(country_prices.^(1-sigma),1)'; %Sum column total to get price index for row country
       price_inv = country_price_sum.^(-1/(1-sigma));
       lambda_prep=A.^(sigma-1);
       terms_of_trade = (price_inv*wage')'.^(1-sigma); %now column labels are destination country, row labels are source country
       first_two = (tau.^(1-sigma).*lambda_prep); %now column labels are destination country, row labels are source country
       lambda=(first_two.*terms_of_trade); %now column labels are destination country, row labels are source country
       wage=(lambda*wage);
       wage=wage./min(wage);
%       err=max(abs(log(w_old./wage)));
       err=max(abs(wage-w_old));
end

lambda_jj_free = diag(lambda);
utility_free = wage .* price_inv;
gft_1 = utility_free./utility;
gft_2 = (lambda_jj_free.^(1/(1-sigma)))./(lambda_jj.^(1/(1-sigma)));

