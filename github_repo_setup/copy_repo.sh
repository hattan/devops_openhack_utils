
#!/usr/bin/env bash

me=`basename "$0"`
now=$(date +'%m.%d.%Y')

usage(){
  echo "usage: $me [-t | --target]  [-h | -help]"
  echo "    options:"
  echo "        -t | --target <target repo>    (required) Full git url of the destination/target repo."  
  echo "        -h | --help                    (optional) Show help text. This :) " 
}

origin_repo="https://github.com/Azure-Samples/openhack-devops-team.git";
target_repo="";

while [ "$1" != "" ]; do
    case $1 in
        -t | --target )         shift
                                target_repo=$1
                                ;;                                                                                           
        -h | --help )           usage
                                exit
    esac
    shift
done

if [ -z "$target_repo" ]
then
  echo "Target (destion repo) is required!"
  usage
  exit 1
fi

git clone $origin_repo devops_oh
git --git-dir=devops_oh/.git branch -r | grep -v '\->' | while read remote; do git --git-dir=devops_oh/.git branch --track "${remote#origin/}" "$remote"; done
git --git-dir=devops_oh/.git fetch --all
git --git-dir=devops_oh/.git pull --all
git --git-dir=devops_oh/.git remote set-url origin $target_repo
git --git-dir=devops_oh/.git push --all
