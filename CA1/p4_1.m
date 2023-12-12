[x, fs] = audioread("Signal.wav");
t = 1/fs:1/fs:length(x)/fs;
plot(t, x)
xlabel('second')
ylabel('voice')
audiowrite('x.wav', x, fs)