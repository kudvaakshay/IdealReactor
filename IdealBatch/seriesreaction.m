%Define variables for data given in the question
v=50; %volumetric flow rate
CAo=5; %Initial CA value
CBo=0; % Initial CB value
CCo=0;  %Initial CC value
kone=0.4; %Rate constant for reaction 1
ktwo=0.2; %Rate constant for reaction 2

%Anonymous function 
dydx=@(t,C) [-kone*C(1);kone*C(1)-ktwo*C(2);ktwo*C(2)]; %anonymous function calling RHS of differential equation

%Other parameters for integration
Co=[CAo,CBo,CCo]; %Initial conditions
tspan=linspace(0,15,1000); % Time ranges from 0 to 15 mins

[t,C]=ode15s(dydx,tspan,Co); %ode solver

plot(t,C(:,1),'r--',t,C(:,2),'-',t,C(:,3),'.');
legend("CA","CB","CC");
xlabel("Time")
ylabel("Concentration")
Cmax=max(C(:,2));
tmax=t((C(:,2)==Cmax));
disp("Time at maximum CB is  "+ tmax + " mins")
disp("Volume at max CB is "+ tmax*v + " litres")
