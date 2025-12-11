output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.danit.name
}

output "eks_cluster_region" {
  description = "AWS region where the EKS cluster is deployed"
  value       = var.region
}

output "argocd_url" {
  description = "ArgoCD ingress URL"
  value       = "http://${local.argocd_domain}"
}

output "ingress_nginx_hostname" {
  value = data.kubernetes_service.nginx_ingress.status[0].load_balancer[0].ingress[0].hostname
  description = "Public hostname of the ingress-nginx LoadBalancer"
}

