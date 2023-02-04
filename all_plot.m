%true relative error plot
clear; clc; close all;

load bisection.mat;
semilogy(etlist,'ro-');
hold on;

load falsePosition.mat;
semilogy(etlist,'bo-');

load Newton_Raphson.mat;
semilogy(etlist,'go-');

load secant.mat;
semilogy(etlist,'yo-');
hold off;
grid on;


title("plot");
xlabel("Iterations");
ylabel("True percent relative error");

lgd=legend("Bisection","False position","Newton Raphson","Secant");
