clear;
close all;
clc;

%% Parameters
E = 210e9; % Young's modulus (Pa)
q = 8000 * 9.80665; % Distributed load (N/m^2)
L = 10; % Length of the domain
N = 100; % Number of grid points
h = L / N; % Grid spacing

%% Define A(x)
syms x
a = 9e-4;
b = -240e-4;
c = 1600e-4;
A_x = a * x^2 + b * x + c;

%% Exact solution using dsolve
syms u(x)
eqn = diff(E * A_x * diff(u)) + q == 0;
cond1 = u(0) == 0;
cond2 = subs(diff(u), x, 10) == 0;
% cond2 = subs(diff(u), x, 0) == 0;
u_exact = dsolve(eqn, [cond1, cond2]);
% Evaluate exact solution at grid points
x_vals = linspace(0, L, N + 1);
u_exact_vals = double(subs(u_exact, x, x_vals));

%% FDM A*u_fdm=B
% u_fdm = zeros(N + 1, 1);
A = zeros(N + 1, N + 1);
B = (-2 * h^2 * q / E) .* ones(N + 1, 1);

for i = 2:N
    xi = x_vals(i);
    A(i, i - 1) = 2 * c - b * h + 2 * b * xi + 2 * a * xi^2 - 2 * a * h * xi;
    A(i, i) =- 4 * a * xi^2 - 4 * b * xi - 4 * c;
    A(i, i + 1) = 2 * c + b * h + 2 * b * xi + 2 * a * xi^2 + 2 * a * h * xi;
end

%% Apply boundary conditions
A(1, 1) = 1;
B(1, 1) = 0;
A(N + 1, N) = 2 / h^2;
A(N + 1, N + 1) = -2 / h^2;
% A(N + 1, 1) = 2 / h^2;
% A(N + 1, 2) = -2 / h^2;
u_fdm = A \ B;

%% Plot both solutions
plot(x_vals, u_exact_vals, 'r-', 'LineWidth', 2, 'DisplayName', 'Exact Solution');
hold on;
plot(x_vals, u_fdm, 'b-', 'LineWidth', 2, 'DisplayName', 'FDM Solution');
xlabel('x');
ylabel('u(x)');
title('Comparison: Exact Solution vs. FDM Solution');
legend('Location', 'northwest');
grid on;
hold off;
