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

`ntfy` serves push notifications at `https://ntfy.jimeagle.com`. Anyone can subscribe to the `movies` topic; every other topic is closed.

Publishing needs a user. Create one once, give it write access to the topic and generate its access token:

```bash
docker exec -it ntfy ntfy user add radarr
docker exec ntfy ntfy access radarr movies rw
docker exec ntfy ntfy token add --label=radarr radarr
```

Use the token in Radarr under Settings → Connect → ntfy, with server URL `http://ntfy` and topic `movies`.
