% Steven Yee
% ECON245
% Armington Model


%% Problem 1

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
[final_population1_2, real_wage1_2, nominal_wage1_2] = trade_eq(p,tau,w, L);
% [final_population1_2, real_wage1_2, nominal_wage1_2] = population_eq(p,tau);

% -- Scenario 1: tau = 1
% Trade costs?
tau = tau./tau;
% Equilibrium
[final_population1_1, real_wage1_1, nominal_wage1_1] = trade_eq(p,tau,w, L);
% [final_population1_1, real_wage1_1, nominal_wage1_1] = population_eq(p,tau);



% -- Analysis
population_change = final_population1_2 - final_population1_1;

plot(p.A,population_change)
xlabel('Productivity of Location')
ylabel('Population Change')
title('Problem 1')
saveas(gcf, 'problem1.png')

figure; hold on
a2 = plot(p.A,final_population1_2); M2 = "No free trade";
a1 = plot(p.A,final_population1_1); M1 = "Free trade";
legend([a1; a2], [M1; M2])
title('Problem 1: Population graphs')
saveas(gcf, 'problem1_population.png')

%We can see with free trade, less population is concentrated in the
%middle of the distribution. Ex ante, the middle of the distribution is 
%the most desirable due to its combination of medium productivity and 
%medium amenities as opposed to the edges which have either high 
%productivity and low amenities (e.g., region 10) or low productivity and 
%high amenities (e.g., region 1). Free trade allows for these less desirable 
%areas to somewhat maintain affordable prices. This narrows the ``appeal" gap
%between the middle and edges, so there is relatively more population in 
%the edges under free trade as opposed to no free trade.


%% Problem 2

% clc
% clear
% close all

% -- Call Parameters
run param.m

% Initial wage guess
w = ones(p.S,1);

% -- Scenario 2: tau = 2
% Trade costs
tau = ones(p.S,p.S)*2;
tau(1:p.S+1:end) = 1;

% Initial populations and normalize them to sum to 1
L = p.L;
L = L./sum(L);
% Equilibrium
[final_population2_2, real_wage2_2, nominal_wage2_2] = idiosyncratic_eq(p,tau,w, L);


% -- Scenario 2: tau = 1
% Trade costs
tau = tau./tau;
% Equilibrium
[final_population2_1, real_wage2_1, nominal_wage2_1] = idiosyncratic_eq(p,tau,w, L);

% -- Analysis
population_change2 = final_population2_2 - final_population2_1;

plot(p.A,population_change2)
xlabel('Productivity of Location')
ylabel('Population Change')
title('Problem 2: Frechet Shocks')
saveas(gcf, 'problem2.png')

figure; hold on
a1 = plot(p.A,final_population2_1); M1 = "Free trade";
a2 = plot(p.A,final_population2_2); M2 = "No Free trade";
legend([a1; a2], [M1; M2])
title('Problem 2: Population graphs')
saveas(gcf, 'problem2_population.png')

% We can see with free trade, less population is concentrated in the middle
% of the distribution. Ex ante, the middle of the distribution is the most
% desirable due to its combination of medium productivity and medium
% amenities as opposed to the edges which have either high productivity and
% low amenities (e.g., region 10) or low productivity and high amenities
% (e.g., region 1). Free trade allows for these less desirable areas to
% somewhat maintain affordable prices. This narrows the "appeal" gap
% between the middle and edges so there is relatively less population loss
% in the edges under free trade as opposed to no free trade.

% Now we have a Frechet distributed idiosyncratic preference shock. Since
% our $\theta = 8$, we see that preferences for location matter less relative
%to wages and prices than they did in problem 1 where $\theta = 1$. 
%In other words, our dispersion factor $1/\theta$ decreases. 
%So we end up seeing less population moving to the edges under free trade 
%since the middle is most attractive from a welfare perspective. 
%Also, compared to problem 1, we see a larger relative population concentration 
%(i.e., smaller positive values in the graph)in the middle as they offer a 
%higher welfare through their combination of medium productivity and medium amenities.


