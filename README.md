# ft_server


## Build
```
docker build -t ft_server .
```

## Run
### With autoindex (default)
```
docker run --name petit_poney -it -p 80:80 -p 443:443 ft_server
```

### Without autoindex
```
docker run --name petit_poney -e AUTOINDEX=off -it -p 80:80 -p 443:443 ft_server
```
