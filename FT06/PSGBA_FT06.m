function PSGBA_FT06
clear;clc;close all
tic
%%
% FT={[11 0 29;12 1 78;13 2  9;14 3 36;15 4 49;16 5 11;17 6 62;18 7 56;19 8 44;110 9 21]
% [21 0 43;22 2 90;23 4 75;24 9 11;25 3 69;26 1 28;27 6 46;28 5 46;29 7 72;210 8 30]
% [31 1 91;32 0 85;33 3 39;34 2 74;35 8 90;36 5 10;37 7 12;38 6 89;39 9 45;310 4 33]
% [41 1 81;42 2 95;43 0 71;44 4 99;45 6  9;46 8 52;47 7 85;48 3 98;49 9 22;410 5 43]
% [51 2 14;52 0  6;53 1 22;54 5 61;55 3 26;56 4 69;57 8 21;58 7 49;59 9 72;510 6 53]
% [61 2 84;62 1  2;63 5 52;64 3 95;65 8 48;66 9 72;67 0 47;68 6 65;69 4  6;610 7 25]
% [71 1 46;72 0 37;73 3 61;74 2 13;75 6 32;76 5 21;77 9 32;78 8 89;79 7 30;710 4 55]
% [81 2 31;82 0 86;83 1 46;84 5 74;85 4 32;86 6 88;87 8 19;88 9 48;89 7 36;810 3 79]
% [91 0 76;92 1 69;93 3 76;94 5 51;95 2 85;96 9 11;97 6 40;98 7 89;99 4 26;910 8 74]
% [101 1 85;102 0 13;103 2 61;104 6  7;105 8 64;106 9 76;107 5 47;108 3 52;109 4 90;1010 7 45]};
FT={[11 3 1;12 1 3;13 2 6;14 4 7;15 6 3;16 5 6]
    [21 2 8;22 3 5;23 5 10;24 6 10;25 1 10;26 4 4]
    [31 3 5;32 4 4;33 6 8;34 1 9;35 2 1;36 5 7]
    [41 2 5;42 1 5;43 3 5;44 4 3;45 5 8;46 6 9]
    [51 3 9;52 2 3;53 5 5;54 6 4;55 1 3;56 4 1]
    [61 2 3;62 4 3;63 6 9;64 1 10;65 5 4;66 3 1]};
job_pro=JOB_PRO(FT);%种子
pro_length=length(job_pro);
P0=100;
r0=0.001;
K=10000;
t=1;
P=P0;
r=r0;
job_pro=job_pro(randperm(numel(job_pro)));
[B,M,T]=PMT1(job_pro,pro_length,FT);
fit0=Calculate(B,M,T,pro_length,FT);
prot(1)=fit0;
while P<K
    L=ceil(log(K/P));
    P=K/(1+(K/P-1)*exp(-r0*t));
    r=r0*(1-P/K);
    t=t+1;
    for i=1:L
        job_pro1=order(job_pro,pro_length);
        [B,M,T]=PMT1(job_pro1,pro_length,FT);
        fit=Calculate(B,M,T,pro_length,FT);
        delta=fit-fit0;
%         if delta>0
            W=exp(1)^(-delta/(P*r));
            if W>rand
                job_pro=job_pro1;
                fit0=fit;
            end
%         else
%             job_pro=job_pro1;
%             fit0=fit;
%         end
    end
    prot(t)=fit0;
    job_pros(t,:)=job_pro;
end
[B,M,T]=PMT1(job_pro(end,:),pro_length,FT);
figure(1)
hold on
plot(prot(:),'k-')
xlabel('Iterations','FontSize',10)
ylabel('Complete time','FontSize',10)
disp('The shortest CT:')
prot(end)
figure(2)
draw_fig(B,M,T,pro_length,FT);
toc
disp('解码后对应最优个体的加工顺序为：')
disp(B')