#! /bin/bash
#set n to the number of simulations you want in total.
n=10

#simple while loop to create simulations in subshell
i=1
port1=5555
port2=11311
network_id=1
docker volume prune -f
docker network prune -f

while [ "$network_id" -le "$n" ]
do 
	docker network create network_"$network_id"
	network_id=$(("network_id"+1))
done

network_id=1

while [ "$i" -le "$n" ]
do 
	(trap 'kill 0' SIGINT; docker run -d --network network_"$network_id" --rm -v simulation_log_"$i":/home/robomaker/my_logs --name sim_"$i" -u robomaker -e ROBOMAKER_GAZEBO_MASTER_URI=http://localhost:"$port1" -e ROBOMAKER_ROS_MASTER_URI=http://localhost:"$port2" simulation ) &
	(trap 'kill 0' SIGINT; docker run -d --network network_"$network_id" --rm --name cont_"$i" -u robomaker -e ROBOMAKER_GAZEBO_MASTER_URI=http://localhost:"$port1" -e ROBOMAKER_ROS_MASTER_URI=http://localhost:"$port2" controller )
	port1=$(("port1"+1))
	port2=$(("port2"+1))
	i=$(("i"+1))
	network_id=$(("network_id"+1))
done

while true
do
if pgrep -x "python3" > /dev/null
then
    sleep 0.5
else
    echo "Stopped"
    killall gzserver
    break
fi 
done



