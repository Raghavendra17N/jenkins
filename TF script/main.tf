terraform {

    required_providers {
      google = {
          source                = "hashicorp/google"
          version               =  "3.80.0"
      }
    }  
}

provider "google" {

    credentials                 =  file("../key.json")
    region                      =  var.region
    project                     =  var.project
}

data "google_compute_image" "jenkins-os" {

    name                        =   var.image_name
    project                     =   var.image_project
}
resource "google_compute_disk" "jenkins-disk" {

    name                        =   var.disk_name
    type                        =   var.disk_type
    zone                        =   var.zone
    size                        =   var.disk_size
    labels                      =   var.labels
}

resource "google_compute_instance" "jenkins-server" {

    name                        =   var.name
    machine_type                =   var.machine_type
    labels                      =   var.labels
    tags                        =   var.tags
    boot_disk {

            initialize_params{
                image           =   data.google_compute_image.jenkins-os.self_link
            }
    }
    dynamic "attached_disk" {

        for_each                =   var.attached_disk
        content {

            mode                =   attached_disk.value["mode"]
            source              =   google_compute_disk.jenkins-disk.id 
        }
    }
    network_interface   {

        network                 =   var.network
        #if external IP not required remove below block
        access_config       {
        }
    }
    scheduling{

        preemptible             =   var.preemptible
    }
    service_accont  {

        scope                   =   var.scope
    }

}