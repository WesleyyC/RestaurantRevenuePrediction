%% Data Read
filename6Train = 'str_num_train.csv';
data = csvread(filename6Train,1,0);
trainFeatures = data(:,2:end-1);
trainRevenue = data(:,end);


%% Reset Data
N=1;
err_trend=ones([1,N]);

%for n = 1:N
%     tree = fitctree(trainFeatures,Y,'CrossVal','on','KFold',5,'MinParentSize',50,'PruneCriterion','impurity');
%     err_trend(n)=kfoldLoss(tree);
%end
 
%plot(err_trend)


%% apply
tree = fitctree(trainFeatures,Y,'PruneCriterion','impurity');

testFeatures

predict_result=predict(tree,testFeatures);

correct = sum(predict_result==Y)/length(Y)