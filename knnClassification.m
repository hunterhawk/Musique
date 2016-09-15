clc
clear
%knn classification
test_data = csvread('C:\Users\Anusha\Desktop\Audios\testdata.txt');
dataset = csvread('C:\Users\Anusha\Desktop\Audios\train_dataset.txt');
col = size(dataset,2);%finding no. of columns in dataset
features = dataset;	%assigning dataset to features
dataset(:,col) = [];	%excluding last column from dataset for computing euclidean distance
test = test_data;
test_data(:,col) = [];
k = 3;	%no. of neighbours is 3
classify = [];


%computing euclidean distance 

for i = 1:size(test_data,1)
    distance = zeros(1,size(dataset,1));	%distance vector with zeros
    count_zero = 0;
    count_one = 0;
	for j = 1:size(dataset,1)
		distance(j) = sqrt(sum((test_data(i,:) - dataset(j,:)).^2));
	end
	[sorted_array indx] = sort(distance);	%returns sorted array  and original index indx
	neigh = indx(1:k);%neigh has k neigh indicies
    for k = 1:size(neigh,2)
        classify(k) = features(neigh(k),257);
    end
    for l = 1:size(classify,2)
        if(classify(l)==1)
            count_one = count_one + 1;
        else
            count_zero = count_zero+1;
        end
        
    end
    if (count_one > count_zero )
        test(i,257) = 1;
    else
        test(i,257) = 0;
    end
end
