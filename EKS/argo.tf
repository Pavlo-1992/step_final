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
    value = "argocd.${var.name}.devops9.test-danit.com"
  }

  set {
    name  = "server.ingress.https"
    value = "false"
  }

  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }
}
