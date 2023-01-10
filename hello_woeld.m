%for i = code
%   disp("hello world" +i )
%end

disp("hello world " +length(code) )
sampleRate = 2048000*5
chipRate = 2048000


x = 1 : sampleRate/1000
q = chipRate/sampleRate
for i = 1: sampleRate/1000
    k = floor(q*i);
 %   if k< 1 
%        low = 0
%    else
 %       low = code(k);
  %  end
%
%    if k+1 > length(code)
%        high = 0;
%    else
%        high = code(k);
%    end

    delt = mod(q*i,1)
    x(i) = get_val_or_zero(code,k)*(delt) + get_val_or_zero(code,k+1)*(1-delt);
%    x(i) = low*(delt) + high*(1-delt);
end



function v = get_val_or_zero(arr,idx)
    if  idx<1 || idx > length(arr)
        v = 0;
    else
    v = arr(idx);
    end 
    
end

