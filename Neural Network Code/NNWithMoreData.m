%Neural Network for "No Kidnapping" scenarios:
%Workspace has 15 tables with naming convention:
%    joinedsets[driving method][trial #]

%%Description:
%Read in a data table column-by-column
%Reading from a table returns another table object, so you must convert 
%to an array using table2array
%Arrange data into inputs and targets
%Pass to Neural Network

%%Variables:
%cloud_xt - point cloud "spread" in the x-direction at time t
%cloud_xt - point cloud "spread" in the y-direction at time t
%cloud_qx - point cloud "spread" over heading (aka bearing/orientation) quaternion element qx at time t
%cloud_qy - point cloud "spread" over heading (aka bearing/orientation) quaternion element qy at time t
%cloud_qz - point cloud "spread" over heading (aka bearing/orientation) quaternion element qz at time t
%cloud_qw - point cloud "spread" over heading (aka bearing/orientation) quaternion element qw at time t

%cloud_xt1 - point cloud "spread" in the x-direction at time t-1
%...
%cloud_xt2 - point cloud "spread" in the x-direction at time t-2
%...
%cloud_xt3 - point cloud "spread" in the x-direction at time t-3
%...

%amcl_gazeboX - |AMCL's x-pose at time t - Gazebo's
%x-pose at time t|
%amcl_gazeboY - |AMCL's y-pose at time t - Gazebo's
%y-pose at time t|

%amcl_gazeboQX - |AMCL's qx element of the quaternion for bearing at time t - Gazebo's
%qx element of the quaternion for bearing at time t|
%amcl_gazeboQY - |AMCL's qy element of the quaternion for bearing at time t - Gazebo's
%qy element of the quaternion for bearing at time t|
%amcl_gazeboQZ - |AMCL's qz element of the quaternion for bearing at time t - Gazebo's
%qz element of the quaternion for bearing at time t|
%amcl_gazeboQW - |AMCL's qw element of the quaternion for bearing at time t - Gazebo's
%qw element of the quaternion for bearing at time t|

% x_t = [joinedsetsturtlebotteleop1(:,'cloud_xt'); joinedsetsturtlebotteleop2(:,'cloud_xt'); joinedsetsturtlebotteleop3(:,'cloud_xt'); joinedsetsturtlebotteleop4(:,'cloud_xt'); joinedsetsturtlebotteleop5(:,'cloud_xt')];
% y_t = [joinedsetsturtlebotteleop1(:,'cloud_yt'); joinedsetsturtlebotteleop2(:,'cloud_yt'); joinedsetsturtlebotteleop3(:,'cloud_yt'); joinedsetsturtlebotteleop4(:,'cloud_yt'); joinedsetsturtlebotteleop5(:,'cloud_yt')];
% qx_t = [joinedsetsturtlebotteleop1(:,'cloud_qxt'); joinedsetsturtlebotteleop2(:,'cloud_qxt'); joinedsetsturtlebotteleop3(:,'cloud_qxt'); joinedsetsturtlebotteleop4(:,'cloud_qxt'); joinedsetsturtlebotteleop5(:,'cloud_qxt')];
% qy_t = [joinedsetsturtlebotteleop1(:,'cloud_qyt'); joinedsetsturtlebotteleop2(:,'cloud_qyt'); joinedsetsturtlebotteleop3(:,'cloud_qyt'); joinedsetsturtlebotteleop4(:,'cloud_qyt'); joinedsetsturtlebotteleop5(:,'cloud_qyt')];
% qz_t = [joinedsetsturtlebotteleop1(:,'cloud_qzt'); joinedsetsturtlebotteleop2(:,'cloud_qzt'); joinedsetsturtlebotteleop3(:,'cloud_qzt'); joinedsetsturtlebotteleop4(:,'cloud_qzt'); joinedsetsturtlebotteleop5(:,'cloud_qzt')];
% qw_t = [joinedsetsturtlebotteleop1(:,'cloud_qwt'); joinedsetsturtlebotteleop2(:,'cloud_qwt'); joinedsetsturtlebotteleop3(:,'cloud_qwt'); joinedsetsturtlebotteleop4(:,'cloud_qwt'); joinedsetsturtlebotteleop5(:,'cloud_qwt')];
% 
% x_t1 = [joinedsetsturtlebotteleop1(:,'cloud_xt1'); joinedsetsturtlebotteleop2(:,'cloud_xt1'); joinedsetsturtlebotteleop3(:,'cloud_xt1'); joinedsetsturtlebotteleop4(:,'cloud_xt1'); joinedsetsturtlebotteleop5(:,'cloud_xt1')];
% y_t1 = [joinedsetsturtlebotteleop1(:,'cloud_yt1'); joinedsetsturtlebotteleop2(:,'cloud_yt1'); joinedsetsturtlebotteleop3(:,'cloud_yt1'); joinedsetsturtlebotteleop4(:,'cloud_yt1'); joinedsetsturtlebotteleop5(:,'cloud_yt1')];
% qx_t1 = [joinedsetsturtlebotteleop1(:,'cloud_qxt1'); joinedsetsturtlebotteleop2(:,'cloud_qxt1'); joinedsetsturtlebotteleop3(:,'cloud_qxt1'); joinedsetsturtlebotteleop4(:,'cloud_qxt1'); joinedsetsturtlebotteleop5(:,'cloud_qxt1')];
% qy_t1 = [joinedsetsturtlebotteleop1(:,'cloud_qyt1'); joinedsetsturtlebotteleop2(:,'cloud_qyt1'); joinedsetsturtlebotteleop3(:,'cloud_qyt1'); joinedsetsturtlebotteleop4(:,'cloud_qyt1'); joinedsetsturtlebotteleop5(:,'cloud_qyt1')];
% qz_t1 = [joinedsetsturtlebotteleop1(:,'cloud_qzt1'); joinedsetsturtlebotteleop2(:,'cloud_qzt1'); joinedsetsturtlebotteleop3(:,'cloud_qzt1'); joinedsetsturtlebotteleop4(:,'cloud_qzt1'); joinedsetsturtlebotteleop5(:,'cloud_qzt1')];
% qw_t1 = [joinedsetsturtlebotteleop1(:,'cloud_qwt1'); joinedsetsturtlebotteleop2(:,'cloud_qwt1'); joinedsetsturtlebotteleop3(:,'cloud_qwt1'); joinedsetsturtlebotteleop4(:,'cloud_qwt1'); joinedsetsturtlebotteleop5(:,'cloud_qwt1')];
% 
% x_t2 = [joinedsetsturtlebotteleop1(:,'cloud_xt2'); joinedsetsturtlebotteleop2(:,'cloud_xt2'); joinedsetsturtlebotteleop3(:,'cloud_xt2'); joinedsetsturtlebotteleop4(:,'cloud_xt2'); joinedsetsturtlebotteleop5(:,'cloud_xt2')];
% y_t2 = [joinedsetsturtlebotteleop1(:,'cloud_yt2'); joinedsetsturtlebotteleop2(:,'cloud_yt2'); joinedsetsturtlebotteleop3(:,'cloud_yt2'); joinedsetsturtlebotteleop4(:,'cloud_yt2'); joinedsetsturtlebotteleop5(:,'cloud_yt2')];
% qx_t2 = [joinedsetsturtlebotteleop1(:,'cloud_qxt2'); joinedsetsturtlebotteleop2(:,'cloud_qxt2'); joinedsetsturtlebotteleop3(:,'cloud_qxt2'); joinedsetsturtlebotteleop4(:,'cloud_qxt2'); joinedsetsturtlebotteleop5(:,'cloud_qxt2')];
% qy_t2 = [joinedsetsturtlebotteleop1(:,'cloud_qyt2'); joinedsetsturtlebotteleop2(:,'cloud_qyt2'); joinedsetsturtlebotteleop3(:,'cloud_qyt2'); joinedsetsturtlebotteleop4(:,'cloud_qyt2'); joinedsetsturtlebotteleop5(:,'cloud_qyt2')];
% qz_t2 = [joinedsetsturtlebotteleop1(:,'cloud_qzt2'); joinedsetsturtlebotteleop2(:,'cloud_qzt2'); joinedsetsturtlebotteleop3(:,'cloud_qzt2'); joinedsetsturtlebotteleop4(:,'cloud_qzt2'); joinedsetsturtlebotteleop5(:,'cloud_qzt2')];
% qw_t2 = [joinedsetsturtlebotteleop1(:,'cloud_qwt2'); joinedsetsturtlebotteleop2(:,'cloud_qwt2'); joinedsetsturtlebotteleop3(:,'cloud_qwt2'); joinedsetsturtlebotteleop4(:,'cloud_qwt2'); joinedsetsturtlebotteleop5(:,'cloud_qwt2')];
% 
% x_t3 = [joinedsetsturtlebotteleop1(:,'cloud_xt3'); joinedsetsturtlebotteleop2(:,'cloud_xt3'); joinedsetsturtlebotteleop3(:,'cloud_xt3'); joinedsetsturtlebotteleop4(:,'cloud_xt3'); joinedsetsturtlebotteleop5(:,'cloud_xt3')];
% y_t3 = [joinedsetsturtlebotteleop1(:,'cloud_yt3'); joinedsetsturtlebotteleop2(:,'cloud_yt3'); joinedsetsturtlebotteleop3(:,'cloud_yt3'); joinedsetsturtlebotteleop4(:,'cloud_yt3'); joinedsetsturtlebotteleop5(:,'cloud_yt3')];
% qx_t3 = [joinedsetsturtlebotteleop1(:,'cloud_qxt3'); joinedsetsturtlebotteleop2(:,'cloud_qxt3'); joinedsetsturtlebotteleop3(:,'cloud_qxt3'); joinedsetsturtlebotteleop4(:,'cloud_qxt3'); joinedsetsturtlebotteleop5(:,'cloud_qxt3')];
% qy_t3 = [joinedsetsturtlebotteleop1(:,'cloud_qyt3'); joinedsetsturtlebotteleop2(:,'cloud_qyt3'); joinedsetsturtlebotteleop3(:,'cloud_qyt3'); joinedsetsturtlebotteleop4(:,'cloud_qyt3'); joinedsetsturtlebotteleop5(:,'cloud_qyt3')];
% qz_t3 = [joinedsetsturtlebotteleop1(:,'cloud_qzt3'); joinedsetsturtlebotteleop2(:,'cloud_qzt3'); joinedsetsturtlebotteleop3(:,'cloud_qzt3'); joinedsetsturtlebotteleop4(:,'cloud_qzt3'); joinedsetsturtlebotteleop5(:,'cloud_qzt3')];
% qw_t3 = [joinedsetsturtlebotteleop1(:,'cloud_qwt3'); joinedsetsturtlebotteleop2(:,'cloud_qwt3'); joinedsetsturtlebotteleop3(:,'cloud_qwt3'); joinedsetsturtlebotteleop4(:,'cloud_qwt3'); joinedsetsturtlebotteleop5(:,'cloud_qwt3')];
% 
% %Targets:
% amcl_gazeboX = [joinedsetsturtlebotteleop1(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop2(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboX')];
% amcl_gazeboY = [joinedsetsturtlebotteleop1(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop2(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboY')];
% amcl_gazeboQX =[joinedsetsturtlebotteleop1(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop2(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQX')];
% amcl_gazeboQY = [joinedsetsturtlebotteleop1(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop2(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQY')];
% amcl_gazeboQZ = [joinedsetsturtlebotteleop1(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop2(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQZ')];
% amcl_gazeboQW = [joinedsetsturtlebotteleop1(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop2(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQW')];
% 

x_t = [joinedsetsturtlebotteleop2(:,'cloud_x_t'); joinedsetsturtlebotteleop3(:,'cloud_x_t'); joinedsetsturtlebotteleop4(:,'cloud_x_t'); joinedsetsturtlebotteleop5(:,'cloud_x_t')];
y_t = [joinedsetsturtlebotteleop2(:,'cloud_y_t'); joinedsetsturtlebotteleop3(:,'cloud_y_t'); joinedsetsturtlebotteleop4(:,'cloud_y_t'); joinedsetsturtlebotteleop5(:,'cloud_y_t')];
qx_t = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t'); joinedsetsturtlebotteleop3(:,'cloud_qx_t'); joinedsetsturtlebotteleop4(:,'cloud_qx_t'); joinedsetsturtlebotteleop5(:,'cloud_qx_t')];
qy_t = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t'); joinedsetsturtlebotteleop3(:,'cloud_qy_t'); joinedsetsturtlebotteleop4(:,'cloud_qy_t'); joinedsetsturtlebotteleop5(:,'cloud_qy_t')];
qz_t = [joinedsetsturtlebotteleop2(:,'cloud_qz_t'); joinedsetsturtlebotteleop3(:,'cloud_qz_t'); joinedsetsturtlebotteleop4(:,'cloud_qz_t'); joinedsetsturtlebotteleop5(:,'cloud_qz_t')];
qw_t = [ joinedsetsturtlebotteleop2(:,'cloud_qw_t'); joinedsetsturtlebotteleop3(:,'cloud_qw_t'); joinedsetsturtlebotteleop4(:,'cloud_qw_t'); joinedsetsturtlebotteleop5(:,'cloud_qw_t')];

x_t_1 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_1'); joinedsetsturtlebotteleop3(:,'cloud_x_t_1'); joinedsetsturtlebotteleop4(:,'cloud_x_t_1'); joinedsetsturtlebotteleop5(:,'cloud_x_t_1')];
y_t_1 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_1'); joinedsetsturtlebotteleop3(:,'cloud_y_t_1'); joinedsetsturtlebotteleop4(:,'cloud_y_t_1'); joinedsetsturtlebotteleop5(:,'cloud_y_t_1')];
qx_t_1 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_1'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_1'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_1'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_1')];
qy_t_1 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_1'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_1'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_1'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_1')];
qz_t_1 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_1'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_1'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_1'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_1')];
qw_t_1 = [ joinedsetsturtlebotteleop2(:,'cloud_qw_t_1'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_1'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_1'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_1')];

x_t_2 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_2'); joinedsetsturtlebotteleop3(:,'cloud_x_t_2'); joinedsetsturtlebotteleop4(:,'cloud_x_t_2'); joinedsetsturtlebotteleop5(:,'cloud_x_t_2')];
y_t_2 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_2'); joinedsetsturtlebotteleop3(:,'cloud_y_t_2'); joinedsetsturtlebotteleop4(:,'cloud_y_t_2'); joinedsetsturtlebotteleop5(:,'cloud_y_t_2')];
qx_t_2 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_2'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_2'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_2'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_2')];
qy_t_2 = [joinedsetsturtlebotteleop2(:,'cloud_qy_t_2'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_2'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_2'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_2')];
qz_t_2 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_2'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_2'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_2'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_2')];
qw_t_2 = [ joinedsetsturtlebotteleop2(:,'cloud_qw_t_2'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_2'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_2'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_2')];

x_t_3 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_3'); joinedsetsturtlebotteleop3(:,'cloud_x_t_3'); joinedsetsturtlebotteleop4(:,'cloud_x_t_3'); joinedsetsturtlebotteleop5(:,'cloud_x_t_3')];
y_t_3 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_3'); joinedsetsturtlebotteleop3(:,'cloud_y_t_3'); joinedsetsturtlebotteleop4(:,'cloud_y_t_3'); joinedsetsturtlebotteleop5(:,'cloud_y_t_3')];
qx_t_3 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_3'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_3'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_3'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_3')];
qy_t_3 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_3'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_3'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_3'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_3')];
qz_t_3 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_3'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_3'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_3'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_3')];
qw_t_3 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_3'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_3'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_3'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_3')];


x_t_4 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_4'); joinedsetsturtlebotteleop3(:,'cloud_x_t_4'); joinedsetsturtlebotteleop4(:,'cloud_x_t_4'); joinedsetsturtlebotteleop5(:,'cloud_x_t_4')];
y_t_4 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_4'); joinedsetsturtlebotteleop3(:,'cloud_y_t_4'); joinedsetsturtlebotteleop4(:,'cloud_y_t_4'); joinedsetsturtlebotteleop5(:,'cloud_y_t_4')];
qx_t_4 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_4'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_4'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_4'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_4')];
qy_t_4 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_4'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_4'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_4'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_4')];
qz_t_4 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_4'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_4'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_4'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_4')];
qw_t_4 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_4'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_4'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_4'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_4')];

