# m59-blakserv-docker


Run your blakserv Meridian 59 server by executing this command

```
docker run -dit -p 5959:5959 -p 9998:9998 --rm blakserv-1
```

This maps the two ports #5959 and #9998

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
