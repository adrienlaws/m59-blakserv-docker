# m59-blakserv-docker


## Steps to run your Meridian 59 blakserv Linux Docker container
1. Install the official [Docker Desktop](https://www.docker.com/products/docker-desktop/) application
2. Pull the current Docker `blakserv` image from Docker Hub through the Docker Desktop interface
   - use the search bar at the top of Docker Desktop and search for `blakserv`
   - click `Pull` to pull the image to your machine (i.e. download)
![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/142bd150-320c-4482-a032-f8ed0b1d5025)


   - OR use the following command via a terminal
```
 docker pull toko5/blakserv-1
```
3. Run your `blakserv` Meridian 59 server by executing this command

```
docker run -dit -p 5959:5959 -p 9998:9998 --rm toko5/blakserv-1
```
   - This starts a `container` from the downloaded `blakserv` image
   - This automatically starts a Meridian 59 server with open ports `5959` and `9998`
      - TCP `5959` is used by the Meridian client
      - TCP `9998` is a maintenance port that you can use to administrate the server with limited capability.
      - The `--rm` option means that the container will be deleted on shutdown.  Nothing will be saved.
4. Create an account on the server either through a telnet session or using the built-in terminal within Docker
   - Using [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
      - Connect to the maintenance port to add a Meridian 59 user account so you can log in with the client
      - You can use Putty to connect via a RAW TCP connection on port 9998
      - example
      - ![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/f609ccba-09c5-47df-b2eb-ed9c54cb8c63)
   - OR Use Docker Terminal
      - you can use built-in commands to connect to the maintenance port from the container itself
      - Open Containers then click on the randomly generated container name (in this example `crazy_heyrovsky`)
      - ![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/61d30cd5-152d-4309-a570-cd44de19791f)
      - Click on `Terminal` to open a terminal session
      - ![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/e44fc83a-fbfd-4022-bbfc-98b320923223)
      - Create a local connection to the maintenance port by typing the following
```
busybox-extras telnet localhost 9998
```
   - Then paste in following commands to add a test user with account name test / password test
```
create automated test test
create user 3 
```
   - example
   - ![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/09d02cbc-31b4-4548-8266-662f53c4c8d4)

5. Configure your local Meridian 59 client to connect to localhost on port `5959`
   - the easiest way is to configure a shortcut to `meridian.exe` with the /H and /P flags set
   - example
```
C:\Meridian59\run\localclient\meridian.exe /U:test /W:test /H:localhost /P:5959
```
   - ![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/85e5491e-bc25-43ec-bf8d-b448a8138a05)

You should now be able to log into your `blakserv` Docker container server through your local Windows Meridian 59 client.
