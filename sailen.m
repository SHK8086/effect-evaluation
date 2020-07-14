clc;
clear;
picnum = 11;
valset = [];

for picnumber = 1:picnum
    filename = ('C:\Users\ɳHK\Desktop\lunwen\�½��ļ���/����ͼ/');
    filename1 = strcat(filename,num2str(picnumber),'.jpg');
	Xfilename = ('C:\Users\ɳHK\Desktop\lunwen\�½��ļ���\����ͼ/');
	Xfilename1 = strcat(Xfilename,num2str(picnumber),'.png');
    img = imread(filename1);
	Ximg = imread(Xfilename1);
    gbvsmap = gbvs(img);
    gbvsmap = gbvsmap.master_map_resized;
	count = 0;
	sailevalu = 0;
	[M,N,Z] = size(img);
    
	for i = 1:M
		for j = 1:N
			if Ximg(i,j) ~= 0
				sailevalu = gbvsmap(i,j) + sailevalu;
				count = count + 1;
			end
		end
	end
	
	valset(picnumber) = sailevalu/count;

end