function bws = text_feature_bws(I,varargin) %Textural Feature Black and White Symmetry Li Wang 1990
    t = 0;
   
   
    numvarargs = length(varargin);
    
    if numvarargs > 1
    error('text_feature_bws:Toomanyinputs', ...
        'requires 1 input Image matrix and 1 optional input of int from 1to8');
    end

    optargs = {1};
    optargs(1:numvarargs) = varargin;
    d = optargs{:};
    
    Ntu = textural_Ntu(I,d);
    S = histc(Ntu(:),0:6560);
    
    
    for i= 1:3279
        t = t+ abs(S(i) - S(3281+i));
    end
    
    bws = (1-t/sum(S))*100;
end
