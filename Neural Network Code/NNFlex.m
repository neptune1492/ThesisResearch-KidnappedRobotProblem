%Neural Network for "No Kidnapping" scenarios:
%Workspace has 55 tables with naming convention:
%    joinedsets[driving method][trial #]

%%Description:
%Read in a data table column-by-column
%Reading from a table returns another table object, so you must convert 
%to an array using table2array
%Arrange data into inputs and targets
%Pass to Neural Network

%%Variables:
x_tw = joinedsetsturtlebotteleop2(:,1);

column = 3;
numColumns = 68;
inputs =[];
for c = column:numColumns
    inputs=[inputs table2array([joinedsetsturtlebotteleop2(:,c); joinedsetsturtlebotteleop3(:,c); joinedsetsturtlebotteleop4(:,c); joinedsetsturtlebotteleop5(:,c);])];
end
inputs = inputs';

amcl_gazebo_error = [ joinedsetsturtlebotteleop2(:,'AMCL_GazeboVolume'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboVolume'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboVolume'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboVolume')];
amcl_gazebo_error = table2array(amcl_gazebo_error);


%targets = [amcl_gazeboX amcl_gazeboY amcl_gazeboQX amcl_gazeboQY amcl_gazeboQZ amcl_gazeboQW]';
targets=[amcl_gazebo_error]';

net = feedforwardnet(15);%Create a net of 10 neurons %5 here with 0.0001 lr gets it down to 0.04 MSE when just doing teleop
net.trainParam.lr = 0.001; %set learning rate to one over one thousand
net.numLayers = 2;

%Divide data into 2/3 training and 1/3 validation
net.divideParam.trainRatio = 1/3;
net.divideParam.valRatio = 1/3;
net.divideParam.testRatio = 1/3;

inputs_std = mapstd(inputs);
targets_std = mapstd(targets);

%Go!
[net,tr] = train(net,inputs_std,targets_std);

%once trained you can use the 'net' object

inputs =[];
for c = column:numColumns
    new_inputs=[inputs table2array([joinedsetsturtlebotteleop2(:,c)]);];
end
new_inputs = new_inputs';

new_inputs_std = mapstd(new_inputs);

output = net(new_inputs_std);
