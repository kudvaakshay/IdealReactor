%Solution for Question 2-2
N2_feed=[28.3, 18.3, 8.3, 3.3, 0.0]; %Different values for nitrogen feed rate
index=length(N2_feed); %For the value of i in the for loop
Volrange=linspace(0,4); %Volume ranges from 0 m3 to 4 m3
for i = 1:index
    pf=[162,N2_feed(i)]; %Constant pressure 162kPa and N2 flowrate varies
    initial_values=[38.3-pf(2),0,0,1150]; % values of X at V=0
    [V,X]=ode15s(@diffpfr, Volrange, initial_values,[], pf); %ODE solver
    disp("Case"+i+ ": Nitrogen feed flow rate "+ N2_feed(i)+" kmol/s")
    disp("Flow rate of acetone(A) at the end of PFR  "+X(end,1) +" kmol/s, Mole fraction- "+X(end,1)/(X(end,1)+X(end,2)+X(end,3)))
    disp("Flow rate of ketene(B) at the end of PFR  "+X(end,2) +" kmol/s, Mole fraction- "+X(end,2)/(X(end,1)+X(end,2)+X(end,3)))
    disp("Flow rate of methane(C) at the end of PFR  "+X(end,3) +" kmol/s, Mole fraction- "+X(end,3)/(X(end,1)+X(end,2)+X(end,3)))
    disp("Temperature at the end of PFR  "+X(end,4) +" Kelvin")
    disp("Final conversion = " + (initial_values(1)-X(end,1))/initial_values(1))
    fprintf('\n')
    % Plot the function
    if i==1
    conv_matrix=(initial_values(1)-X(:,1))/initial_values(1);
    subplot(1,2,i)
    plot(V,conv_matrix)
    xlabel('Reactor volume m3')
    ylabel('Conversion (X)')
    title('Conversion vs volume')
    subplot(1,2,i+1)
    plot(V,X(:,4))
    xlabel('Reactor volume m3')
    ylabel('Temperature in Kelvin')
    title('Temperature vs volume')
    else
        continue;
    end
end