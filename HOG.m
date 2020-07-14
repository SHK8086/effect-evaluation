clc;
clear;

F = [];
simi = [];
for i = 1:5
orderAR = 32;
    filename1 = strcat('C:\Users\沙HK\Desktop\lunwen\新建文件夹/1593-1-',num2str(i),'.jpg');
    img = imread(filename1);
    [featureVector,hogVisualization] = extractHOGFeatures(img);
    A = arburg(featureVector,orderAR);
    F(:,i) = A;
   A = corrcoef(F(:,1),F(:,i));
   simi(i) = A(2,1);
end

simi = simi';