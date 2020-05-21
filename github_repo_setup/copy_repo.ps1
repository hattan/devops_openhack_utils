param(
  [Parameter(Mandatory=$true, HelpMessage="Full git url of the destination repo")]
  [string]$target
)

$me=$($MyInvocation.MyCommand.Name)
$origin_repo="https://github.com/Azure-Samples/openhack-devops-team.git";

git clone $origin_repo devops_oh
git --git-dir=devops_oh/.git branch -r | findstr /v "\->" |  ForEach-Object {$br=$_.TrimStart(); git --git-dir=devops_oh/.git branch --track $br.TrimStart("origin/") $br}
git --git-dir=devops_oh/.git fetch --all
git --git-dir=devops_oh/.git pull --all
git --git-dir=devops_oh/.git remote set-url origin $target
git --git-dir=devops_oh/.git push --all