clc;
clear;

zuoshangset = [301,143;260,480;457,412;329,228;771,457;774,490;501,396;591,322;506,318;625,223;225,222];  %����
youxiaset = [328,66;387,394;523,267;429,128;831,349;837,346;600,272;632,293;538,254;644,199;273,114];    %����
% save('posi.mat','zuoshangset','youxiaset');
% 
% load('C:\Users\ɳHK\Desktop\lunwen\posi.mat');
Fcom = [];
D = 2;
NumLev = 32;
orderAR = 32;
picnum = 11

for picnumber = 1:picnum
    filename = ('C:\Users\ɳHK\Desktop\lunwen\�½��ļ���/');
    filename1 = strcat(filename,num2str(picnumber),'.jpg');
    img = imread(filename1);
    % imshow(img);
    % impixelinfo;

    zuoshang = zuoshangset(picnumber,:);  %ʵ�����϶�Ӧmatlabȡ�������
    youxia = youxiaset(picnumber,:);   %ʵ�����¶�Ӧmatlabȡ�������

    cutimg(filename,picnumber,zuoshang,youxia);
    colorIN = colormain(filename,picnumber);
    [t1,t2,t3,t4,compreIN] = GLCMmat(filename,picnumber,D,NumLev);
    Fcom(1,picnumber) = compreIN;
    Fcom(2,picnumber) = colorIN
    Fcom(3,picnumber) = colorIN+compreIN;
end






