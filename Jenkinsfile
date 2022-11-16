node {

    stage('Checkout') {
        checkout scm 
    }

    stage('Create resource group') {
        withCredentials([azureServicePrincipal('AzureJenkins')]) {
            sh('ssh-keygen -q -t rsa -N "" -f ./id_rsa <<<y 2>&1 >/dev/null')
            sh('docker build -t docker_ansible .')
            sh('docker run --env AZURE_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID --env AZURE_CLIENT_ID=$AZURE_CLIENT_ID --env AZURE_SECRET=$AZURE_CLIENT_SECRET --env AZURE_TENANT=$AZURE_TENANT_ID --rm -it docker_ansible ansible localhost -m azure_rm_resourcegroup -a "name=myResourceGroup location=eastus"')
        }   
    }
}


