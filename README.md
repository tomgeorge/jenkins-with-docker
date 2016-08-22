# Jenkins with docker #

Everything is the same as the official jenkins image, except docker has been installed and the jenkins user has been added to the staff group to access the docker socket.

This image bind mounts to docker's /var/run/docker.sock:

`docker run -dP /var/run/docker.sock:/var/run/docker.sock tomgeorge/jenkins-docker`

If you run:

`docker exec -it <container id> docker ps`

You should see the containers you have already started on your host.

There are a couple gotcha's and possible security issues with this that allow you to escape the container, but I'm just doing this for fun.

https:/jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/

https://www.lvh.io/posts/dont-expose-the-docker-socket-not-even-to-a-container.html
