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
% labels = zeros(size(features,1),1);
% %labels = vertcat(repmat([1 0 0 0],size(names,1)-2,1),repmat([0 1 0 0],size(names1,1)-2,1),repmat([0 0 1 0],size(names2,1)-2,1),repmat([0 0 0 1],size(names3,1)-2,1));
% 
% 
%     labels(1: size(names,1)-2) = 1;
%     labels(size(names,1)-1 : size(names,1)+size(names1,1)-3)= 2;
%     labels(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4) = 3;
%     labels(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5) = 4;
% 
% 
% 
% %labels = labels';
% 
% 
% 
% 
% 
% 
% 
% names = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Test');
% featurest =[];
% for i = 3:size(names,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/forest/Test/',names(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     featurest(i-2,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% l= size(featurest,1);
% 
% names1 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Test');
% for i = 3:size(names1,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/coast/Test/',names1(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     featurest(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% l= size(featurest,1);
% names2 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Test');
% for i = 3:size(names2,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/insidecity/Test/',names2(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     featurest(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% l= size(featurest,1);
% names3 = dir('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Test');
% for i = 3:size(names3,1)
%     st = strcat('/home/sneha/Acads/9thsem/ML/Datasets/DS4/data_students/mountain/Test/',names3(i).name);
%     I = imread(st);
%     redI = I(:,:,1);
%     greenI = I(:,:,2);
%     blueI = I(:,:,3);
%     
%     hist_red = imhist(redI,32);
%     hist_blue = imhist(blueI,32);
%     hist_green = imhist(greenI,32);
%     
%     featurest(l+i-1,:) = [vertcat(hist_red,hist_green,hist_blue)]';
% end
% 
% 
% for i=1:size(featurest,2)
%     featurest(:,i) = (featurest(:,i)-meanf(i))/(2*stdf(i));
% end
% 
% %featurest = horzcat(featurest, ones(size(featurest,1),1));
% 
% labels1 = zeros(size(featurest,1),1);
% %labels = vertcat(repmat([1 0 0 0],size(names,1)-2,1),repmat([0 1 0 0],size(names1,1)-2,1),repmat([0 0 1 0],size(names2,1)-2,1),repmat([0 0 0 1],size(names3,1)-2,1));
% 
% labels1(1: size(names,1)-2) = 1;
% labels1(size(names,1)-1 : size(names,1)+size(names1,1)-3)= 2;
% labels1(size(names,1)+size(names1,1)-2 : size(names,1)+size(names1,1)+size(names2,1)-4) = 3;
% labels1(size(names,1)+size(names1,1)+size(names2,1)-3 : size(names,1)+size(names1,1)+size(names2,1)+size(names3,1)-5) = 4;
% 
    
labl = (-1)*ones(size(features,1),4);
    labt = (-1)*ones(size(featurest,1),4);
    
    for i= 1:4
    
        k = find(labels == i);
        labl(k,i) =  1;
        l = find(labels1 == i);
        labt(l,i) = 1;
    end
    

for i= 1:4
    
    
    mmwrite('ex_X', features);
    mmwrite('ex_b', labl(:,i));
    system('./l1_logreg_train -s ex_X ex_b 0 model_iono');
    
    model_iono = mmread('model_iono');



    mmwrite('ex_X1', featurest);
    mmwrite('ex_b1', labt(:,i));

    system('./l1_logreg_classify -t ex_b1 model_iono ex_X1 result_iono');
    model_iono = mmread('result_iono');
    
    impd = importdata('result_iono');
    clas = impd.data(:,1);
    C(:,:,i) = confusionmat(-1*labt(:,i), clas(2:84));
    
    precision(i) = C(1,1,i)/(C(1,1,i) + C(1,2,i));
    recall(i) = C(1,1,i)/(C(1,1,i) + C(2,1,i));
    fmeas(i) = 2*precision.*recall/(precision + recall);
    
    
end
    

