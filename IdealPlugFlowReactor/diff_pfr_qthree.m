%Solution for Question 2-3
P = 1.6:0.2:5*101.325; %Writing Pressure as an array kPa
Volrange = linspace(0,4,100); %Volume ranges from 0 m3 to 4 m3
FA0 = [10 20 30 35 38.3]; %Different inlet flow rates of Acetone
FN2 = 38.3-FA0; 
nP = length(P); 
nF = length(FA0);
conv_matrix = zeros(nF,nP); 
T = zeros(nF,nP);
%Nested loop for changing 
for i = 1:nF
for j = 1:nP
initial_values = [FA0(i),0,0,1035]; pf = [P(j) FN2(i)];
[V,X] = ode45(@diffpfr, Volrange, initial_values, [], pf);
conv_matrix(i,j) = (initial_values(1) - X(end,1))/initial_values(1);
T(i,j) = X(end,4);
end
end
P = P/101.325; %Convert kPa to atm
figure(1)
plot(P,T(1,:),'o',P,T(2,:),'*',P,T(3,:),'x',P,T(4,:),'d',P,T(5,:),'v')
xlabel('P(atm)'), ylabel('T(K)'), grid
legend('F_A0=10','F_A0=20','F_A0=30','F_A0=35','F_A0=38.3')
figure(2)
plot(P,conv_matrix(1,:),'o',P,conv_matrix(2,:),'*',P,conv_matrix(3,:),'x',P,conv_matrix(4,:),'d',P,conv_matrix(5,:),'v')
xlabel('P(atm)'), ylabel('x_A'), grid
legend('F_A0=10','F_A0=20','F_A0=30','F_A0=35','F_A0=38.3')