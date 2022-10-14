# ASM Module

module "asm" {
  source                = "terraform-google-modules/kubernetes-engine/google//modules/asm"
  project_id            = "my-project-id"
  cluster_name          = "my-cluster-name"
  location              = module.gke.location
  cluster_endpoint      = module.gke.endpoint
  enable_all            = false
  enable_cluster_roles  = true
  enable_cluster_labels = false
  enable_gcp_apis       = false
  enable_gcp_iam_roles  = true
  enable_gcp_components = true
  enable_registration   = false
  managed_control_plane = false
  options               = ["envoy-access-log,egressgateways"]
  custom_overlays       = ["./custom_ingress_gateway.yaml"]
  skip_validation       = true
  outdir                = "./${module.gke.name}-outdir-${var.asm_version}"
}