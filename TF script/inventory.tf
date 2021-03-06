resource "null_resource" "empty_inventory" {
    provisioner "local-exec" {
        command = "cat /dev/null >> ../ansible-playbook/inventory ; echo [jenkins_vm] >> ../ansible-playbook/inventory"
    }
    depends_on  = [google_compute_instance.jenkins-server,
    ]
}

resource "null_resource" "jenkins-IP" {
    triggers     =   {
        order   =   "${null_resource.empty_inventory.id}"
    }

    provisioner "local-exec"{

        command = "echo ${google_compute_instance.jenkins-server.name} ansible_host=${google_compute_instance.jenkins-server.network_interface.0.access_config.0.nat_ip} ansible_python_interpreter=/usr/bin/python3 >> ../ansible-playbook/inventory"
    }
}

