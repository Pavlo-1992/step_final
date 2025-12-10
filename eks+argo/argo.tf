data "aws_route53_zone" "zone" {
  name         = var.zone_name
  private_zone = false
}

locals {
  argocd_domain = "argocd.danit.${var.zone_name}"
}

resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.6"

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = local.argocd_domain
  }

  set {
    name  = "server.ingress.https"
    value = "false"
  }

  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }

  depends_on = [module.eks, helm_release.nginx_ingress]
}
