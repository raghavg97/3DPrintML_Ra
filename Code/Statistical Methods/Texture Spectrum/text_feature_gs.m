function gs = text_feature_gs(I,varargin) %Textural Feature Geometric Symmetry Li Wang 1990
    
    numvarargs = length(varargin);
    
    S = zeros(8,6561);
    
    if numvarargs > 0
    error('text_feature_gs:Toomanyinputs', ...
        'requires 1 input Image matrix');
    end

    
    for d=1:8
    Ntu =  textural_Ntu(I,d);   
    S(d,:) = histc(Ntu(:),0:6560);
   % S(d,:) = S(d,:)/sum(S(d,:));
    end
    
   %S = S/sum(sum(S));
    s3 = 0;
    for d=1:4
        abs(S(d,:)-S(d+4,:));
    s1 = sum(abs(S(d,:)-S(d+4,:)));
    s2 = sum(abs(S(d,:)));
    
    s3 = s3 + (s1/(2*s2));
    end
    
    gs = (1-(s3/4))*100;
    
    
    
end
