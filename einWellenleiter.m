del_x=0.2e-6;
lambda=1.55e-6;
k_0=2*pi/lambda;
n_1=1.45;
n_2=1.46;
l=20;           %total widht
d=4;            %width of the channel
x1=l/100;       %length per point
x2=(l-d)/2;     %width on both sides of the channel 
x3=x2/x1;       %number of points on both sides of the channel
x4=d/x1;        %number of points in the channel


mat_A=diag(ones(100,1)*(-2));
mat_A=mat_A+diag(ones(99,1),1);
mat_A=mat_A+diag(ones(99,1),-1);

vec_b(100);
for i=1:x3
    vec_b(i)=n_1^2;
end
for i=(x3+1):(x3+x4)
    vec_b(i)=n_2^2;
end
for i=(x3+x4+1):100
    vec_b(i)=n_1^2;
end

mat_B=diag(vec_b);

mat_Ges=((1/(del_x)^2)*mat_A+(k_0^2)*mat_B);

[EV,EW]=eig(mat_Ges);

plot(EV(:,100));

EW_neu=sqrt(EW/k_0^2);
