% names = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Train');
% features =[];
% for i = 3:size(names,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Train/',names(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     features(i-2,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% l= size(features,1);
% names1 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Train');
% for i = 3:size(names1,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Train/',names1(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     features(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% l= size(features,1);
% names2 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Train');
% for i = 3:size(names2,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Train/',names2(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     features(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% l= size(features,1);
% names3 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Train');
% for i = 3:size(names3,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Train/',names3(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     features(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% 
% meanf = mean(features);
% stdf = std(features);
% for i=1:size(features,2)
%     features(:,i) = (features(:,i)-meanf(i))/(2*stdf(i));
% end
% 
% 
% labels = zeros(size(features,1),4);
% %labels = vertcat(repmat([1 0 0 0],size(names,1)-2,1),repmat([0 1 0 0],size(names1,1)-2,1),repmat([0 0 1 0],size(names2,1)-2,1),repmat([0 0 0 1],size(names3,1)-2,1));
% 
% labels(1: size(names,1)-2,1) = 1;
% labels(size(names,1)-1 : size(names,1)+size(names1,1)-3,2)= 1;
% labels(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4,3) = 1;
% labels(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5,4) = 1;
% 
% %labels = labels';
% features = horzcat(features, ones(size(features,1),1));
tic;

ssqerr =[];
in = 97;
h = 50;
win = -0.05 + rand(h,in)*0.1;
wh = -0.05 + rand(4,h)*0.1;
wb2 = 0.02;
nu = 0.06;
err =[];
error =[];
act =[];

for k = 2:1000
    for j = 1:size(features,1)
        i = randi([1, size(features,1)],1,1);
        outh = sigmf(win*(features(i,:))',[1 0]);
        out =  wb2 + wh*outh;
        delo = (labels(i,:)' - out);
        error(i,:) = delo ;
        err(i) = sum(error(i,:).*error(i,:));
        erro(k,i,:) = out;
        act(k,i) = labels(i);
        delh = outh.*(1 - outh).*(wh'*delo);
       
        wh = wh + nu*delo*outh';
       
            
        wb2 = wb2 + nu*delo;
        win = win + nu*delh*features(i,:);
        
        
        
    end
    
    ssqerr(k) = sum(err.*err);
   
   
end


 
    
  







names = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Test');
featurest =[];
for i = 3:size(names,1)
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

featurest = horzcat(featurest, ones(size(featurest,1),1));

labels1 = zeros(size(featurest,1),4);
%labels = vertcat(repmat([1 0 0 0],size(names,1)-2,1),repmat([0 1 0 0],size(names1,1)-2,1),repmat([0 0 1 0],size(names2,1)-2,1),repmat([0 0 0 1],size(names3,1)-2,1));

labels1(1: size(names,1)-2,1) = 1;
labels1(size(names,1)-1 : size(names,1)+size(names1,1)-3,2)= 1;
labels1(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4,3) = 1;
labels1(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5,4) = 1;

predict =[];

for i = 1:size(featurest,1)
         outh1 = sigmf(win*(featurest(i,:))',[1 0]);
         out1 = wb2+ wh*outh1;
         predict(i,:) = out1;
end

pred = zeros(size(predict));
for i = 1:size(featurest,1)
    [x,y]= max(abs(predict(i,:)));
    pred(i,y) = 1;
end

% errm = labels1 - pred;
% k = find(errm ~=0);
labels2= [];
labels3 =[];
for i = 1:size(featurest,1)
    k = find(pred(i,:) == 1);
    labels2(i) = k;
end

for i = 1:size(featurest,1)
    k = find(labels1(i,:) == 1);
    labels3(i) = k;
end

% ones1 = labels2(1: size(names,1)-2);
% twos1 = labels2(size(names,1)-1 : size(names,1)+size(names1,1)-3);
% threes1 = labels2(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4);
% fours1 = labels2(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5);
% 
% 
% ones2 = labels3(1: size(names,1)-2);
% twos2 = labels3(size(names,1)-1 : size(names,1)+size(names1,1)-3);
% threes2 = labels3(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4);
% fours2 = labels3(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5);


C = confusionmat(labels3,labels2);

for i = 1:4
    tp(i) = C(i,i);
end
for i=1:4
    fn(i) = sum(C(i,:)) - tp(i);
end
for i=1:4
    fp(i) = sum(C(:,i)) - tp(i);
end

for i=1:4
    tn(i) = sum(sum(C))-fn(i)-fp(i)-tp(i);
end


precision = tp./(tp+fp);
recall = tp./(tp+fn);
fmeas = (2*precision.*recall)./(precision+recall);
acc = (tp+tn)./(tp+tn+fp+fn);







