function y = texture_unit(M,d) 

%M 3x3 matrix 
%d - starting integer 1,2,3,4,5,6,7,8 (Li Wang 1990)
  y1 = ones(8,1);
  y = ones(8,1);
  
  
 
  for i = 1:3        
  y1(i) = TU_val(M(1,i),M(2,2));
  end     
  y1(4) = TU_val(M(2,3),M(2,2));
  for i = 5:7        
  y1(i) = TU_val(M(3,8-i),M(2,2));
  end     
  y1(8) = TU_val(M(2,1),M(2,2));
  
  if d==1 
      y = y1; 
  
  else
     for i=1:(9-d)
         y(i) = y1(i+d-1);
     end
     
     for j=i+1:8
        y(j) =  y1(j -9+d );
     end
  end
  
  
     
  
end
 