format short
cd /Users/mayuheng/Downloads/SPCALab
ASPCAPath
%p= mfilename('fullpath');
%[filepath,name,ext] = fileparts(p);
%cd(filepath)
cd /Users/mayuheng/Desktop/Past_Work/Stuff_for_DFM/midinput
data=csvread("./data//hidata_adjusted.csv");
data=data(25:240,:)
cd PCs
for q=5:10
    for alpha= 6
        for beta=5
             for itthres=-5
                 for iter=48:216
                     %2005 59
                     %07 83
                     %10 119
                     %12 143
                     %15 179
                    [PC, k, nstep, d, sigma2_hat]=ITSPCA([data(1:iter,:)',random('Normal',0,1,2141,256-iter)], 4, "Coiflet",2, exp(alpha), exp(beta), exp(itthres), q, 0.00001);
                    factor=PC(1:iter,:);
                    writematrix(factor,"q"+num2str(q)+"iter"+num2str(iter)+".csv")
                 end
            end
        end
    end 
end




