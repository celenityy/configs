#!/bin/sh

echo 1 > /proc/sys/fs/protected_symlinks
echo 1 > /proc/sys/fs/protected_hardlinks
echo "|/bin/false" > /proc/sys/kernel/core_pattern
echo 0 > /proc/sys/fs/suid_dumpable
echo 1 > /proc/sys/kernel/dmesg_restrict
echo 2 > /proc/sys/kernel/kptr_restrict
echo 0 > /proc/sys/kernel/sysrq

echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/bcmsw/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/bcmswlpbk0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/br0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/dpsta/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth1/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth2/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth3/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth4/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth5/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth6/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/ifb0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/ifb1/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/imq0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/imq1/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/imq2/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/ip6_vti0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/ip6gre0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/ip6tn10/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/ip_vti10/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/lo/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/sit0/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/spu_ds_dummy/rp_filter

echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv6/conf/all/forwarding

echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

echo 1 > /proc/sys/net/ipv4/tcp_rfc1337

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

echo 1 > /proc/sys/net/ipv4/tcp_timestamps

echo 0 > /proc/sys/net/ipv4/tcp_sack
echo 0 > /proc/sys/net/ipv4/tcp_dsack

echo 2 > /proc/sys/kernel/randomize_va_space

echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 1 > /proc/sys/net/ipv4/conf/bcmsw/log_martians
echo 1 > /proc/sys/net/ipv4/conf/bcmswlpbk0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/br0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/default/log_martians
echo 1 > /proc/sys/net/ipv4/conf/dpsta/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth1/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth2/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth3/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth4/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth5/log_martians
echo 1 > /proc/sys/net/ipv4/conf/eth6/log_martians
echo 1 > /proc/sys/net/ipv4/conf/ifb0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/ifb1/log_martians
echo 1 > /proc/sys/net/ipv4/conf/imq0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/imq1/log_martians
echo 1 > /proc/sys/net/ipv4/conf/imq2/log_martians
echo 1 > /proc/sys/net/ipv4/conf/ip6_vti0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/ip6gre0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/ip6tn10/log_martians
echo 1 > /proc/sys/net/ipv4/conf/ip_vti10/log_martians
echo 1 > /proc/sys/net/ipv4/conf/lo/log_martians
echo 1 > /proc/sys/net/ipv4/conf/sit0/log_martians
echo 1 > /proc/sys/net/ipv4/conf/spu_ds_dummy/log_martians
