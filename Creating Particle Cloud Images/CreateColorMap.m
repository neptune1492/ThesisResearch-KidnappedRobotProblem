%calculate colorscheme to use for all plots based on
%max, min particle weights we've ever seen.

FileNames = {
    
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\1\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\2\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\3\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\4\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\5\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\6\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\7\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\8\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\9\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\10\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\1\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\2\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\3\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\4\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\5\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\6\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\7\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\8\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\9\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\10\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\11\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\12\cloud_weight.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\13\cloud_weight.csv'
}

WeightsArrayAll=[];

for fn=1:length(FileNames)
%Read-in a file
WeightsInputFileName = FileNames{fn}; %sprintf(FileNames{fn});

Weights = readtable(WeightsInputFileName,'Delimiter', '\t');
WeightsArray = table2array(Weights);

WeightsArrayAll = [WeightsArrayAll;WeightsArray]; %Append to list
end


%load the weights and use colormap
unique_weights = sort(unique(WeightsArrayAll(:,3))); %Sort from least to greatest
color_scheme = colormap(jet(length(unique_weights))); %create a list of unique 3-element colors for as many unique particle weights are in the dataset, arranged lightest-to-darkest  (I think)
