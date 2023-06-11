# blessing skin docker

blessing skin docker镜像

## Usage

### 使用已有镜像

```shell
$ docker run -d --name blessing-skin -p 80:8080 -v ~/blessing-skin:/data dzzhyk/minecraft-blessing-skin-docker:6.0.0
```

- `/data` 是容器内映射的目录，可以共享一些文件，比如sqlite的db文件

### 手动构建镜像

1. 下载blessing-skin-server-x.x.x.zip [Github Release](https://github.com/bs-community/blessing-skin-server/releases)
2. 放置到当前项目目录下，修改[build_image.sh](build_image.sh)中的内容
3. 执行脚本构建
