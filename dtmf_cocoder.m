function dtmf_cocoder(m)
%load selected dial tone
dtmf_tones = load(m);
y  = dtmf_tones.y;
fs = dtmf_tones.fs;  

%play sound
sound(y,fs);

%preform FFT
p = abs(fft(y));
n = length(y);

%obtain the relevant freqency values and plot them
f = (0:n-1)*(fs/n);
%plot(f,p);
%axis([600 1600 0 2500])

%use findpeaks to determine the peaks above 200 (minpeakheight)
[a, location] = findpeaks(p,'Minpeakheight',200);

%convert it to a frequency, since we obtained the point value
freq = f(location);

%limit to our DTMF
peak_freq = freq(freq < 3600);

%round the frequencies up or down
low_freq = ceil(peak_freq(1));
high_freq = ceil(peak_freq(2));

%print function if you wish to see outputs of high and low
%sprintf('%f', low_freq)
%sprintf('%f', high_freq)

%determine which number it is w/ high and low frequencies
if low_freq == 697 && high_freq == 1209
    disp('Tone is 1');
    elseif low_freq == 697 && high_freq == 1336
    disp('Tone is 2');
    elseif low_freq == 697 && high_freq == 1477
    disp('Tone is 3');
    elseif low_freq == 771 && high_freq == 1209
    disp('Tone is 4');
    elseif low_freq == 771 && high_freq == 1336
    disp('Tone is 5');
    elseif low_freq == 771 && high_freq == 1477
    disp('Tone is 6');
    elseif low_freq == 852 && high_freq == 1209
    disp('Tone is 7');
    elseif low_freq == 852 && high_freq == 1336
    disp('Tone is 8');
    elseif low_freq == 852 && high_freq == 1477
    disp('Tone is 9');
    elseif low_freq == 942 && high_freq == 1336
    disp('Tone is 0');
end
end