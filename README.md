[English] Complete guide to DoH, DoT, DoQ DNS encryption configuration.

## Why DNS Encryption

Plain DNS (UDP 53) has three risks: DNS pollution, hijacking, privacy leakage.

## Supported Protocols

| Protocol | Transport | Port | Privacy | Speed |
|------|--------|------|--------|------|
| DoH | HTTPS/443 | 443 | High | Fast |
| DoT | TLS/853 | 853 | High | Fast |
| DoQ | QUIC/443 | 443 | High | Fastest |

Recommended Tools

- [Clash for Windows](https://clashforwindows.site/) - Most popular Clash GUI for Windows
- [ClashMI](https://clashmi.site/) - Lightweight multi-platform Clash client
- [FlClash](https://flclash.us/) - Modern proxy tool with multi-protocol support