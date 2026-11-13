# smart-home

## Host Tuning

### Enable TCP BBR

Enable TCP BBR congestion control on the host to improve streaming throughput over Wi-Fi:

```bash
echo -e "net.core.default_qdisc=fq\nnet.ipv4.tcp_congestion_control=bbr" | sudo tee /etc/sysctl.d/99-bbr.conf
sudo sysctl --system
```

Verify it is active:

```bash
sysctl net.ipv4.tcp_congestion_control net.core.default_qdisc
```

## Fluent Bit → Google Cloud Logging

`fluent-bit` tails every container's json-file log and ships it to Cloud Logging, with one log name per container.

Create a service account with the **Logs Writer** role (`roles/logging.logWriter`), download a JSON key and place it at `~/FluentBit/google.json`. Logs appear under the key's project in Logs Explorer as `logName="projects/<project>/logs/<container>"`.

## ntfy

Generate Web Push keys for closed-tab notifications:

```bash
docker run --rm binwiederhier/ntfy:latest webpush keys
```

Set `NTFY_WEB_PUSH_PUBLIC_KEY` and `NTFY_WEB_PUSH_PRIVATE_KEY` in the environment.

Create a publishing user for Node-RED, grant write access, and generate an access token:

```bash
docker exec -it ntfy ntfy user add nodered
docker exec ntfy ntfy access nodered movies rw
docker exec ntfy ntfy access nodered shows rw
docker exec ntfy ntfy token add --label=nodered nodered
```

Publish from Node-RED via HTTP POST to `http://ntfy/movies` or `http://ntfy/shows` with header `Authorization: Bearer <token>`.

