# ft_server


## Build
```
docker build -t ft_server .
```

## Run
### Without autoindex
```
docker run --name petit_poney -it -p 80:80 -p 443:443 ft_server
```

### With autoindex
```
docker run --name petit_poney -e AUTOINDEX=on -it -p 80:80 -p 443:443 ft_server
```
