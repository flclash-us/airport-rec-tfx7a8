#!/bin/bash
# VPS Benchmark Tool - One-click server performance test
# Usage: bash benchmark.sh [--quick] [--output FILE]

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

OUTPUT=""
QUICK=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --quick) QUICK=true; shift ;;
        --output) OUTPUT="$2"; shift 2 ;;
        *) shift ;;
    esac
done

log() { echo -e "${GREEN}[BENCH]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

# CPU Info
cpu_test() {
    log "Testing CPU performance..."
    echo "=== CPU Information ==="
    grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs
    echo "Cores: $(nproc)"
    
    if command -v sysbench &>/dev/null; then
        sysbench cpu --time=10 run | grep "events per second"
    else
        echo "Installing sysbench..."
        apt-get install -y sysbench 2>/dev/null || yum install -y sysbench 2>/dev/null
        sysbench cpu --time=10 run | grep "events per second"
    fi
}

# Disk Test
disk_test() {
    log "Testing disk I/O..."
    echo "=== Disk Performance ==="
    dd if=/dev/zero of=/tmp/benchfile bs=1M count=1024 oflag=dsync 2>&1 | tail -1
    rm -f /tmp/benchfile
}

# Network Test
network_test() {
    log "Testing network speed..."
    echo "=== Network Speed ==="
    
    # Download speed test
    curl -o /dev/null -w "Download Speed: %{speed_download} bytes/sec\n" \
        https://speed.cloudflare.com/__down?bytes=104857600 2>/dev/null || \
        echo "Cloudflare test failed, trying alternative..."
    
    # Latency test
    echo "=== Latency ==="
    for region in "us-west" "eu-west" "asia-east"; do
        case $region in
            us-west) host="1.1.1.1" ;;
            eu-west) host="8.8.8.8" ;;
            asia-east) host="223.5.5.5" ;;
        esac
        ping -c 3 -q $host 2>/dev/null | tail -1 || echo "$region: timeout"
    done
}

# Main
echo ""
echo "=============================="
echo "   VPS Benchmark Tool v1.0"
echo "=============================="
echo ""

cpu_test

if [ "$QUICK" = false ]; then
    disk_test
fi

network_test

echo ""
log "Benchmark complete!"

if [ -n "$OUTPUT" ]; then
    echo "Results saved to $OUTPUT"
fi