x_t_5 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_5'); joinedsetsturtlebotteleop3(:,'cloud_x_t_5'); joinedsetsturtlebotteleop4(:,'cloud_x_t_5'); joinedsetsturtlebotteleop5(:,'cloud_x_t_5')];
y_t_5 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_5'); joinedsetsturtlebotteleop3(:,'cloud_y_t_5'); joinedsetsturtlebotteleop4(:,'cloud_y_t_5'); joinedsetsturtlebotteleop5(:,'cloud_y_t_5')];
qx_t_5 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_5'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_5'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_5'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_5')];
qy_t_5 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_5'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_5'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_5'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_5')];
qz_t_5 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_5'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_5'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_5'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_5')];
qw_t_5 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_5'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_5'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_5'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_5')];

x_t_6 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_6'); joinedsetsturtlebotteleop3(:,'cloud_x_t_6'); joinedsetsturtlebotteleop4(:,'cloud_x_t_6'); joinedsetsturtlebotteleop5(:,'cloud_x_t_6')];
y_t_6 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_6'); joinedsetsturtlebotteleop3(:,'cloud_y_t_6'); joinedsetsturtlebotteleop4(:,'cloud_y_t_6'); joinedsetsturtlebotteleop5(:,'cloud_y_t_6')];
qx_t_6 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_6'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_6'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_6'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_6')];
qy_t_6 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_6'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_6'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_6'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_6')];
qz_t_6 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_6'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_6'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_6'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_6')];
qw_t_6 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_6'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_6'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_6'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_6')];

