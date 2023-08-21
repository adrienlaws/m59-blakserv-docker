# m59-blakserv-docker


## Steps to run your Meridian 59 blackserv Linux docker container
1. Get [Docker Desktop] (https://www.docker.com/products/docker-desktop/)
2. Get the current image from hub.docker.com or through the Docker Desktop interface
   - click the search bar at the top and enter `blakserv`
   - click "Pull" to pull the image to your machine (i.e. download)
![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/ea8fc7bf-798d-4656-9245-583789d397f2)

   - OR use the following command via a terminal
```
 docker pull toko5/blakserv-1
```
3. Run your blakserv Meridian 59 server by executing this command

```
docker run -dit -p 5959:5959 -p 9998:9998 --rm blakserv-1
```
   - Here is a description of the options used in this command
      - The `-d` option means the container will start in "detached" mode (as a background process without a terminal)
      - `-i` option
      - The `-t` option
      - the two `-p` options specify port mapping.  The left is the host system and the right is the container port.
        - Two ports `5959` and `9998` are mapped.  `5959` is used for the Meridian client to connect to, while `9998` is a maintenance port that you can use to administrate the server with limited capability.
      - You can log into the terminal by opening Docker Desktop.
      - The `--rm` option means that the container will be deleted on shutdown.  Nothing will be saved.

4. Configure your local dev Meridian 59 client to connect to localhost on port `5959`
   - the easiest way is to configure a shortcut to `meridian.exe` with the /H and /P flags set
   - example
```
C:\Meridian59\run\localclient\meridian.exe /U:test /W:test /H:localhost /P:5959
```
![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/85e5491e-bc25-43ec-bf8d-b448a8138a05)
5. Connect to the maintenance port to add a Meridian 59 user account so you can log in with the client
   - You can use Putty to connect via a RAW TCP connection on port 9998
   - To add a user when that terminal opens
```
create automated test test
create user 3 
```


Additional
If building from the Docerfile instead of downloading the image
use this command
```
docker build -t blakserv-1 .
```
