%Major = kidnapping event
Files = {
    'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\1\cloud_weight.csv' 
 'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\2\cloud_weight.csv'   
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\2\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\3\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\4\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\5\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\6\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\7\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\8\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\9\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\10\cloud_weight.csv'
    }
%Append all the distance formula numbers into one column
weights =[];
for n=1:length(Files)
    f = readtable(Files{n},'Delimiter', '\t');
    x = f(:,3);
    
    weights = [weights;x];
    
end
%Calculate mean and standard deviation on the dataset
average_normal = mean(table2array(weights))
std_dev_normal = std(table2array(weights))

%Major = kidnapping event
Files = {
    'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\1\cloud_weight.csv' 
 'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\2\cloud_weight.csv'   
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\2\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\3\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\4\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\5\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\6\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\7\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\8\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\9\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\10\cloud_weight.csv'
    }
%Append all the distance formula numbers into one column
weights =[];
for n=1:length(Files)
    f = readtable(Files{n},'Delimiter', '\t');
    x = f(:,3);
    
    weights = [weights;x];
    
end
%Calculate mean and standard deviation on the dataset
average_major = mean(table2array(weights))
std_dev_major = std(table2array(weights))