x_t_7 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_7'); joinedsetsturtlebotteleop3(:,'cloud_x_t_7'); joinedsetsturtlebotteleop4(:,'cloud_x_t_7'); joinedsetsturtlebotteleop5(:,'cloud_x_t_7')];
y_t_7 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_7'); joinedsetsturtlebotteleop3(:,'cloud_y_t_7'); joinedsetsturtlebotteleop4(:,'cloud_y_t_7'); joinedsetsturtlebotteleop5(:,'cloud_y_t_7')];
qx_t_7 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_7'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_7'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_7'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_7')];
qy_t_7 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_7'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_7'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_7'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_7')];
qz_t_7 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_7'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_7'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_7'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_7')];
qw_t_7 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_7'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_7'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_7'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_7')];

x_t_8 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_8'); joinedsetsturtlebotteleop3(:,'cloud_x_t_8'); joinedsetsturtlebotteleop4(:,'cloud_x_t_8'); joinedsetsturtlebotteleop5(:,'cloud_x_t_8')];
y_t_8 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_8'); joinedsetsturtlebotteleop3(:,'cloud_y_t_8'); joinedsetsturtlebotteleop4(:,'cloud_y_t_8'); joinedsetsturtlebotteleop5(:,'cloud_y_t_8')];
qx_t_8 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_8'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_8'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_8'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_8')];
qy_t_8 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_8'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_8'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_8'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_8')];
qz_t_8 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_8'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_8'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_8'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_8')];
qw_t_8 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_8'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_8'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_8'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_8')];


