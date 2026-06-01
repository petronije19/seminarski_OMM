% Seminarski rad iz OMM - Drugi deo: Prošireni model sa prilivom A
clear all; clc; close all;

% Definisanje parametara modela
r = 0.22;       % Inherentna stopa rasta (0.34 - 0.12)
K = 250;        % Granični kapacitet staništa
A = 10;         % Konstantan priliv napuštenih pasa godišnje (po km^2)
tspan = [0 50]; % Vremenski period simulacije (50 godina)
x0 = 150;       % Početna gustina populacije pasa

% Vrednosti parametra epsilon koje je profesorka zadala
epsilons = [0.36, 0.25, 0.14];
boje = {'r', 'g', 'b'}; % Crvena, zelena, plava boja za grafike

figure;
hold on;

% Petlja koja prolazi kroz sve tri vrednosti epsilon i rešava novu jednačinu
for i = 1:length(epsilons)
    eps = epsilons(i);
    
    % Proširena nelinearna jednačina: dx/dt = (r - eps)*x - (r/K)*x^2 + A
    [t, x] = ode45(@(t, x) (r - eps)*x - (r/K)*x^2 + A, tspan, x0);
    
    % Crtanje grafika za trenutni epsilon
    plot(t, x, boje{i}, 'LineWidth', 2);
end

% Uređivanje grafika (Oznake osa, naslov i legenda sa našim slovima)
xlabel('Vreme t [godine]', 'FontSize', 12);
ylabel('Gustina populacije x(t) [jedinki/km^2]', 'FontSize', 12);
title('Dinamika populacije pasa sa konstantnim prilivom A = 10', 'FontSize', 14);
legend('\epsilon = 0.36 (Stabilizacija iznad nule)', ...
       '\epsilon = 0.25 (Stabilizacija iznad nule)', ...
       '\epsilon = 0.14 (Visoka stabilizacija)', ...
       'Location', 'Best');
grid on;

% Automatsko čuvanje slike u folderu pod ispravnim imenom
saveas(gcf, 'grafik_napusteni.png');