t=0:0.01:1;
z1 = sin(2*pi*t);
z2 = cos(2*pi*t);

figure;
subplot(1, 2, 1)
plot(t, z1, '--b')
sin_x0 = [0.5];
sin_y0 = [0.2];
sin_s = ['sin(2 \pi t)'];
text(sin_x0, sin_y0, sin_s)
title('Sin')
legend('sin')
xlabel('time')
ylabel('amplitude')

subplot(1, 2, 2)
plot(t, z2, 'r')
cos_x0 = [0.25];
cos_y0 = [-0.8];
cos_s = ['cos(2 \pi t)'];
text(cos_x0, cos_y0, cos_s); %Add Comment

title('Cos');
legend('cos')
xlabel('time')
ylabel('amplitude')
grid on