x_t_9 = [joinedsetsturtlebotteleop2(:,'cloud_x_t_9'); joinedsetsturtlebotteleop3(:,'cloud_x_t_9'); joinedsetsturtlebotteleop4(:,'cloud_x_t_9'); joinedsetsturtlebotteleop5(:,'cloud_x_t_9')];
y_t_9 = [ joinedsetsturtlebotteleop2(:,'cloud_y_t_9'); joinedsetsturtlebotteleop3(:,'cloud_y_t_9'); joinedsetsturtlebotteleop4(:,'cloud_y_t_9'); joinedsetsturtlebotteleop5(:,'cloud_y_t_9')];
qx_t_9 = [ joinedsetsturtlebotteleop2(:,'cloud_qx_t_9'); joinedsetsturtlebotteleop3(:,'cloud_qx_t_9'); joinedsetsturtlebotteleop4(:,'cloud_qx_t_9'); joinedsetsturtlebotteleop5(:,'cloud_qx_t_9')];
qy_t_9 = [ joinedsetsturtlebotteleop2(:,'cloud_qy_t_9'); joinedsetsturtlebotteleop3(:,'cloud_qy_t_9'); joinedsetsturtlebotteleop4(:,'cloud_qy_t_9'); joinedsetsturtlebotteleop5(:,'cloud_qy_t_9')];
qz_t_9 = [ joinedsetsturtlebotteleop2(:,'cloud_qz_t_9'); joinedsetsturtlebotteleop3(:,'cloud_qz_t_9'); joinedsetsturtlebotteleop4(:,'cloud_qz_t_9'); joinedsetsturtlebotteleop5(:,'cloud_qz_t_9')];
qw_t_9 = [joinedsetsturtlebotteleop2(:,'cloud_qw_t_9'); joinedsetsturtlebotteleop3(:,'cloud_qw_t_9'); joinedsetsturtlebotteleop4(:,'cloud_qw_t_9'); joinedsetsturtlebotteleop5(:,'cloud_qw_t_9')];






