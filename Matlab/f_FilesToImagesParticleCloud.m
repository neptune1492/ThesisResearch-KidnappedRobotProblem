function a = FilesToImagesParticleCloud( InputFileName,SaveFilesToFolder,WeightsInputFileName, unique_weights, color_scheme )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Clear fiures
clf;

%import data file:
%InputFileName = 'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\1\particlecloudPreResample.csv';
%SaveFilesToFolder='C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\1\particlecloudpictures\particlecloudpictures';
TimesParticleCloudPoints = readtable(InputFileName,'Delimiter', '\t');
TimesParticleCloudPoints = table2array(TimesParticleCloudPoints);

%WeightsInputFileName = 'C:\Users\ebrenna8\Documents\Data Files\11-27-17\NovemberDataCollection\Normal\1\cloud_weight.csv';
Weights = readtable(WeightsInputFileName,'Delimiter', '\t');
WeightsArray = table2array(Weights);




%unique_weights = sort(unique(WeightsArray(:,3))); %Sort from least to greatest
%color_scheme = colormap(winter(length(unique_weights))); %create a list of unique 3-element colors for as many unique particle weights are in the dataset, arranged lightest-to-darkest  (I think)


d = TimesParticleCloudPoints(:,1);
times = unique(TimesParticleCloudPoints(:,1)); %get distinct time periods
points = [];
counter = 0;
for t=1:size(times)  %for each timestep.
    
    counter =counter+1;
    points = [];
    for w=1:size(TimesParticleCloudPoints(:,1)) %Go through each row of the table
        if TimesParticleCloudPoints(w,1) == times(t) %If the current row's time is the timestep we're dealing with...
            %Record the pose
            AMCL_X = TimesParticleCloudPoints(w,3);
            AMCL_Y = TimesParticleCloudPoints(w,4);
            AMCL_Heading = TimesParticleCloudPoints(w,5);
          
            %Go to the weights array and find the weight that corresponds
            %to this pose at this timestep
            
            %WeightsArray(:,1)
            %TimesParticleCloudPoints(w,2)
            %idx = WeightsArray(WeightsArray(:,1)==TimesParticleCloudPoints(w,1))
            idx = find((WeightsArray(:,1)==TimesParticleCloudPoints(w,1)) & (WeightsArray(:,2) == TimesParticleCloudPoints(w,2))); 
            %This sometimes results in 2, due to duplicate messages in bag file
           if size(idx,1) > 1
               idx=idx(size(idx,1))
           end
           
            
            if ~isempty(idx)
                AMCL_Weight = WeightsArray(idx,3);
            else
                AMCL_Weight = WeightsArray(1,3);%unique_weights(1);
            end
            
            
             
            
            
            %Assign a color
            
            color_idx = find(unique_weights==AMCL_Weight);
            if ~isempty(color_idx)
                col = color_scheme(color_idx,:);
            else
                %print out the timestep
                col = color_scheme(1,:);
                times(t)
                
            end
          
            
            points = [points; AMCL_X AMCL_Y AMCL_Heading AMCL_Weight col(1,1) col(1,2) col(1,3)];
        end
    end
    
   
    %Plotting x, y, and theta
    [u,v] = pol2cart(points(:,3),0.1); %0.1 %Polar to cartesian (xy) coordinates. was :,3
    
    set(gcf,'visible','off') %This prevents a Matlab window w/the figure
     %this lets me plot multiple things with quiver.
    %hold off, fig = quiver(points(:,1), points(:,2), u,v,'color',[0 0 0]) %Black %(Gray=[0.5 0.5 0.5])
 
    
    
   

    % this makes it suitable for both 2D and 3D
    z =  zeros(length(points),1);
    xy = [points(:,1) points(:,2)];
    xyz=[xy z];
    xyz = num2cell(xyz); 
    w = zeros(length(points),1);%angle
    uvw = num2cell([u,v,w]);   
    
    L=0;
    clf(findobj('type','figure')); %if 'fig' exists, 
    %hold on;%Turn on hold within loop so all points get action
    for ii = 1:size(xyz,1)
    
        L = cellfun(@(x,y) [0;x] + [y;y], ...
            uvw(ii,:), xyz(ii,:),...
            'Uniformoutput', false);
        L = line(L{:});
        set(L, 'color', [points(ii,5) points(ii,6) points(ii,7)]);
        hold on, fig=L;
    end
    hold off; %Turn off hold
    %hold off, fig=L;
  
 %The below statement plots AMCL particle cloud
 %hold off, fig = quiver(points(:,1), points(:,2), u,v,'color',[0.5 0.5 0.5]) %Black %(Gray=[0.5 0.5 0.5])
    
    


    
    
    
    %This part plots the AMCL positoin estimate on top of the point cloud,
    %but something's just not working and arrow looks weird
    %[u,v] = pol2cart(points(1,6),0.1); %0.1
    %hold on, fig = quiver(points(1,4),points(1,5),u,v,'color',[1 0 0],'linewidth',2); %Red
    
    
    %Add a dot for the mean point of thh particle cloud.
    %[u,v] = pol2cart(mean(points(:,3)),0.1); %0.1
    %hold on, fig = quiver(mean(points(:,1)),mean(points(:,2)),u,v,'color',[0 1 0],'linewidth',1); %Green
    
    
    %Add a dot for the Gazebo pose at this timestamp (based on matching AMCL pose):
     %Add a dot for the mean point of thh particle cloud.
     % for line=1:size(GazeboPoses(:,1))
     %   if GazeboPoses(line,8) == AMCL_X && GazeboPoses(line,9) ==AMCL_Y
     %       Gazebo_X = GazeboPoses(line,2);
     %       Gazebo_Y = GazeboPoses(line,3);
     %       break
     %   end
     % end
      
    
    %[u,v] = pol2cart(GazeboAngles(line,1),0.1); %0.1
    %hold on, fig = quiver(Gazebo_X,Gazebo_Y,u,v,'color',[0 0 1]);%,'linewidth',5); %Blue
    %legend('Particle Cloud Poses', 'AMCL Pose Estimate (Most Likely Based on Particle Cloud)', 'Mean Pose of Particle Cloud Poses', 'Ground-truth Gazebo Robot Pose');
    
    
    %Add a title
