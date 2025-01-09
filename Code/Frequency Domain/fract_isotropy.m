
g1 = [];
g2 = [];
g3 = [];
g4 = [];


% for i=1:59
%     if (A(i,2) == 60)
%         g1 = [g1 s(i)];
%     end
%     
%     if (A(i,2) == 120)
%         g2 = [g2 s(i)];
%     end
%     
%     if (A(i,2) == 180)
%         g3 = [g3 s(i)];
%     end
%     
%     if (A(i,2) == 240)
%         g4 = [g4 s(i)];
%     end
% end
% % 
% for i=1:59
%     if (A(i,3) == 400)
%         g1 = [g1 s(i)];
%     end
%     
%     if (A(i,3) == 800)
%         g2 = [g2 s(i)];
%     end
%     
%     if (A(i,3) == 1200)
%         g3 = [g3 s(i)];
%     end
%     
%     if (A(i,3) == 1600)
%         g4 = [g4 s(i)];
%     end
% end

for i=1:59
    if (A(i,4) == 80)
        g1 = [g1 s(i)];
    end
    
    if (A(i,4) == 100)
        g2 = [g2 s(i)];
    end
    
    if (A(i,4) == 120)
        g3 = [g3 s(i)];
    end
    
    if (A(i,4) == 140)
        g4 = [g4 s(i)];
    end
end
 %   gm = [mean(g1) mean(g2) mean(g3) mean(g4)];
    gm = [median(g1) median(g2) median(g3) median(g4)];
    
  %  xlswrite('Aniso_4_hatch',gm);
%figure, plot([60,120,180,240],gm,'ro');xlabel('Laser Power');
% figure,  plot([400,800,1200,1600],gm,'ro');xlabel('Scan Speed');
figure, plot([80,100,120,140],gm,'ro');xlabel('Hatch Distance');