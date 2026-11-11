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
