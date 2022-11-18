function [P,M,T] = PMT(job_pro,pro_length,FT)
job_num=size(FT,1);
a=ones(job_num,1);
b=1;c=1;d=1;e=1;f=1;
P=zeros(pro_length,1);%工序
M=zeros(pro_length,1);%机床
T=zeros(pro_length,1);%时间
for j=1:pro_length
    for i=1:job_pro
        if job_pro(j)==1
            P(j)=FT{1}(a,1);
            M(j)=FT{1}(a,2);
            T(j)=FT{1}(a,3);
            a=a+1;
        elseif job_pro(j)==2
            P(j)=FT{2}(b,1);
            M(j)=FT{2}(b,2);
            T(j)=FT{2}(b,3);
            b=b+1;
        elseif job_pro(j)==3
            P(j)=FT{3}(c,1);
            M(j)=FT{3}(c,2);
            T(j)=FT{3}(c,3);
            c=c+1;
        elseif job_pro(j)==4
            P(j)=FT{4}(d,1);
            M(j)=FT{4}(d,2);
            T(j)=FT{4}(d,3);
            d=d+1;
        elseif job_pro(j)==5
            P(j)=FT{5}(e,1);
            M(j)=FT{5}(e,2);
            T(j)=FT{5}(e,3);
            e=e+1;
        elseif job_pro(j)==6
            P(j)=FT{6}(f,1);
            M(j)=FT{6}(f,2);
            T(j)=FT{6}(f,3);
            f=f+1;
        end
    end
end