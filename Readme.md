# The developers LDAP server
Minimal LDAP server backed by a json file for development and probably testing


## Usage example

### From console
These are the default CLI options

```console
$ ./devldap -d mydata.json -l 127.0.0.1:1234
```
The server stays in foreground and logs what is happening.

### Via docker

Server is also available via docker - by default it will listen on `0.0.0.0:389`

```
docker run -p 389:389 patrickjahns/devldap 
```

It is possible to pass the cli options to the container

```
docker run -p 10389:10389 patrickjahns/devldap  -t 127.0.0.1:10389 -d mydata.json
```

It is also possible to provide a different data.json via docker volumes

```
docker run -v $PWD/data-ad-multi-base-dn.json:/data.json -p 10389:10389 patrickjahns/devldap 
```


## Kudos
* https://github.com/vjeantet/ldapserver
