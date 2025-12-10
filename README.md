For cluster:

cd eks

mfa-login.sh - automates entering MFA code, obtaining temporary AWS credentials.

chmod +x mfa-login.sh - before launch.

./mfa-login.sh 

terraform init, plan, apply 

aws eks --region eu-central-1 update-kubeconfig --name danit

use outputs argo_url
user - admin
password 
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d && echo
