# =====================
# ros2 humble publisher
# https://docs.ros.org/en/humble/Tutorials/Beginner-Client-Libraries/Writing-A-Simple-Py-Publisher-And-Subscriber.html
# =====================

import rclpy
from rclpy.node import Node

from std_msgs.msg import Int16
#from std_msgs.msg import String
from random import randint

class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('Publisher')
        self.publisher_ = self.create_publisher(Int16, 'topic', 10)
        #  self.publisher_ = self.create_publisher(String, 'topic', 10)
        timer_period = 1  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        msg = Int16()
        # msg = String()  
        self.i = randint(0, 100)    # Random Integer 0...100
        msg.data = self.i
        # msg.data = 'Hello World: %d' % self.i
        self.publisher_.publish(msg)
        self.get_logger().info('Publish: "%s"' % msg.data)
        #self.i += 1

def main(args=None):
    rclpy.init(args=args)
    minimal_publisher = MinimalPublisher()
    rclpy.spin(minimal_publisher)
    minimal_publisher.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
