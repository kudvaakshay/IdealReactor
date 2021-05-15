%Solution for Question 2-1
pf=[162,0]; %Constant pressure 162kPa and N2 flowrate is zero
Volrange=linspace(0,4,100); %Volume ranges from 0 m3 to 4 m3
initial_values=[38.3,0,0,1150]; % values of X at V=0
[V,X]=ode45(@diffpfr, Volrange, initial_values,[], pf); %ODE solver
disp("Flow rate of acetone(A) at the end of PFR  "+X(end,1) +" kmol/s, Mole fraction- "+X(end,1)/(X(end,1)+X(end,2)+X(end,3)))
disp("Flow rate of ketene(B) at the end of PFR  "+X(end,2) +" kmol/s, Mole fraction- "+X(end,2)/(X(end,1)+X(end,2)+X(end,3)))
disp("Flow rate of methane(C) at the end of PFR  "+X(end,3) +" kmol/s, Mole fraction- "+X(end,3)/(X(end,1)+X(end,2)+X(end,3)))
disp("Temperature at the end of PFR  "+X(end,4) +" Kelvin")
