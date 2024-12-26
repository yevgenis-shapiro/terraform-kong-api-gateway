###-kong
resource "helm_release" "kong" {
  name       = "kong"

  repository = "https://charts.konghq.com"
  chart      = "kong"
  create_namespace = true
  wait             = true
  depends_on = [kind_cluster.default]

  set {
    name  = "ingressController.enabled"
    value = "true"
  }

  set {
    name  = "admin.enabled"
    value = "true"
  }

  set {
    name  = "admin.http.enabled"
    value = "true"
  }
  
  set {
    name  = "proxy.enabled"
    value = "true"
  }
  
  set {
    name  = "proxy.type"
    value = "LoadBalancer"
  }

  set {
    name  = "ingressController.installCRDs"
    value = "false"
  }
 
}
