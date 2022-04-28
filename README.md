# docker-shogigui
This repository purpose is running shogi-gui.exe on docker container.

## Install dependencies
```sh
$ brew install socat
$ brew install caskroom/cask/brew-cask
$ brew install xquartz
```

## Build
```sh
docker build -t shogigui .
```

## Run
```sh
$ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
$ open -a xquartz
$ ip=$(ifconfig | grep -A10 en0 | grep 'inet ' | awk '{print $2}')
$ docker run --rm -e DISPLAY=${ip}:0 --name shogigui shogigui
```

## Fix
- 文字化け
- サウンド設定