




sampleRate = 2048000;
foffset = 0;
[ samples , Fs ] = audioread('C:\Users\Administrator\PycharmProjects\location_HW5\rtlsdr-1575-42.wav');
ms = 32;
s = samples (1: ms * sampleRate /1000 ,1) ...
+ sqrt ( -1)* samples (1: ms * sampleRate /1000 ,2);
SV = 30; % index of space vehicle ( satellite )
code = (2* cacode ( SV ) -1);
doppler = -1000;



% replica = modulator ( 'p' ,g , sampleRate , foffset + doppler );



function g = waveformBinary(code,chipRate,sampleRate)
    g = 1 : sampleRate/1000
    q = chipRate/sampleRate
    for i = 1: sampleRate/1000
        k = floor(q*i);
        delt = mod(q*i,1)
        g(i) = get_val_or_zero(code,k)*(delt) + get_val_or_zero(code,k+1)*(1-delt);
    end
end


function v = get_val_or_zero(arr,idx)
    if  idx<1 || idx > length(arr)
        v = 0;
    else
    v = arr(idx);
    end 
    
end