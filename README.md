# DNS over HTTPS (DoH) 完整指南

DoH 将 DNS 查询封装在 HTTPS 流量中，防止 DNS 劫持和监控。

## DoH vs 传统 DNS

| 对比 | 传统 DNS (UDP 53) | DoH (HTTPS 443) |
|------|------------------|----------------|
| 加密 | 明文 | TLS 加密 |
| 防劫持 | No | Yes |
| 抗封锁 | No | Yes |

## DoH 服务推荐

| 提供商 | 地址 | 说明 |
|--------|------|------|
| Google | `https://dns.google/dns-query` | 全球节点 |
| Cloudflare | `https://cloudflare-dns.com/dns-query` | 1.1.1.1 |
| 阿里 | `https://doh.pub/dns-query` | 国内快 |

## 在 Clash 中使用 DoH

```yaml
dns:
  enable: true
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip
  nameserver:
    - https://doh.pub/dns-query
  fallback:
    - https://1.1.1.1/dns-query
  fallback-filter:
    geoip: true
    geoip-code: CN
```

## 在浏览器中直接使用

### Chrome

地址栏输入：`chrome://settings/security`

启用"使用安全 DNS"，选择自定义提供商：`https://dns.google/dns-query`

### Firefox

设置 > 隐私与安全 > DNS > 启用 DNS over HTTPS。

## 常见问题

**DoH 速度慢？** 国内建议使用阿里 DoH (`doh.pub`)。

---

推荐工具：

- [Clash for Windows](https://clashforwindows.site/)
- [ClashMI](https://clashmi.site/)
- [FlClash](https://flclash.us/)
