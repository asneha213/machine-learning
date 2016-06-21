labl = [];
k = find(strcmp(iris(:,5),'Iris-setosa'));
labl(1:30) = 1;
labtst(1:20) = 1;
irisfs(1:30,:) = cell2mat(iris(k(1):k(30),1:4));
iristst(1:20,:) = cell2mat(iris(k(31):k(50),1:4));

k = find(strcmp(iris(:,5),'Iris-versicolor'));
labl(31:60) = 2;
labtst(21:40) = 2;
irisfs(31:60,:) = cell2mat(iris(k(1):k(30),1:4));
iristst(21:40,:) = cell2mat(iris(k(31):k(50),1:4));

k = find(strcmp(iris(:,5),'Iris-virginica'));
labl(61:90) = 3;
labtst(41:60) = 3;
irisfs(61:90,:) = cell2mat(iris(k(1):k(30),1:4));
iristst(41:60,:) = cell2mat(iris(k(31):k(50),1:4));

model1 = discrimAnalysisFit(irisfs,labl,'linear');
model2 = discrimAnalysisFit(irisfs,labl,'quadratic');
model3 = discrimAnalysisFit(irisfs,labl,'RDA','lambda', 0.1);
irisf = vertcat(irisfs,iristst);
lab = vertcat(labl',labtst');
lab = lab';
[y, support] = canonizeLabels(labl);
[y1, support] = canonizeLabels(labtst);
[y2, support] = canonizeLabels(lab);



types = {'quadratic', 'linear', 'rda'};

for tt=1:length(types)
     if(~strcmp(types,'rda'))
        model = discrimAnalysisFit(irisfs(:,3:4), y, types{tt});
     else
         model = discrimAnalysisFit(irisfs(:,3:4), y, types{tt}, 'lambda',1);
     end
     
      h = plotDecisionBoundary(irisf(:,3:4), y2, @(Xtest)discrimAnalysisPredict(model,Xtest));
      title(sprintf('Discrim. analysis of type %s', types{tt}));
end



