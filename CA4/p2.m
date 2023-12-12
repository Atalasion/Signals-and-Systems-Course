clc
close all;
clear;
ts = 1e-9; T = 1e-5; tau = 1e-6; C = 299792458;R=450;
t = 0:ts:T;
tlen = length(t)
N = round(tau / ts)
se = zeros(1, length(t));
se(1:tau / ts + 1) = 1;
figure;
plot(se, 'LineWidth', 5)
ylim([0, 2]);
hold on
td = 2 * R / C
sr = zeros(1, length(t));
sr(td / ts + 1:td / ts + tau / ts + 1) = 0.5;
plot(sr, 'LineWidth', 5)
ro = zeros(1, tlen);
tmp = zeros(1, tlen);
tmp(1:1 + N - 1) = 1;
ro = conv(sr, tmp);
ro = ro(1:10001);
[mx, pos] = max(ro);
pos = pos - N;
plot(t, ro)
my_td = t(pos)
my_R = C * my_td / 2
grid on