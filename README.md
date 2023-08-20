# m59-blakserv-docker


Run your blakserv Meridian 59 server by executing this command

```
docker run -dit -p 5959:5959 -p 9998:9998 --rm blakserv-1
```
This will run in the background as a "detached" container.  You can log into the terminal by opening Docker Desktop.  Upon exiting nothing will be saved.  This container is intended for testing.

You can then use your locally built Windows client to connect to localhost on port `5959` 


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
