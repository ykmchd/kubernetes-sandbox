```
❯ k exec pods/busybox1 -it -- sh
/ # hostname
busybox-1.default-subdomain.default.svc.cluster.local
/ # hostname -f
busybox-1.default-subdomain.default.svc.cluster.local
/ # 
```
