node {

    stage('Checkout') {
        checkout scm 
    }

    stage('Create resource group') {
        withCredentials([azureServicePrincipal('AzureJenkins')]) {
            sh('ssh-keygen -q -t rsa -N "" -f ./id_rsa -y')
            sh('docker pull ghostd/talend:firsttry')
            sh('docker run -v /home/jenkins/jenkins_home/workspace/Talend-Remote-Engine:/root --env AZURE_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID --env AZURE_CLIENT_ID=$AZURE_CLIENT_ID --env AZURE_SECRET=$AZURE_CLIENT_SECRET --env AZURE_TENANT=$AZURE_TENANT_ID --rm ghostd/talend:firsttry ansible-playbook /root/createVM.yaml')
            sh('docker run -v /home/jenkins/.ssh:/root/.ssh -v /home/jenkins/jenkins_home/workspace/Talend-Remote-Engine:/root --env AZURE_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID --env AZURE_CLIENT_ID=$AZURE_CLIENT_ID --env AZURE_SECRET=$AZURE_CLIENT_SECRET --env AZURE_TENANT=$AZURE_TENANT_ID --rm ghostd/talend:firsttry ansible-playbook -i /root/azure_rm.yaml -u azureuser --private-key /root/.ssh/id_rsa /root/ansibleRemote.yaml')
            
        }   
    }
}



