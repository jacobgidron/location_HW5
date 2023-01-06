function s = modulator(what,baseband, Fs, frequency, deviation, startPhase, startTime, duration)

sampleTime = 1/Fs; 

if nargin<=4 || ( nargin>=4 && isnan(deviation) )
    deviation = 0;
end

if nargin<=5 || ( nargin>=5 && isnan(startPhase) )
    startPhase = 2*pi*rand(1,1);
end

if nargin<=6 || ( nargin>=6 && isnan(startTime) )
    %startTime = 0;
    startBaseband = 1;
else
    startBaseband = 1+round(startTime/sampleTime);    
end

if nargin<=7 || ( nargin>=7 && isnan(duration) )
    n = length(baseband); % number of samples we will produce
else
    n = ceil(duration/sampleTime);
end

carrierCycleTime = 1/frequency;
sampleTime = 1/Fs;
radiansPerSample = 2*pi * (sampleTime / carrierCycleTime);
if deviation~=0
  radiansIncrease  = 2*pi * (sampleTime / (1/deviation));
end
iu = sqrt(-1);

fsk = false;
ask = false;
psk = false;
if length(strfind(what,'a'))>0
    ask = true;
end
if length(strfind(what,'f'))>0
    fsk = true;
end
if length(strfind(what,'p'))>0
    psk = true;
end

s = zeros(n,1);
phase = startPhase;
amplitude = 1;
phaseshift = 0;
j = -1;
for i=1:n
    if i==startBaseband
        j = 1;
    end
    
    if ask
      if j ~= -1
          amplitude = 0.5 + 0.5*baseband(j);
      else
          amplitude = 0.5;
      end
    end
    
    if psk
      if j ~= -1
          phaseshift = (pi/2)*baseband(j);
      else
          phaseshift = 0;
      end
    end
    
    s(i) = amplitude * exp(iu*(phase+phaseshift));
    
    advance = radiansPerSample;
    if fsk
      if j ~= -1
          advance = advance + baseband(j)*radiansIncrease;
      end
    end
    phase = phase + advance;

    j = j+1;
    if j > length(baseband); j = -1; end
end
    
end