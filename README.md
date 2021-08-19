# Jenkins Setup on GCP
## Setup Jenkins server on GCP using Terraform and Ansible


#### Follow below steps to for setting up

1] Create the Ansible user and place the ssh key in GCP meta-data ssh keys.

2] Create the service account key file as key.json and place it the repo folder.

3] Run the below commands 
```
git clone "https://github.com/Raghavendra17N/jenkins.git"
sh -x Deploy.sh
```

### Prerequisite Softwares on WorkSpace[local machine]
- Ansible
- Terraform
