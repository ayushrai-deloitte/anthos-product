

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

data "google_client_config" "default" {}

module "asm" {
  source            = "terraform-google-modules/kubernetes-engine/google//modules/asm"
  project_id        = var.project_id
  cluster_name      = module.gke.name
  cluster_location  = module.gke.location
  enable_cni        = true
}


module "gke" {
#...
  cluster_resource_labels = { "mesh_id" : "proj-${data.google_project.project.number}" }
#...
}