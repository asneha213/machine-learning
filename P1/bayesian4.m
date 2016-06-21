% clear;
% k =1;l=1;

        
% cr(1,:) = [1 2 3 4 5 6 7 8]; cr1(1,:) = [9 10];
% cr(2,:) = [3 4 5 6 7 8 9 10]; cr1(2,:) = [1 2];
% cr(3,:) = [5 6 7 8 9 10 1 2]; cr1(3,:) =[3 4];
% cr(4,:) = [7 8 9 10 1 2 3 4]; cr1(4,:) = [5 6];
% cr(5,:) = [9 10 1 2 3 4 5 6]; cr1(5,:) = [7 8];
% for cross = 1:1
%     uni_legit =[];
%     uni_spam =[];
%     vocab =[];
% 
%     for q=1:8
%         j = cr(1,q);
%         str = strcat('part',num2str(j));   
%         str1 = strcat('/home/sneha/Acads/9thsem/ML/Datasets/Q10/', str);
%         cd(str1);
%         spamfiles = dir('*spm*');
%         legitfiles = dir('*legit*');
% 
% 
%         for i= k:k-1+size(legitfiles,1)
%            data{i}= importdata(legitfiles(i-k+1).name);
%         end
% 
%         for i= l:l-1+size(spamfiles,1)
%            spmdata{i} = importdata(spamfiles(i-l+1).name);
%         end
%         k = size(data,2)+1;
%         l = size(spmdata,2)+1;
%     end
%       k = size(data,2);
%       l = size(spmdata,2);
% 
%     pr_spm = l/(k+l);
%     pr_lgt = k/(k+l);
% 
%     legitdata =[];
%     spamdata =[];
% 
%     for i=1:k
%         temp = data{i}.data(:);
%         legitdata = vertcat(legitdata, temp);
%     end
% 
%     for i=1:l
%         temp = spmdata{i}.data(:);
%         spamdata = vertcat(spamdata, temp);
%     end
% 
%     uni_legit = unique(legitdata);
%     uni_spam = unique(spamdata);
%     vocab(:,1) = unique(vertcat(uni_legit,uni_spam));
%     train = vocab;
%     
%     train(:,2) = 1;
%     train(:,3) = 1;
%     for j= 1:size(data,2)
%         temp = data{j}.data(:);
%         inds = find(ismember(vocab,temp));
%         train(inds,2) = train(inds,2)+1;
%     end
%     
%     train(:,2) = (train(:,2))/(size(data,2)+2) ;
%     
%      for j= 1:size(spmdata,2)
%         temp = spmdata{j}.data(:);
%         inds = find(ismember(vocab,temp));
%         train(inds,3) = train(inds,3)+1;
%     end
%     
%     train(:,3) = (train(:,3))/(size(spmdata,2)+2) ;
%     
    
        
   


%     
%     k =1;l=1;
% 
%     for q = 1:2
%         j = cr1(1,q);
%         str = strcat('part',num2str(j));   
%         str1 = strcat('/home/sneha/Acads/9thsem/ML/Datasets/Q10/', str);
%         cd(str1);
%         spamfiles1 = dir('*spm*');
%         legitfiles1 = dir('*legit*');
% 
%         for i= k:k-1+size(legitfiles1,1)
%            data1{i}= importdata(legitfiles1(i-k+1).name);
% 
%         end
% 
%         for i= l:l-1+size(spamfiles1,1)
%             spmdata1{i} = importdata(spamfiles1(i-l+1).name);
%         end
%         k = size(data1,2)+1;
%         l = size(spmdata1,2)+1;
%     end
% 
C={};
 l = size(spmdata,2);
 pr_spm = l/(k+l);
pr_lgt = k/(k+l);

for z=1:10

alpha = [2 3 4 5 6 7 8 9 10]; bet = z;
spm  = (pr_spm .^(alpha -1) .* (1 - pr_spm) .^(bet -1))./beta(alpha,bet);
lgt = (pr_lgt .^(alpha -1) .* (1 - pr_lgt) .^(bet -1))./ beta(alpha,bet);
    
    truepos=zeros(1,9);
    falsepos = zeros(1,9);
    falseneg =zeros(1,9);
    trueneg = zeros(1,9);
    problgt = zeros(1,9);
    probspm = zeros(1,9);
    
    
    for i = 1:size(data1,2)
        temp1 = data1{i}.data;
        
        indp = find(ismember(vocab,temp1));
        inda = find(~ismember(vocab,temp1));
        
        lgt1 = log(train(indp,2));
        lgt2 = log(1 - train(inda,2));
        
        problgt = sum(lgt1)+sum(lgt2)+log(lgt);
        
        spm1 = log(train(indp,3));
        spm2 = log(1 - train(inda,3));
        
         probspm = sum(spm1)+sum(spm2) + log(spm);
         
         for v = 1:size(probspm,2)
         
             if problgt(v) > probspm(v)
                 truepos(v) = truepos(v) +1;
                 
            else
                falseneg(v) = falseneg(v) +1;
                
             end
         end
         
    end
    
     
    for i = 1:size(spmdata1,2)
        temp1 = spmdata1{i}.data;
        
        indp = find(ismember(vocab,temp1));
        inda = find(~ismember(vocab,temp1));
        
        lgt1 = log(train(indp,2));
        lgt2 = log(1 - train(inda,2));
        
        problgt = sum(lgt1)+sum(lgt2)+log(lgt);
        
        spm1 = log(train(indp,3));
        spm2 = log(1 - train(inda,3));
        
        probspm = sum(spm1)+sum(spm2) + log(spm);
         
        for v = 1:size(probspm,2)

             if problgt(v) > probspm(v)
                 falsepos(v) = falsepos(v) +1;
            else
                trueneg(v) = trueneg(v) +1;
             end
        end
        
    end
   
     C{z}= [ truepos; falsepos; falseneg ;trueneg];
end
 C1 = cell2mat(C);
for i = 1:90
   
    
     
     p1(i) =C1(1,i)/(C1(1,i)+C1(2,i));
     r1(i) =C1(1,i)/(C1(1,i)+C1(3,i));
     p2(i) =C1(4,i)/(C1(4,i)+C1(3,i));
     r2 (i)=C1(4,i)/(C1(4,i)+C1(2,i));

end

    
    
    
        