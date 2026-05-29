# VPS Benchmark Tool 48n19p

A comprehensive one-click VPS performance benchmark script. Test your server's CPU, disk I/O, network speed, and proxy compatibility in seconds.

## Usage

```bash
# Full benchmark
bash benchmark.sh

# Quick test (CPU + network only)
bash benchmark.sh --quick

# Save results to file
bash benchmark.sh --output results.txt
```

## What It Tests

| Test | Description |
|------|-------------|
| CPU | Single/multi-core performance via sysbench |
| Disk | I/O read/write speed with fio |
| Network | Download speed from global CDN nodes |
| Latency | Ping to major regions (US, EU, Asia) |
| Proxy | Clash/V2Ray compatibility check |

## Sample Output

```
=== VPS Benchmark Report ===
CPU Model: AMD EPYC 7763
CPU Cores: 2 @ 2445MHz
Disk Speed: 480 MB/s (seq read)
Network (Download): 850 Mbps (Cloudflare)
Latency: US-West 12ms | EU 180ms | Asia 45ms
Proxy Compatible: YES (Clash/V2Ray/Trojan)
```

## Recommended Tools

- [Clash for Windows](https://clashforwindows.site/) - Best proxy client for Windows/Mac/Linux
- [Clash for Windows](https://clashforwindows.site/) - Most popular Clash GUI
- [ClashMI](https://clashmi.site/) - Lightweight Clash client
- [FlClash](https://flclash.us/) - Modern proxy tool

## Recommended VPS for Proxy

For best proxy performance, choose VPS with:
- Low latency to your region
- At least 1Gbps network
- Clean IP (not blocked by streaming services)

## License

MIT License
