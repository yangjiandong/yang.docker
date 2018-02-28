fastdfs
---

[docker for fastdfs tracker](https://github.com/phinexdaz/fdfs_tracker)


## Run as a tracker

```
docker run -d --name tracker -v ~/data/fastdfs/tracker:/data/tracker -p 22122:22122 fdfs_tracker
```

- port: tracker default port is 22122
- base_path: map the path "/data/tracker"

## Run as a storage

```
docker run -d --name storage -v ~/data/fastdfs/storage:/data/storage --link tracker:tracker -p 80:80 -e TRACKER=tracker fdfs_storage
```

- port: nginx default port is 80
- base_path and store_path0: map the path "/data/storage"
- TRACKER: tracker container's name

## Log

- docker logs tracker
- docker logs storage