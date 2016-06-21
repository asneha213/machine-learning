clear;
k =1;l=1;
cr(1,:) = [1 2 3 4 5 6 7 8]; cr1(1,:) = [9 10];
cr(2,:) = [3 4 5 6 7 8 9 10]; cr1(2,:) = [1 2];
cr(3,:) = [5 6 7 8 9 10 1 2]; cr1(3,:) =[3 4];
cr(4,:) = [7 8 9 10 1 2 3 4]; cr1(4,:) = [5 6];
cr(5,:) = [9 10 1 2 3 4 5 6]; cr1(5,:) = [7 8];
for cross = 1:5
    uni_legit =[];
    uni_spam =[];
    vocab =[];
%     data =[];
%     spmdata =[];
    
    for q=1:8
        j = cr(cross,q);
        str = strcat('part',num2str(j));   
        str1 = strcat('/home/sneha/Acads/9thsem/ML/Datasets/Q10/', str);
        cd(str1);
        spamfiles = dir('*spm*');
        legitfiles = dir('*legit*');

        for i= k:k-1+size(legitfiles,1)
           data{i}= importdata(legitfiles(i-k+1).name);

        end

        for i= l:l-1+size(spamfiles,1)
            spmdata{i} = importdata(spamfiles(i-l+1).name);
        end
        k = size(data,2)+1;
        l = size(spmdata,2)+1;
    end
      k = size(data,2);
      l = size(spmdata,2);

    pr_spm = l/(k+l);
    pr_lgt = k/(k+l);

    legitdata =[];
    spamdata =[];

    for i=1:k
        temp = data{i}.data(:);
        legitdata = vertcat(legitdata, temp);
    end

    for i=1:l
        temp = spmdata{i}.data(:);
        spamdata = vertcat(spamdata, temp);
    end

    uni_legit = unique(legitdata);
    uni_spam = unique(spamdata);
    vocab(:,1) = unique(vertcat(uni_legit,uni_spam));

    for i=1:size(vocab,1)
        legit_counts(i) = sum(legitdata == vocab(i))+1;
        spam_counts(i) = sum(spamdata == vocab(i))+1;
    end


    vocab(:,2) = legit_counts;
    vocab(:,3) = spam_counts;
    sum_lgt = sum(vocab(:,2));
    sum_spm = sum(vocab(:,3));

    vocab(:,2) = vocab(:,2)/sum(vocab(:,2));
    vocab(:,3) = vocab(:,3)/sum(vocab(:,3));

    vocab(:,2) = log(vocab(:,2));
    vocab(:,3) = log(vocab(:,3));


    
    k =1;l=1;

    for q = 1:2
        j = cr1(cross,q);
        str = strcat('part',num2str(j));   
        str1 = strcat('/home/sneha/Acads/9thsem/ML/Datasets/Q10/', str);
        cd(str1);
        spamfiles1 = dir('*spm*');
        legitfiles1 = dir('*legit*');

        for i= k:k-1+size(legitfiles1,1)
           data1{i}= importdata(legitfiles1(i-k+1).name);

        end

        for i= l:l-1+size(spamfiles1,1)
            spmdata1{i} = importdata(spamfiles1(i-l+1).name);
        end
        k = size(data1,2)+1;
        l = size(spmdata1,2)+1;
    end

    truepos=0;
    falsepos = 0;
    falseneg =0;
    trueneg = 0;

    for i = 1:size(data1,2)
         testarr1 = data1{i}.data(:);
    


        problgt =0;
        for j=1:size(testarr1)

                temp1 = find(vocab(:,1)==testarr1(j));
                if isempty(temp1)
                     problgt = problgt + 0;
                else
                    problgt = problgt + vocab(temp1,2);
                end

        end
        problgt = problgt + log(pr_lgt);

        probspm =1;
        for j=1:size(testarr1)

                temp1 = find(vocab(:,1)==testarr1(j));
                if isempty(temp1)
                     probspm = probspm +0;
                else
                    probspm = probspm + vocab(temp1,3);
                end

        end
        probspm = probspm + log(pr_spm);
        if problgt > probspm
            truepos = truepos +1;
        else
            falseneg = falseneg +1;
        end

    end
    

    for i = 1:size(spmdata1,2)

         testarr2 = spmdata1{i}.data(:);
    

        problgt =0;
        for j=1:size(testarr2)

                temp1 = find(vocab(:,1)==testarr2(j));
                if isempty(temp1)
                     problgt = problgt + 0;
                else
                    problgt = problgt + vocab(temp1,2);
                end

        end
        problgt = problgt + log(pr_lgt);

        probspm =1;
        for j=1:size(testarr2)

                temp1 = find(vocab(:,1)==testarr2(j));
                if isempty(temp1)
                     probspm = probspm +0;
                else
                    probspm = probspm + vocab(temp1,3);
                end

        end
        probspm = probspm + log(pr_spm);
        if problgt > probspm
           falsepos = falsepos +1;
        else
           trueneg = trueneg +1;
        end
        
    end

        C(cross,:)= [ truepos falsepos falseneg trueneg];
       


end

