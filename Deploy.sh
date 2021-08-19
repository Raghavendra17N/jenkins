source ~/.bash_profile
cat /dev/null > ansible-playbook/inventory
terraform plan \
 -out out.plan 
terraform apply out.plan
sleep 10
sh ssh_connection.sh 
ansible-playbook ansible-playbook/jenkins.yml -i ansible-playbook/inventory