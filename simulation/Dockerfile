FROM base_image

RUN cd /home/robomaker/project_ccc && \
 /bin/bash -c "source /opt/ros/foxy/setup.bash && rosdep install --rosdistro foxy --from-paths src --ignore-src -r -y && colcon build"

RUN echo 'source ~/project_ccc/install/setup.bash' >> ~/.bashrc 

COPY simulation_entrypoint.sh /home/robomaker/simulation_entrypoint.sh
RUN sh -c 'sudo chmod +x /home/robomaker/simulation_entrypoint.sh'
RUN sh -c 'sudo chown robomaker:robomaker /home/robomaker/simulation_entrypoint.sh'
RUN sudo chmod -R 777 /home/robomaker

CMD ros2 launch ccc_pkg simulation.launch.py
ENTRYPOINT [ "/home/robomaker/simulation_entrypoint.sh" ]
