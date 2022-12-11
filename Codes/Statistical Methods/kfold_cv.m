%Read data----------------------------------------------------------------------
clear; close all;

f1 = xlsread('GLCM_Parameters_new.xls');
f3 = xlsread('RLM_Parameters.xls');
f2 = xlsread('NGLDM_Parameters_new.xls');
f0 = xlsread('Firstorder_Parameters_new.xls');

F = [f0 f1 f2 f3];
r = xlsread('roughness values A.xlsx');
r = r(:,2);

cor1 = corr([r f0 f1 f2 f3]);
cor2 = cor1(1,2:38);

cor3 = abs(cor2)>0.8;


id = [];
for i=1:37
    if(cor3(i)==1) 
        id = [id i];
    end 
end

X = F(:,id);

%T = [X(:,1) X(:,3) X(:,8) X(:,1).^2 X(:,3).^2 X(:,8).^2 X(:,1).*X(:,3) X(:,8).*X(:,3) X(:,1).*X(:,8)];
 T = [X(:,1) X(:,3) X(:,8)];

m = max(r);
T = T./max(abs(T));

% i1 = [];i2 = [];i3 = [];i4 = [];i5 =[];
% %Partition 5 folds---------------------------------------------------------------------
% for i=1:59
%    if (r(i)<8)
%        i1 = [i1 i];
%    end    
%    if (r(i)>8 && r(i)<14)
%        i2 = [i2 i];
%        
%    end    
%    if (r(i)>14 && r(i)<20)
%        i3 = [i3 i];
%    end    
%    if (r(i)>20 && r(i)<26)
%        i4 = [i4 i];
%    end      
%    if (r(i)>26)
%        i5 = [i5 i];
%        
% 
%    end
% end
%r = r/max(r);
% i1 = i1(2:size(i1,2));
% i2 = i2(2:size(i2,2));
% i3 = i3(2:size(i3,2));
% i4 = i4(2:size(i4,2));
% i5 = i5(2:size(i5,2));
% 
% test_r_id = [i1(1) i1(size(i1,2)) i2(1) i2(size(i2,2)) i3(1) i3(size(i3,2)) i4(1) i4(size(i4,2)) i5(1)];
% 
% r_test = r(test_r_id);
% T_test = T(test_r_id,:);
% r_train =[];
% T_train =[];
% for i=1:59
% %     for j=1:size(test_r_id)
%         if(i~=test_r_id(:))
%         r_train = [r_train; r(i)];
%         T_train = [T_train; T(i,:)];
%         end
% %     end
% end
% T1 = T(1:12,:);
% T2 = T(13:24,:);
% T3 = T(25:36,:);
% T4 = T(37:48,:);
% T5 = T(49:59,:);

T_t = [T(6:38,:); T(43:59,:)];
T1 = T_t(1:10,:);
T2 = T_t(11:20,:);
T3 = T_t(21:30,:);
T4 = T_t(31:40,:);
T5 = T_t(41:50,:);

% r1 = r(1:12);
% r2 = r(13:24);
% r3 = r(25:36);
% r4 = r(37:48);
% r5 = r(49:59);

r_r = [r(6:38); r(43:59)];
r1 = r_r(1:10);
r2 = r_r(11:20);
r3 = r_r(21:30);
r4 = r_r(31:40);
r5 = r_r(41:50);

%Models---------------------------------------------------------------------------------
% First Fold------------------------------------------------
% X = [T1; T2; T3; T4];
% y = [r1; r2; r3; r4];
% 
% mdl1 = fitlm(X,y);
%  mdl1 = fitrgp(X,y);
% mdl1 = fitrsvm(X,y,'KernelFunction','rbf');
% 
% est_r5 = predict(mdl1,T5);
% mse(1) = mean((r5-est_r5).^2)/var(r5);  
% 
% % Second Fold------------------------------------------------
% X = [T1; T2; T3; T5];
% y = [r1; r2; r3; r5];
% 
% mdl2 = fitlm(X,y);
%  mdl2 = fitrgp(X,y);
% mdl2 = fitrsvm(X,y,'KernelFunction','rbf');
% 
% 
% est_r4 = predict(mdl2,T4);
% mse(2) = mean((r4-est_r4).^2)/var(r4);
% 
% % Third Fold-------------------------------------------------
% X = [T1; T2; T4; T5];
% y = [r1; r2; r4; r5];
% 
%   mdl3 = fitlm(X,y);
% mdl3 = fitrgp(X,y);
% mdl3 = fitrsvm(X,y,'KernelFunction','rbf');
% 
% est_r3 = predict(mdl3,T3);
% mse(3) = mean((r3-est_r3).^2)/var(r3);
% 
% % Fourth Fold--------------------------------------------------
% X = [T1; T3; T4; T5];
% y = [r1; r3; r4; r5];
% 
% mdl4 = fitlm(X,y);
% mdl4 = fitrgp(X,y);
% mdl4 = fitrsvm(X,y,'KernelFunction','rbf');
% 
% 
% est_r2 = predict(mdl4,T2);
% mse(4) = mean((r2-est_r2).^2)/var(r2);
% 
% % Fifth Fold---------------------------------------------------
% X = [T2; T3; T4; T5];
% y = [r2; r3; r4; r5];
% 
%  mdl5 = fitlm(X,y);
% mdl5 = fitrgp(X,y);
%  mdl5 = fitrsvm(X,y,'KernelFunction','rbf');
% 
% 
% est_r1 = predict(mdl5,T1);
% mse(5) = mean((r1-est_r1).^2)/var(r1);
% 
%  fitness = [max(mse) mean(mse) min(mse)];
% 
% %

%mdl = fitlm([T(1:23,:);T(33:59,:)],[r(1:23);r(33:59)]);
% mdl = fitrgp([T(1:47,:);T(57:59,:)],[r(1:47);r(57:59)]);
% mdl = fitrsvm([T(1:47,:);T(57:59,:)],[r(1:47);r(57:59)]);

mdl = fitlm(T(1:48,:),r(1:48));
%   mdl = fitrgp([T(1:47,:);T(57:59,:)],[r(1:47);r(57:59)]);
% mdl = fitrsvm([T(1:47,:);T(57:59,:)],[r(1:47);r(57:59)]);

%mdl = fitlm([T(6:38,:); T(44:59,:)] ,[r(6:38); r(44:59)],'quadratic');
%mdl = fitrgp([T(6:38,:); T(44:59,:)] ,[r(6:38); r(44:59)],'KernelFunction','squaredexponential','BasisFunction','linear');
%mdl = fitrsvm([T(6:38,:); T(44:59,:)] ,[r(6:38); r(44:59)],'KernelFunction','rbf');
%mdl = fitrgp(T ,r,'KernelFunction','squaredexponential','BasisFunction','linear', 'OptimizeHyperparameters','auto');

est_r = predict(mdl,T);
%est_r = ANN_Sq(T);
 c = corr([est_r r]);
 
% diff = abs(est_r*m-r*m);
% [~,id] = sort(diff);

%act_pred = [est_r r]*m;
 c(2,1)^2
%  
% cc = est_r*m;
% xlswrite('Full_Est_St_SVR_Gauss',cc);
% xlswrite('Act_Pred_ANN_Sq_full',act_pred);
 

