# Broadcast Container

## Configuration

- `CHIME_PIN` or `BROWSER_URL`
  - if yuo use `CHIME_PIN`, `BROWSER_URL` is created automatically.
- `RTMP_URL`
  - Twitch example: `rtmp://live.twitch.tv/app/<stream key>`
  - YouTube Live example: `rtmp://a.rtmp.youtube.com/live2/<stream key>`

## How to use

```sh
docker run --rm -it \
    -e CHIME_PIN=1234567890 \
    -e RTMP_URL="rtmp://a.rtmp.youtube.com/live2/<stream key>" \
    mats16/broadcast
```
