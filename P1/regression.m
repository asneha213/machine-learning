
nans = isnan(communities);
no_nans = sum(nans);

elim = find(no_nans > size(nans,1)*0.75);

communities(:,elim) = [];
nans = isnan(communities);

l = find(nans == 1);

[i,j] = ind2sub(size(nans),l);

communities(i,j) = (sum(communities(1:i-1,j))+sum(communities(i+1:size(nans,1),j)))/size(nans,1);

X = communities(:, 1:size(communities,2)-1);
y = communities(:,size(communities,2));

lm = fitlm(X,y);

X1 = X(1:1590,:); y1 = y(1:1590);
X2 = X(405:1994,:); y2 = y(405:1994);
X3 = vertcat(X(1:200,:),X(605:1994,:)); y3 = vertcat(y(1:200),y(605:1994));
X4 = vertcat(X(1:500,:),X(905:1994,:)); y4 = vertcat(y(1:500),y(905:1994));
X5 = vertcat(X(1:1000,:),X(1405:1994,:)); y5 = vertcat(y(1:1000),y(1405:1994));

k = linspace(0,0.1,100);
b=ridge(y1,X1,k);

X1t = X(1591:1994,:); y1t = y(1591:1994);
X2t = X(1:404,:); y2t = y(1:404);
X3t = X(201:604,:); y3t = y(201:604);
X4t = X(501:904,:); y4t = y(501:904);
X5t = X(1001:1404,:); y5t = y(1001:1404,:);

for i = 1:100
    errf1(i,:) = (y1t - X1t*b(:,i)).*(y1t - X1t*b(:,i));
    errf2(i,:) = (y2t - X2t*b(:,i)).*(y2t - X2t*b(:,i));
    errf3(i,:) = (y3t - X3t*b(:,i)).*(y3t - X3t*b(:,i));
    errf4(i,:) = (y4t - X4t*b(:,i)).*(y4t - X4t*b(:,i));
    errf5(i,:) = (y5t - X5t*b(:,i)).*(y5t - X5t*b(:,i));
end
errs1 = sum(errf1,2)/404;
errs2 = sum(errf2,2)/404;
errs3 = sum(errf3,2)/404;
errs4 = sum(errf4,2)/404;
errs5 = sum(errf5,2)/404;
[p,q] = min(errs1);
lambda = k(q);


