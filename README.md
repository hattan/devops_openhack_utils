# devops_openhack_utils
helper scripts for devops openhack

To set up kubectl and downgrade helm to 2.12.3 

```curl -L https://raw.githubusercontent.com/hattan/devops_openhack_utils/master/setup.sh | bash```

If you only want to set up the kubectl login for AKS

```curl -L https://raw.githubusercontent.com/hattan/devops_openhack_utils/master/ask_login.sh | bash```

Cleanup

```curl -L https://raw.githubusercontent.com/hattan/devops_openhack_utils/master/cleanup.sh | bash```

## Note - the cleanup.sh file remove .bash_aliases. If you have other aliases you need to keep, do not invoke cleanup.sh!
