shopt -s expand_aliases

#AKS LOGIN
name=$(az aks list --query '[].name' --out tsv)
rg=$(az aks list --query '[].resourceGroup' --out tsv)

az aks get-credentials -n $name -g $rg

#HELM SETUP
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.14.3-linux-amd64.tar.gz

if [ ! -d "./helm" ]; then
        echo 'creating helm directory'
        mkdir helm
fi

tar -xvf helm-v2.14.3-linux-amd64.tar.gz -C ./helm
rm helm-v2.14.3-linux-amd64.tar.gz

path=$(pwd)

echo alias helm="$path/helm/linux-amd64/helm" >> ~/.bash_aliases
exec bash


