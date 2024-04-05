%% =========================
%  MATLAB - ROS2 Subscriber
%  A. Nemecek - Robotik
%  =========================
%  https://de.mathworks.com/help/ros/ref/ros2subscriber.html
clc; clear all; close all;
disp('MATLAB - ROS2 Subscriber')

%% === Init ===
% start ros2 Publisher via wsl2
disp('=== ros2 node list ===')
ros2 node list
disp('=== ros2 topic list ===')
ros2 topic list

node  = ros2node("/Publisher");
topic = ["/topic"];
sub = ros2subscriber(node,topic);

for k = 1:5
    sub = ros2subscriber(node,topic);
    pause(1);
    n = double(sub.LatestMessage.data)
    num(k) = n;
end
