# Jenkins Demo Setup

## Pre-requisities:

1. Installed ![azcli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
2. Authenticated azcli
3. Set the subscription to the targeted subscription for deployment with azcli
    * `az account set --subscription <mysubscription>`

## Process

1. Check that you have an ssh public key `cat ~/.ssh/id_rsa.pub`<br>
    * If there is no file then run `ssh-keygen` to generate one<br>
2. (optional) Run `curl ifconfig.me` and record your ip<br>
3. (optional) Overwrite the `may_ip` variable in `demo.tfvars`<br>
4. Run `terraform init`<br>
5. Run `terraform apply -var-file ./demo.tfvars --auto-approve`<br>
6. Record the public ip frm the output<br>
    * If there is no output then run `terraform apply -var-file ./demo.tfvars --auto-approve`<br>
    NOTE: THIS SEEMS TO BE REQUIRED CURRENTLY<br>
7. Log into the instance wit `ssh azureuser@<public_ip_address_here>`<br>
8. run `sudo tail -f /var/log/cloud-init-output.log`<br>
9. Stretch<br>
10. Once the log finishes record the GUID for the Jenkins admin initial password<br>
![](./images/cloud_init_complete.png)<br>
11. Go to `http://<public_ip_address_here>:8080`<br>
12. Unlock Jenkins with GUID<br>
![](./images/unlock_jenkins.png)<br>
13. Install suggested plugins<br>
![](./images/install_plugins.png)<br>
14. Get coffee<br>
15. Skip user creation and continue as admin<br>
16. Select `Not now` for instance configuration<br>
17. Start using Jenkins<br>
![](./images/start_using_jenkins.png)<br>
18. Restart jenkins from the instance `sudo systemctl restart jenkins`<br>
19. Log back into Jenkins with admin and the initial password
20. Add the credentials to Jenkins<br>
    a. Manage Jenkins<br>
    ![](./images/manage_jenkins.png)<br>
    b. Manage Credentials<br>
    ![](./images/manage_creds.png)<br>
    c. System<br>
    ![](./images/system_credentials.png)<br>
    d. Global Credentials<br>
    ![](./images/global_creds.png)<br>
    e. Add Credentials<br>
    ![](./images/add_creds.png)
21. Go back to the Jenkins Dashboard<br>
22. New Item<br>
![](./images/new_item.png)<br>
23. Add pipeline project with name `wiz-demo-pipeline`<br>
![](./images/pipeline_project.png)<br>
24. Add the pipeline file data ![jenkins_pipeline](./jenkins_pipeline) to the pipeline steps<br>
25. Run the pipeline<br>
26. Review output<br>
27. Add Wiz CICD Policies to the pipeline scans to make the pipeline fail for vulns.. then iac<br>
