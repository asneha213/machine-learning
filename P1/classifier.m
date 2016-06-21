%dataset generation
A=rand(10,10);
A = A+A';
sigma = A'*A;
%mu1 = rand(1,10)*10;
%mu2 = rand(1,10)*10;
mu1 = [1.2 2.3 4.5 3.2 2.3 4.5 3.2 1.2 4.2 1.0];
mu2 = [1.3 4.5 4.4 3.5 2.0 3.2 3.3 3.4 4.1 1.2];
class1 = mvnrnd(mu1,sigma,1000);
class2 = mvnrnd(mu2,sigma,1000);

%generate training and testing data
trainclass1 = class1(1:600,:);
trainclass2 = class2(1:600,:);
testclass1 = class1(601:1000,:);
testclass2 = class2(601:1000,:);
A = vertcat(testclass1,testclass2);
A(:,11) = vertcat(ones(400,1),2*ones(400,1));
dlmwrite('DS1_test.csv',A)

%X and y
X=[];
X= vertcat(trainclass1,trainclass2);
y = vertcat(zeros(600,1),ones(600,1));

%regression fitting
model1 = fitlm(X,y);

%build a Knn model
%model2 = fitcknn(X,y);
for k=1:20
    class = knnclassify(testclass2,X,y,k);
    l=size(find(class==1));
    accuracy(k) = l(1)/400;
end


%test model
labels = predict(model1,testclass1);
l = size(find(labels < 0.5));
regacc = l(1)/400;

