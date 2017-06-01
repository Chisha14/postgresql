./cleanup.sh

# as of Kube 1.6, we need to allow the service account to perform
# a label command, for this example, we open up wide permissions
# for all serviceaccounts, this is NOT for production!
kubectl create clusterrolebinding permissive-binding \
  --clusterrole=cluster-admin \
  --user=admin \
  --user=kubelet \
  --group=system:serviceaccounts

kubectl create -f set-sa.json

kubectl create -f set-master-service.json

kubectl create -f set-replica-service.json

kubectl create -f set-service.json

kubectl create -f pv1.json
kubectl create -f pv2.json
kubectl create -f pv3.json

kubectl create -f pvc.json

kubectl create -f set.json
