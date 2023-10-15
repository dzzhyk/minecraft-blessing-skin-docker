# blessing skin docker

blessing skin docker镜像，仅50MB大小，目前提供6.0.0版本

## Usage

### 使用已有镜像

```shell
$ docker run -d --name blessing-skin -p 80:8080 -v ~/blessing-skin:/data dzzhyk/minecraft-blessing-skin-docker:6.0.0
```

- `/data` 是容器内映射的目录，可以共享一些文件，比如sqlite的db文件

### 手动构建镜像

下载blessing-skin-server-x.x.x.zip [Github Release](https://github.com/bs-community/blessing-skin-server/releases)

```shell
$ unzip -q ./blessing-skin-server-6.0.2.zip -d blessing-skin-server
$ docker build -t dzzhyk/minecraft-blessing-skin-docker:6.0.2 .
```
