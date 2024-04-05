%% =========================
%  MATLAB - ROS2 Publisher
%  A. Nemecek - Robotik
%  =========================
%  https://de.mathworks.com/help/ros/ref/ros2publisher.html
clc; clear all; close all;
disp('MATLAB - ROS2 Publisher')

%% === Init ===
% start ros2 Subscriber via wsl2

disp('=== ros2 node list ===')
ros2 node list
disp('=== ros2 topic list ===')
ros2 topic list

nod = ros2node('/Matlab_Publisher');
top = '/topic';
msg = ros2message('std_msgs/Int16');

disp('=== messages send ===')

for k = 1:5
    n = randi(100)
    msg.data = int16(n);    % Zahl => msg im Datenformat Int16
    pub = ros2publisher(nod,top,"std_msgs/Int16");
    pause(1)
    send(pub,msg)           % absenden
end

disp('=== ros2 node list ===')
ros2 node list


