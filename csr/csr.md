generate a user.key with 2048bit
```
openssl genrsa -out user.key 2048
```

According to the user.key generate a user.csr
```
openssl req -new -key user.key -subj "/CN=user" -out user.csr
```

approve csr
```
cat <<EOF > user.yaml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: user
spec:
  request: $(cat user.csr | base64 -w 0 | tr -d '\n')
  signerName: "kubernetes.io/kube-apiserver-client"
  usages:
  - digital signature
  - key encipherment
  - client auth
EOF
kubectl apply -f user.yaml
kubectl certificate approve user
```

get certificate
```
kubectl get csr user -o jsonpath='{.status.certificate}' | base64 -d > user.crt
```

create clusterrolebindigns
```
kubectl create clusterrolebinding user-cluster-admin --clusterrole=cluster-admin --user=user --dry-run=client -o yaml > crb.yaml
kubectl apply -f crb.yaml
```

setting kubectl
```
kubectl config set-credentials user --client-certificate=user.crt --client-key=user.key --embed-certs=t
rue
kubectl config set-context kind-sandbox-user --cluster=kind-sandbox --user=user
ubernetes-sandbox/csr on  main [?] on ☁️  ykmchd@gmail.com(us-west1) 
k config use-context kind-sandbox-user 
```