%     if (times(t) >= 45 && strfind(InputFileName,'Major') && ~(strfind(InputFileName, '11') || strfind(InputFileName, '12') || strfind(InputFileName, '13')))
%         %If Major kidnapping, and if trial 1-10
%         header = strvcat('Post-Kidnapping Event at 45 sec','T = ', num2str(times(t)));
%     elseif (times(t) < 45 && strfind(InputFileName,'Major') && ~(strfind(InputFileName, '11') || strfind(InputFileName, '12') || strfind(InputFileName, '13')))
%          header = strvcat('Major Kidnapping Example approaching event at 45 sec','T = ', num2str(times(t)));
%          
%     %if it's major kidnapping and trial 11-13     
%     elseif (times(t) >= 65 && strfind(InputFileName,'Major') && (strfind(InputFileName, '11') || strfind(InputFileName, '12') || strfind(InputFileName, '13')))
%         %If Major kidnapping, and if trial 11-13
%         header = strvcat('Post-Kidnapping Event at 65 sec','T = ', num2str(times(t)));
%     elseif (times(t) < 65 && strfind(InputFileName,'Major') && (strfind(InputFileName, '11') || strfind(InputFileName, '12') || strfind(InputFileName, '13')))
%          header = strvcat('Major Kidnapping Example approaching event at 65 sec','T = ', num2str(times(t)));
%     elseif strfind(InputFileName, 'Normal')
%         header = strvcat('Normal AMCL Example','T = ', num2str(times(t)));
%     else
%          header = strvcat('Major Kidnapping Example','T = ', num2str(times(t)));
%     end
    
    if (isempty(strfind(InputFileName,'Normal')))
        header= strvcat('Major Kidnapping Example','T = ', num2str(times(t)));
    else 
     header = strvcat('Normal AMCL Example','T = ', num2str(times(t)));
    end
    
    
    caxis([ min(unique_weights) max(unique_weights)]);
    colorbar;
    

    title(header);
    axis([-3 3 -3 3]);
    saveas(fig, strcat(SaveFilesToFolder, int2str(counter),'.png'));
    clf(fig,'reset');
end


    
  
end

