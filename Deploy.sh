source ~/.bash_profile
cat /dev/null > ansible-playbook/inventory
cd TF\ script/;
terraform init
terraform plan \
 -out out.plan 
terraform apply out.plan
sleep 10
cd ../;
sh ssh_connection.sh 
sudo su raghu -c "ansible-playbook ansible-playbook/jenkins.yml -i ansible-playbook/inventory"