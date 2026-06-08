% Simulacija logistickog modela sa eutanazijom
clear all; clc; close all;

% Definisanje parametara modela
r = 0.22;   % Inherentna stopa rasta (0.34 - 0.12)
K = 250;    % Granicni kapacitet stanista
tspan = [0 50]; % Vremenski period simulacije (50 godina)
x0 = 150;   % Pretpostavljena pocetna gustina populacije pasa

% Vrednosti parametra epsilon
epsilons = [0.36, 0.25, 0.14];
boje = {'r', 'g', 'b'}; % Crvena, zelena, plava boja za grafike

figure;
hold on;

% Petlja koja prolazi kroz sve tri vrednosti epsilon i resava jednacinu
for i = 1:length(epsilons)
    eps = epsilons(i);
    
    % Definisanje diferencijalne jednacine: dx/dt = (r-eps)*x - (r/K)*x^2
    [t, x] = ode45(@(t, x) (r - eps)*x - (r/K)*x^2, tspan, x0);
    
    % Crtanje grafika
    plot(t, x, boje{i}, 'LineWidth', 2);
end

% Uredjivanje grafika 
xlabel('Vreme t [godine]', 'FontSize', 12);
ylabel('Gustina populacije x(t) [jedinki/km^2]', 'FontSize', 12);
title('Dinamika populacije ulicnih pasa za razlicite stope eutanazije', 'FontSize', 14);
legend('\epsilon = 0.36 (Izumiranje)', '\epsilon = 0.25 (Izumiranje)', '\epsilon = 0.14 (Stabilizacija)', 'Location', 'Best');
grid on;

saveas(gcf, 'grafik_pasa.png');
