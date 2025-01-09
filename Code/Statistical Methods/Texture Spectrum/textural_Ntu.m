function Ntu = textural_Ntu(I,varargin)
[m, n]= size(I);

numvarargs = length(varargin);
if numvarargs > 1
    error('TexturalNtu:Toomanyinputs', ...
        'requires 1 input Image matrix and 1 optional input of int from 1to8');
end

optargs = {1};
optargs(1:numvarargs) = varargin;
d = optargs{:};
% Starting Point range 1 to 8 (Li Wang 1990)
%E = zeros(3,3);
Ntu = zeros(m-2,n-2);

for i = 2:m-1
    for j = 2:n-1
         E = texture_unit(I(i-1:i+1,j-1:j+1),d);
         for t =1:8
             Ntu(i-1,j-1) = Ntu(i-1,j-1) + (3^(t-1))*E(t);
         end
    end
end

end
