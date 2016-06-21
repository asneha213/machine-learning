


names = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Train');
features =[];
for i = 3:size(names,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Train/',names(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    features(i-2,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end

l= size(features,1);
names1 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Train');
for i = 3:size(names1,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Train/',names1(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    features(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end

l= size(features,1);
names2 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Train');
for i = 3:size(names2,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Train/',names2(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    features(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end

l= size(features,1);
names3 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Train');
for i = 3:size(names3,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Train/',names3(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    features(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end


meanf = mean(features);
stdf = std(features);
for i=1:size(features,2)
    features(:,i) = (features(:,i)-meanf(i))/(2*stdf(i));
end


labels =[];
labels(1: size(names,1)-2) = 1;
labels(size(names,1)-1 : size(names,1)+size(names1,1)-3)=2;
labels(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4) = 3;
labels(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5) = 4;

labels = labels';

%model0 = svmtrain(labels, features, '-d 10 -c 20');
model1 = svmtrain(labels, features, '-t 1 -d 2 -g 0.1 -c 10 ');
%model2 = svmtrain(labels, features, '-t 2  -g 0.1');
%model3 = svmtrain(labels, features, '-t 3  -r -1');



names = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Test');
featurest =[];
for i = 3:size(namest,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Test/',names(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    featurest(i-2,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end
l= size(featurest,1);

names1 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Test');
for i = 3:size(names1,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Test/',names1(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    featurest(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end

l= size(featurest,1);
names2 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Test');
for i = 3:size(names2,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Test/',names2(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    featurest(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end

l= size(featurest,1);
names3 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Test');
for i = 3:size(names3,1)
    st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Test/',names3(i).name);
    I = imread(st);
    redI = I(:,:,1);
    greenI = I(:,:,2);
    blueI = I(:,:,3);
    
    hist_red = imhist(redI,32);
    hist_blue = imhist(blueI,32);
    hist_green = imhist(greenI,32);
    
    featurest(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
end

for i=1:size(featurest,2)
    featurest(:,i) = (featurest(:,i)-meanf(i))/(2*stdf(i));
end

labels =[];
labels(1: size(names,1)-2) = 1;
labels(size(names,1)-1 : size(names,1)+size(names1,1)-3)=2;
labels(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4) = 3;
labels(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5) = 4;

labels = labels';

%labelst = 2*ones(size(featurest,1),1);
 %label0 = svmpredict( labels,featurest,model0); 
 label1 = svmpredict( labels,featurest,model1);
 %label2 = svmpredict( labels,featurest,model2);
 %label3 = svmpredict( labels,featurest,model3);
    