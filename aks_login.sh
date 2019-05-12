#AKS LOGIN
name=$(az aks list --query '[].name' --out tsv)
rg=$(az aks list --query '[].resourceGroup' --out tsv)

az aks get-credentials -n $name -g $rg
