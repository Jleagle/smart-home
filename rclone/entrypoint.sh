#!/bin/sh

grep -q " /mnt/remote/nzbdav " /proc/mounts && fusermount3 -u -z /mnt/remote/nzbdav || true

# Notes on options:
# --allow-non-empty: Allow mounting over a directory that is not empty
# --allow-other: Allow other system users to access the mount
# --buffer-size=0: Avoid double-caching with VFS
# --cache-dir: Directory used for VFS caching
# --contimeout/--timeout: Adjust connection and I/O timeouts
# --dir-cache-time=20s: Time to cache directory listings (kept short for quick updates)
# --gid/--uid: Override the owner of the mounted files
# --links: Turn *.rclonelink into real symlinks
# --no-modtime: Do not read/write the modification time (improves performance)
# --poll-interval=0: Disable polling for remote changes
# --rc/--rc-addr/--rc-no-auth: Enable Remote Control API (unauthenticated on 5572)
# --tpslimit/--tpslimit-burst: Limit HTTP transactions per second to avoid API rate limits/bans
# --use-cookies: Avoid re-auth on every request
# --vfs-cache-mode=full: Cache all file reads and writes to disk
# --vfs-cache-max-size/age: Retain up to 100G of cached data for up to 1 week
# --vfs-read-ahead=512M: Pre-fetch up to 512M ahead to prevent buffering during playback
# --vfs-read-chunk-size...: Download files in fixed 32M chunks for efficient streaming
# --vfs-read-wait=20ms: Wait 20ms for sequential read before fetching more

exec rclone mount nzbdav: /mnt/remote/nzbdav \
  --allow-non-empty \
  --allow-other \
  --buffer-size=0 \
  --cache-dir=/cache \
  --contimeout=5s \
  --dir-cache-time=20s \
  --gid=1000 \
  --links \
  --no-modtime \
  --poll-interval=0 \
  --rc \
  --rc-addr=0.0.0.0:5572 \
  --rc-no-auth \
  --timeout=10s \
  --tpslimit-burst=10 \
  --tpslimit=10 \
  --uid=1000 \
  --use-cookies \
  --vfs-cache-max-age=1w \
  --vfs-cache-max-size=100G \
  --vfs-cache-mode=full \
  --vfs-read-ahead=512M \
  --vfs-read-chunk-size-limit=32M \
  --vfs-read-chunk-size=32M \
  --vfs-read-wait=20ms
