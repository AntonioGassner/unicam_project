FROM base_image_v9.4

RUN cd /home/robomaker/project_ccc && \
 /bin/bash -c "source /opt/ros/foxy/setup.bash && rosdep install --rosdistro foxy --from-paths src --ignore-src -r -y && colcon build"

RUN echo 'source ~/project_ccc/install/setup.bash' >> ~/.bashrc 

COPY controller_entrypoint.sh /home/robomaker/controller_entrypoint.sh
RUN sh -c 'sudo chmod +x /home/robomaker/controller_entrypoint.sh'
RUN sh -c 'sudo chown robomaker:robomaker /home/robomaker/controller_entrypoint.sh'

CMD ros2 launch ccc_pkg controllers.launch.py
ENTRYPOINT [ "/home/robomaker/controller_entrypoint.sh" ]
