zuoshangset = [301,143;260,480;457,412;329,228;771,457;774,490;501,396;591,322;506,318;625,223;225,222];  %左下
youxiaset = [328,66;387,394;523,267;429,128;831,349;837,346;600,272;632,293;538,254;644,199;273,114];    %右上
save('posi.mat','zuoshangset','youxiaset');

filename = ('C:\Users\沙HK\Desktop\lunwen\新建文件夹/');
picnumber = 11;
filename1 = strcat(filename,num2str(picnumber),'.jpg');
img = imread(filename1);
imshow(img);
impixelinfo;