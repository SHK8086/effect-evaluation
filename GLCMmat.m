function [t1,t2,t3,t4,compre] = GLCMmat(filename,picnumber,D,NumLev)

F = [];
ent = [];
erj = [];
cont = [];
nich = [];
contr = 0;
nicha = 0;

for i = 1:5
    Filename = strcat(filename,num2str(picnumber),'-',num2str(i),'.jpg');
    img = imread(Filename);
    img = rgb2gray(img);
	glcm1 = graycomatrix(img,'Offset',[0 D],'Symmetric',false,'NumLevels',NumLev);
	glcm2 = graycomatrix(img,'Offset',[-D D],'Symmetric',false,'NumLevels',NumLev);
	glcm3 = graycomatrix(img,'Offset',[-D 0],'Symmetric',false,'NumLevels',NumLev);
	glcm4 = graycomatrix(img,'Offset',[-D -D],'Symmetric',false,'NumLevels',NumLev);
	glcm = (glcm1+glcm2+glcm3+glcm4)/4;
    F(:,:,i) = glcm;
    A = F(:,:,i);
	ent(i) = entropy(A);
    erj(i) = sum(sum(A.*A));
    [M,N] = size(A);
    for m = 1:M
        for n = 1:N
            contr = (m - n)^2*A(m,n) + contr;
            nicha = A(m,n)/(1+(m - n)^2) + nicha;
        end
    end
    cont(i) = contr;
    nich(i) = nicha;
end

%     cont = (cont - mean(cont))/std(cont); 
%     erj = (erj - mean(erj))/std(erj); 
%     nich = (nich - mean(nich))/std(nich); 
%     ent = (ent - mean(ent))/std(ent);
    
cont = mapminmax(cont,0,1);
erj = mapminmax(erj,0,1);
nich = mapminmax(nich,0,1);
ent = mapminmax(ent,0,1);

t1=0;
t2=0;
t3=0;
t4=0;
%对周围四张背景块偏离中心块参数的程度计算
for i = 2:5
    t1 = abs(cont(1) - cont(i)) + t1;
    t2 = abs(erj(1) - erj(i))   + t2;
    t3 = abs(nich(1) - nich(i))  + t3;
    t4 = abs(ent(1) - ent(i))  + t4;
end

compre = (t1+t2+t3+t4)/4;

    
    
        


