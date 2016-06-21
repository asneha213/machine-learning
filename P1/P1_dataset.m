%Covariance matrix
A=rand(10,10);
A = A+A';
sigma = A'*A;
mu1 = rand(1,10)*10;
mu2 = rand(1,10)*20;

class1 = mvnrnd(mu1,sigma,1000);
class2 = mvnrnd(mu2,sigma,1000);