%This reads-in files that have calculated the distance formula on the AMCL
%and Gazebo poses

%Normal = no kidnap events
Files = {
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\1\amcl_gazebo_poses_joined.csv'  
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\2\amcl_gazebo_poses_joined.csv'   
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\2\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\3\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\4\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\5\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\6\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\7\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\8\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\9\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\10\amcl_gazebo_poses_joined.csv'
    }
%Append all the distance formula numbers into one column
pose_diff =[];
heading_diff=[];
for n=1:length(Files)
    f = readtable(Files{n},'Delimiter', ',');
    x = f(:,12); %Get column for calculated Cartesian diff
    r = f(:,11); %get column for heading diff (radians)

    pose_diff = [pose_diff;x];
    heading_diff = [heading_diff;r];
end
%Calculate mean and standard deviation on the dataset
cartesian_diff_normal = mean(table2array(pose_diff))
std_dev_normal = std(table2array(pose_diff))
heading_diff_normal = mean(table2array(heading_diff))


%Major = kidnapping event
Files = {
    'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\1\amcl_gazebo_poses_joined.csv' 
 'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\2\amcl_gazebo_poses_joined.csv'   
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\2\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\3\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\4\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\5\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\6\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\7\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\8\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\9\amcl_gazebo_poses_joined.csv'
'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Major\10\amcl_gazebo_poses_joined.csv'
    }
%Append all the distance formula numbers into one column
pose_diff =[];
for n=1:length(Files)
    f = readtable(Files{n},'Delimiter', ',');
    x = f(:,12);
    r = f(:,11); %get column for heading diff (radians)
    pose_diff = [pose_diff;x];
    heading_diff = [heading_diff;r];
end
%Calculate mean and standard deviation on the dataset
cartesian_diff_major = mean(table2array(pose_diff))
std_dev_major = std(table2array(pose_diff))
heading_diff_normal = mean(table2array(heading_diff))