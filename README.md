# jenkins_demo

1. Check that you have an ssh public key `cat ~/.ssh/id_rsa.pub`
    * If there is no file then run `ssh-keygen` to generate one
2. (optional) Run `curl ifconfig.me` and record your ip
3. (optional) Overwrite the `may_ip` variable in `demo.tfvars`
4. Run `terraform init`
5. Run `terraform apply -var-file ./demo.tfvars --auto-approve`
6. Record the public ip frm the output
    * If there is no output then run `terraform apply -var-file ./demo.tfvars --auto-approve`
7. Log into the instance wit `ssh azureuser@<public_ip_address_here>`
8. run `sudo tail -f /var/log/cloud-init-output.log`
9. Stretch
10. Once the log finishes grab the GUID for the Jenkins admin initial password
[](./images/cloud_init_complete.png)
11. Go to `http://<public_ip_address_here>:8080`
12. Unlock Jenkins with GUID
[](./images/unlock_jenkins.png)
13. Install suggested plugins
[](./images/install_plugins.png)
14. Get coffee
15. Skip user creation and continue as admin
16. Select `Not now` for instance configuration
17. Start using Jenkins
[](./images/start_using_jenkins.png)
18. Run through the docs to configure the jenkins integration for wiz-cli