%Targets:
amcl_gazeboX = [joinedsetsturtlebotteleop2(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboX'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboX')];
amcl_gazeboY = [joinedsetsturtlebotteleop2(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboY'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboY')];
amcl_gazeboQX =[ joinedsetsturtlebotteleop2(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQX'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQX')];
amcl_gazeboQY = [ joinedsetsturtlebotteleop2(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQY'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQY')];
amcl_gazeboQZ = [ joinedsetsturtlebotteleop2(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQZ'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQZ')];
amcl_gazeboQW = [ joinedsetsturtlebotteleop2(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop3(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop4(:,'AMCL_GazeboQW'); joinedsetsturtlebotteleop5(:,'AMCL_GazeboQW')];

%convert to arrays:
x_t = table2array(x_t);
y_t = table2array(y_t);
qx_t = table2array(qx_t);
qy_t = table2array(qy_t);
qz_t = table2array(qz_t);
qw_t = table2array(qw_t);

x_t_1 = table2array(x_t_1);
y_t_1 = table2array(y_t_1);
qx_t_1 = table2array(qx_t_1);
qy_t_1 = table2array(qy_t_1);
qz_t_1 = table2array(qz_t_1);
qw_t_1 = table2array(qw_t_1);

x_t_2 = table2array(x_t_2);
y_t_2 = table2array(y_t_2);
qx_t_2 = table2array(qx_t_2);
qy_t_2 = table2array(qy_t_2);
qz_t_2 = table2array(qz_t_2);
qw_t_2 = table2array(qw_t_2);

x_t_3 = table2array(x_t_3);
y_t_3 = table2array(y_t_3);
qx_t_3 = table2array(qx_t_3);
qy_t_3 = table2array(qy_t_3);
qz_t_3 = table2array(qz_t_3);
qw_t_3 = table2array(qw_t_3);

x_t_4 = table2array(x_t_4);
y_t_4 = table2array(y_t_4);
qx_t_4 = table2array(qx_t_4);
qy_t_4 = table2array(qy_t_4);
qz_t_4 = table2array(qz_t_4);
qw_t_4 = table2array(qw_t_4);

x_t_5 = table2array(x_t_5);
y_t_5 = table2array(y_t_5);
qx_t_5 = table2array(qx_t_5);
qy_t_5 = table2array(qy_t_5);
qz_t_5 = table2array(qz_t_5);
qw_t_5 = table2array(qw_t_5);

x_t_6 = table2array(x_t_6);
y_t_6 = table2array(y_t_6);
qx_t_6 = table2array(qx_t_6);
qy_t_6 = table2array(qy_t_6);
qz_t_6 = table2array(qz_t_6);
qw_t_6 = table2array(qw_t_6);

x_t_7 = table2array(x_t_7);
y_t_7 = table2array(y_t_7);
qx_t_7 = table2array(qx_t_7);
qy_t_7 = table2array(qy_t_7);
qz_t_7 = table2array(qz_t_7);
qw_t_7 = table2array(qw_t_7);

x_t_8 = table2array(x_t_8);
y_t_8 = table2array(y_t_8);
qx_t_8 = table2array(qx_t_8);
qy_t_8 = table2array(qy_t_8);
qz_t_8 = table2array(qz_t_8);
qw_t_8 = table2array(qw_t_8);

x_t_9 = table2array(x_t_9);
y_t_9 = table2array(y_t_9);
qx_t_9 = table2array(qx_t_9);
qy_t_9 = table2array(qy_t_9);
qz_t_9 = table2array(qz_t_9);
qw_t_9 = table2array(qw_t_9);





amcl_gazeboX = table2array(amcl_gazeboX);
amcl_gazeboY = table2array(amcl_gazeboY);
amcl_gazeboQX = table2array(amcl_gazeboQX);
amcl_gazeboQY = table2array(amcl_gazeboQY);
amcl_gazeboQZ = table2array(amcl_gazeboQZ);
amcl_gazeboQW = table2array(amcl_gazeboQW);





inputs = [x_t y_t qx_t qy_t qz_t qw_t x_t_1 y_t_1 qx_t_1 qy_t_1 qz_t_1 qw_t_1 x_t_2 y_t_2 qx_t_2 qy_t_2 qz_t_2 qw_t_2 x_t_3 y_t_3 qx_t_3 qy_t_3 qz_t_3 qw_t_3 x_t_4 y_t_4 qx_t_4 qy_t_4 qz_t_4 qw_t_4 x_t_5 y_t_5 qx_t_5 qy_t_5 qz_t_5 qw_t_5 x_t_6 y_t_6 qx_t_6 qy_t_6 qz_t_6 qw_t_6 x_t_7 y_t_7 qx_t_7 qy_t_7 qz_t_7 qw_t_7 x_t_8 y_t_8 qx_t_8 qy_t_8 qz_t_8 qw_t_8 x_t_9 y_t_9 qx_t_9 qy_t_9 qz_t_9 qw_t_9]';
targets = [amcl_gazeboX amcl_gazeboY amcl_gazeboQX amcl_gazeboQY amcl_gazeboQZ amcl_gazeboQW]';


net = feedforwardnet(10);%Create a net of 10 neurons %5 here with 0.0001 lr gets it down to 0.04 MSE when just doing teleop
net.trainParam.lr = .0001; %set learning rate to one over one thousand
net.numLayers = 3;

%Divide data into 2/3 training and 1/3 validation
net.divideParam.trainRatio = 1/3;
net.divideParam.valRatio = 1/3;
net.divideParam.testRatio = 1/3;



inputs_std = mapstd(inputs);
targets_std = mapstd(targets);


%Go!
[net,tr] = train(net,inputs_std,targets_std);

%once trained you can use the 'net' object 


new_inputs = [table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_1')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_1')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_1')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_1')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_1')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_1')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_2')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_2')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_2')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_2')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_2')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_2')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_3')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_3')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_3')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_3')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_3')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_3')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_4')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_4')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_4')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_4')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_4')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_4')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_5')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_5')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_5')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_5')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_5')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_5')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_6')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_6')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_6')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_6')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_6')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_6')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_7')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_7')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_7')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_7')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_7')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_7')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_8')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_8')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_8')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_8')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_8')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_8')) table2array(joinedsetsturtlebotteleop1(:,'cloud_x_t_9')) table2array(joinedsetsturtlebotteleop1(:,'cloud_y_t_9')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qx_t_9')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qy_t_9')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qz_t_9')) table2array(joinedsetsturtlebotteleop1(:,'cloud_qw_t_9'))]';
new_inputs_std = mapstd(new_inputs);
output = net(new_inputs_std);
