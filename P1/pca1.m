features = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/train.csv');
labels = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/train_labels.csv');
[m,n] = size(features);
% features = features - repmat(mean(features,2), 1, size(features,2));
% [U,S,V] = svd(features);
% C = (U*S*S*U')/size(C,1);

[V D W] = eig(features'*features);

trfeatures = features*V(:,1);

pcacomp = pca(features');
%trfeatures = pcacomp(:,2);
model = fitlm(trfeatures,labels);

testfeatures = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/test.csv');
testlabels = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/test_labels.csv');

[Vt Dt Wt] = eig(testfeatures'*testfeatures);

trfeaturestest = testfeatures*V(:,1);


% pcacomp2 = pca(testfeatures');
% trfeaturestest = pcacomp2(:,2);

predictlabels = predict(model,trfeaturestest);
predictlabels1 = predictlabels;
k = find(predictlabels < 1.5);

predictlabels1(k) = 1;

class13d = testfeatures(k);
class1 = trfeaturestest(k);

l = find(predictlabels > 1.5);
predictlabels1(l) = 2;

class23d = testfeatures(l);
class2 = trfeaturestest(l);


gen = predictlabels1 - testlabels;
m = find(gen==0);
l1 = find(predictlabels1 ==1 & testlabels ==1);
C1 = confusionmat(testlabels,predictlabels1);


accuracy = size(m,1)/size(testlabels,1);


figure(2);
scatter3(features(:,1), features(:,2), features(:,3));  

lin1 = 1:1:size(class1,1);

figure(1);

%scatter(class1,ones(size(class1,1)',1));

hold on
scatter(class1,predictlabels(k));

lin2 = -0.6:0.01:0.8;

%scatter(class2,2*ones(size(class2,1),1'),'+');
scatter(class2,predictlabels(l),'+');

%plot(lin2,1.5565 + 1.3507*lin2);
plot(lin2,1.5*ones(size(lin2,2),1));

% hold off
% 
%  
% figure(3);
% 
% obj = fitcdiscr(features,labels);
% predictlabels2 = predict(obj,testfeatures);
% 
% gen1 = predictlabels2 - testlabels;
% m1 = find(gen1==0);
% accuracy1 = size(m1,1)/size(testlabels,1);
% C2 = confusionmat(testlabels,predictlabels2);
% 
% K = obj.Coeffs(1,2).Const;
% L = obj.Coeffs(1,2).Linear;
% 
% projecteddata2 = K*features(:,1)+L(1)*features(:,2)+L(2)*features(:,3);
% 
% hold on
% scatter(class1,predictlabels(k));
% 
% 
% f = @(x1,x2) K + L(1)*x1 + L(2)*x2;
% h2 = ezplot(f);
% h2.Color = 'r';
% h2.LineWidth = 2;
% 

