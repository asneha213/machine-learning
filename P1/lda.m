
clear;
features = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/train.csv');
labels = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/train_labels.csv');
[m,n] = size(features);

l2 = find(labels ==1);
classone = features(l2,:);
k2 = find(labels ==2);
classtwo = features(k2,:);
mu1 = mean(classone);
mu2 = mean(classtwo);
S1 = cov(classone);
S2 = cov(classtwo);
Sw = S1+S2;
SB = (mu1 - mu2)*(mu1 - mu2)';
invSw = inv(Sw);
S3 = invSw *SB;
[V1 D1] = eig(S3);

W= V1(1,:)';

trfea = features*W;
model = fitlm(trfea,labels);

testfeatures = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/test.csv');
testlabels = importdata('/home/sneha/Acads/9thsem/ML/Datasets/DS3/test_labels.csv');


trfeaturestest = testfeatures*W;
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

lin2 = -3:0.01:0.8;

%scatter(class2,2*ones(size(class2,1),1'),'+');
scatter(class2,predictlabels(l),'+');

%plot(lin2,0.18675 - 0.80074*lin2);
plot(lin2,1.5*ones(size(lin2,2),1));


