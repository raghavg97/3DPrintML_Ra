% f1 = xlsread('GLCM_Parameters_new.xls');
% f3 = xlsread('RLM_Parameters.xls');
% f2 = xlsread('NGLDM_Parameters_new.xls');
% f0 = xlsread('Firstorder_Parameters_new.xls');
clear;
f1 = xlsread('GLCM_eq.xls');
f2 = xlsread('NGLDM_eq.xls');

%F = [f0 f1 f2 f3];

F = [f1 f2];
% r = xlsread('roughness values A.xlsx');
% ra = r(:,2);

%cor1 = corr([ra f0 f1 f2 f3]);
%cor2 = cor1(1,2:38);

% cor3 = abs(cor2)>0.8;
% 
% 
% id = [];
% for i=1:37
%     if(cor3(i)==1) 
%         id = [id i];
%     end 
% end

X = [F(:,1) F(:,9) F(:,13) F(:,14) F(:,19) F(:,20)];
r = xlsread('roughness values A.xlsx');
ra = r(:,2);

y = ra;

cvp         = cvpartition(length(y),'kfold',5);
numtestsets = cvp.NumTestSets;

lambdavals  = linspace(0,3,50)*std(y)/length(y);
lossvals    = zeros(length(lambdavals),numtestsets);


for i = 1:length(lambdavals)
        for k = 1:numtestsets

            Xtrain = X(cvp.training(k),:);
            ytrain = y(cvp.training(k),:);
            Xtest  = X(cvp.test(k),:);
            ytest  = y(cvp.test(k),:);

            nca = fsrnca(Xtrain,ytrain,'FitMethod','exact',...
                'Solver','lbfgs','Verbose',0,'Lambda',lambdavals(i),...
                'LossFunction','mse');

            lossvals(i,k) = loss(nca,Xtest,ytest,'LossFunction','mse');
        end
end
    

meanloss = mean(lossvals,2);
figure;
plot(lambdavals,meanloss,'ro-');
xlabel('Lambda');
ylabel('Loss (MSE)');
grid on;

[~,idx] = min(mean(lossvals,2));
bestlambda = lambdavals(idx)

nca = fsrnca(X,y,'FitMethod','exact','Solver','lbfgs',...
     'Verbose',1,'Lambda',bestlambda,'LossFunction','mse');
 
 figure;
plot(nca.FeatureWeights,'k.','MarkerSize',20);
grid on;
%xlabel('Feature index');
%xticklabels({'Variance','ASM(GLCM)','Contrast','Entropy (GLCM)','Info Measure1','Info Measure2','Energy(GLCM)','Second moment (NGLDM)'});
xticklabels({'F1','F2','F3','F4','F5','F6'});
ylabel('Feature weight');