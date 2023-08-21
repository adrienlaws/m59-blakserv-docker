# m59-blakserv-docker


## Steps to run your Meridian 59 blackserv Linux docker container
1. Get [Docker Desktop] (https://www.docker.com/products/docker-desktop/)
2. Get the current image from hub.docker.com or through the Docker Desktop interface
   - `toko5/blackserv-1:latest`
4. Run your blakserv Meridian 59 server by executing this command

```
docker run -dit -p 5959:5959 -p 9998:9998 --rm blakserv-1
```
This will run in the background as a "detached" container.  You can log into the terminal by opening Docker Desktop.  Upon exiting nothing will be saved.  This container is intended for testing.

4. Configure your local dev Meridian 59 client to connect to localhost on port `5959`
   - the easiest way is to configure a shortcut to `meridian.exe` with the /H and /P flags set
   - example
```
C:\Meridian59\run\localclient\meridian.exe /U:test /W:test /H:localhost /P:5959
```
![image](https://github.com/adrienlaws/m59-blakserv-docker/assets/4023541/85e5491e-bc25-43ec-bf8d-b448a8138a05)



Two ports `5959` and `9998` are mapped.  `5959` is used for the Meridian client to connect to, while `9998` is a maintenance port that you can use to administrate the server with limited capability.

You can use Putty to connect via a RAW TCP connection on port 998
To add a user when that terminal opens
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
