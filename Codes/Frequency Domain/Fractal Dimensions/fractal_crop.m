clear;
load('A_cropped_59.mat');

s = size(Ic);
for id=1:s(3)
I = Ic(:,:,id);

for r=2:7
    rc = @(x) floor(((max(x)-min(x))/r))+ 1; % non-linear filter
    F= colfilt(I, [r r],'sliding', rc);
    B{r}= log(double(F * (49/(r^2))));

end


i=log(2:7); % Normalised scale range vector

%------- computing the slope using linear regression -------%
Nxx=dot(i,i)-(sum(i)^2)/6;
%h = waitbar(0,'Transforming to FD...');
for m = 1:s(1)
    for n = 1:s(2)
        fd= [B{7}(m,n), B{6}(m,n), B{5}(m,n), B{4}(m,n), B{3}(m,n), B{2}(m,n)]; % Number of boxes multiscale vector
        Nxy=dot(i,fd)-(sum(i)*sum(fd))/6; 
        %FD{j}(m, n)= (Nxy/Nxx);
        FD(m, n)= (Nxy/Nxx);% slope of the linear regression line
    end
    %waitbar(m/M)
end


ROI= FD(:);
%close;
FDavg(id)= sum(ROI)/ numel(ROI); % Average FD for selected area
FDsd(id)= std(ROI); % Standard deviation of FD for selected area
FDlac(id)= ((sum(ROI.^2)/(length(ROI)))./((sum(ROI)/(length(ROI)))^2))-1; % Lacunarity for selected area
%end
 id
end