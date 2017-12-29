%import data file:
InputFileName = 'C:\Users\ebrenna8\Desktop\particle_cloud_files\major-5.txt';
SaveFilesToFolder='C:\Users\ebrenna8\Desktop\particle_cloud_files\';

GazeboPoseFileName = 'C:\Users\ebrenna8\Desktop\particle_cloud_files\poses_sorted-5.txt';
GazeboAnglesRadiansName ='C:\Users\ebrenna8\Desktop\particle_cloud_files\test.txt';


TimesParticleCloudPoints = readtable(InputFileName,'Delimiter', '\t');
TimesParticleCloudPoints = table2array(TimesParticleCloudPoints);


GazeboPoses = readtable(GazeboPoseFileName,'Delimiter', '\t');
GazeboPoses = table2array(GazeboPoses);

GazeboAngles = readtable(GazeboAnglesRadiansName,'Delimiter', '\t');
GazeboAngles = table2array(GazeboAngles);


d = TimesParticleCloudPoints(:,1);
times = unique(TimesParticleCloudPoints(:,1)); %get distinct time periods
points = [];
counter = 0;
for t=1:size(times)  
    counter =counter+1;
    points = [];
    for w=1:size(TimesParticleCloudPoints(:,1))
        if TimesParticleCloudPoints(w,1) == times(t)
            AMCL_X = TimesParticleCloudPoints(w,10);
            AMCL_Y = TimesParticleCloudPoints(w,11);
            points = [points; TimesParticleCloudPoints(w,3) TimesParticleCloudPoints(w,4) TimesParticleCloudPoints(w,5) TimesParticleCloudPoints(w,10) TimesParticleCloudPoints(w,11) TimesParticleCloudPoints(w,12);];
        end
    end
   
    %Plotting x, y, and theta
    [u,v] = pol2cart(points(:,3),0.1); %0.1
    
    set(gcf,'visible','off') %This prevents a Matlab window w/the figure
     %this lets me plot multiple things with quiver.
    hold off, fig = quiver(points(:,1), points(:,2), u,v,'color',[0 0 0]); %Black %(Gray=[0.5 0.5 0.5])
    
    %This part plots the AMCL positoin estimate on top of the point cloud,
    %but something's just not working and arrow looks weird
    [u,v] = pol2cart(points(1,6),0.1); %0.1
    hold on, fig = quiver(points(1,4),points(1,5),u,v,'color',[1 0 0],'linewidth',2); %Red
    
    
    %Add a dot for the mean point of thh particle cloud.
    [u,v] = pol2cart(mean(points(:,3)),0.1); %0.1
    hold on, fig = quiver(mean(points(:,1)),mean(points(:,2)),u,v,'color',[0 1 0],'linewidth',1); %Green
    
    
    %Add a dot for the Gazebo pose at this timestamp (based on matching AMCL pose):
     %Add a dot for the mean point of thh particle cloud.
      for line=1:size(GazeboPoses(:,1))
        if GazeboPoses(line,8) == AMCL_X && GazeboPoses(line,9) ==AMCL_Y
            Gazebo_X = GazeboPoses(line,2);
            Gazebo_Y = GazeboPoses(line,3);
            break
        end
      end
      
    
    [u,v] = pol2cart(GazeboAngles(line,1),0.1); %0.1
    hold on, fig = quiver(Gazebo_X,Gazebo_Y,u,v,'color',[0 0 1]);%,'linewidth',5); %Blue
    legend('Particle Cloud Poses', 'AMCL Pose Estimate (Most Likely Based on Particle Cloud)', 'Mean Pose of Particle Cloud Poses', 'Ground-truth Gazebo Robot Pose')
    
    
    %Add a title
    if times(t) >= 70 
        header = strvcat('Post-Kidnapping Event','T = ', num2str(times(t)));
    else
        header = strvcat('Major Kidnapping Example','T = ', num2str(times(t)));
    end
    
    title(header);
    axis([-3 3 -3 3]);
    saveas(fig, strcat(SaveFilesToFolder, int2str(counter),'.png'));
end
    