run curl image
```
❯ k run curl --image=curlimages/curl -it --rm -- sh
```

pods
```
❯ k get po -o wide
NAME       READY   STATUS    RESTARTS   AGE     IP           NODE             NOMINATED NODE   READINESS GATES
busybox1   1/1     Running   0          8m36s   10.244.1.3   sandbox-worker   <none>           <none>
busybox2   1/1     Running   0          8m36s   10.244.1.2   sandbox-worker   <none>           <none>
curl       1/1     Running   0          5m45s   10.244.1.4   sandbox-worker   <none>           <none>
```

service
```
❯ k get svc -o wide            
NAME                TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)    AGE     SELECTOR
default-subdomain   ClusterIP   None         <none>        1234/TCP   8m41s   name=busybox
kubernetes          ClusterIP   10.96.0.1    <none>        443/TCP    25h     <none>
```

ipaddress
```
~ $ nslookup 10-244-1-3.default.pod.cluster.local 
Server:         10.96.0.10
Address:        10.96.0.10:53


Name:   10-244-1-3.default.pod.cluster.local
Address: 10.244.1.3

~ $ 
```

hostname and subdomain
```
~ $ nslookup busybox-1.default-subdomain.default.svc.cluster.local
Server:         10.96.0.10
Address:        10.96.0.10:53


Name:   busybox-1.default-subdomain.default.svc.cluster.local
Address: 10.244.1.3

~ $ 
~ $ nslookup busybox-2.default-subdomain.default.svc.cluster.local
Server:         10.96.0.10
Address:        10.96.0.10:53


Name:   busybox-2.default-subdomain.default.svc.cluster.local
Address: 10.244.1.2

~ $ 
```

service
```
~ $ nslookup default-subdomain.default.svc.cluster.local
Server:         10.96.0.10
Address:        10.96.0.10:53


Name:   default-subdomain.default.svc.cluster.local
Address: 10.244.1.2
Name:   default-subdomain.default.svc.cluster.local
Address: 10.244.1.3

~ $ 
```
