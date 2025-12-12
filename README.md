For cluster:

cd eks+argo/

mfa-login.sh - automates entering MFA code, obtaining temporary AWS credentials.

chmod +x mfa-login.sh - before launch.

eval $(./mfa-login.sh)

If not create, create dynamodb

aws dynamodb create-table \
  --table-name lock-tf-eks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST


terraform init, plan, apply 

aws eks --region eu-central-1 update-kubeconfig --name danit

wait 10 min!!!!


in root directory 
kubectl apply -f k8s/

Optional

use outputs argo_url

user - admin
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d && echo

