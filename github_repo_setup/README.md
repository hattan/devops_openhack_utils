# Copy Repo Utility

The [copy_repo.sh](./copy_repo.sh) script can be used to copy the DevOps OpenHack Teams repo to a new repository that you create.

You might ask, why can't I just fork the repo? Well you can, the issue with forking arises when it comes time to create a pull request from your feature branch to your master branch. The default behavior is to open a pull request back to Azure-Samples/openhack-devops-team which many teams have done in past OpenHacks.

By copying the repo, you get a fresh repository that contains all branches, but is not linked via a fork to Azure-Samples.

## How to use the script

* Clone this repo and navitate to the github_repo_setup folder.
* On GitHub, create a new repository and note the .git url. This is your target url.
* Invoke the approriate script:
  * BASH/ZSH : copy_repo.sh -t <new repo .git url>
  * Powershell: copy_repo.ps1 -target <new repo .git url>

## What the script does

This script will perform the following actions:

* Clone Azure-Samples/openhack-devops-team to a folder caled devops-oh (in the same path as the script itself)
* Fetch and pull all branches in the repo.
* Change the remote url to your new repo.
* Push all branches to target repo.

