# Stop all containers
docker stop $(docker ps -a -q)

# Remove all containers
docker rm $(docker ps -a -q)

# Run detached (in background)
docker run -tid alpine 

# Attach to running container
docker attach 34ec4d
docker attach --name stinky_segregate
# You can detach from a container and leave it running using 
# the CTRL-p CTRL-q key sequence.

# Rename container
docker rename stinky_segragate herokudev

# Diff
docker container diff herokudev