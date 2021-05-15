function dydx= diffpfr(V,X,pf)
%This fuction is to define differential equations in question two
%X(1) is A/Acetone, X(2) is B/ketene, X(3) is C/methane, X(4) is Temperature along the reactor
%pf is [pressure PFR, flowrate in of N2]
P=pf(1); %Defining P=pf(1) for easier usage within the function
FN2=pf(2); %Defining FN2=pf(2) for easier usage within the function
T=X(4); %Differential temperature
R=8.314; %Universal gas constant
CA=1000*(X(1)/(X(1)+X(2)+X(3)+FN2))*P/(R*T); %Concentration of A as a function of mole fraction
k = exp(34.34 - 34222/T); %Rate constant as a function of temperature
Hrxn = 80770 + 6.8*(T-298) - 5.75e-3*(T^2 -298^2) - 1.27e-6*(T^3 -298^3); %Heat of reaction as a function of temperature
CpA = 26.2 + 0.183*T - 45.86e-6*T^2; %Specific heat capacity of A as function of T
CpB = 20.04 + 0.0945*T - 30.95e-6*T^2; %Specific heat capacity of B as function of T
CpC = 13.39 + 0.077*T - 18.91e-6*T^2; %Specific heat capacity of C as function of T
CpN2 = 6.25 + 0.00878*T - 2.1e-8*T^2; %Specific heat capacity of N2 as function of T
rA=-k*CA; %rate of cracking reaction
dydx=[rA; %Equation (I)
    -rA; %Equation (II)
    -rA; %Equation (III)
    -rA*(-Hrxn)/(X(1)*CpA + X(2)*CpB + X(3)*CpC + FN2*CpN2)]; %Equation (IV)
    

