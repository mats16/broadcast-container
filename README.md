# Broadcast Container

## Configuration

- `BROWSER_URL`
- `RTMP_URL`
  - Twitch example: `rtmp://live.twitch.tv/app/<stream key>`
  - YouTube Live example: `rtmp://a.rtmp.youtube.com/live2/<stream key>`

## How to use

```sh
docker run --rm -it \
    -e BROWSER_URL="https://app.chime.aws/portal/<your Meeting ID here>" \
    -e RTMP_URL="rtmp://a.rtmp.youtube.com/live2/<stream key>" \
    mats16/broadcast
```
