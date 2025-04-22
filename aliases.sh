alias c=clear

alias wireshark=Wireshark

alias pdftk='docker run --rm --volume $(pwd):/work pdftk/pdftk:latest'
alias b64="pbpaste | base64 | tee >(pbcopy)"
alias b64d="pbpaste | base64 -d | tee >(pbcopy)"
alias ascii="echo -e \$(pbpaste)"
alias json="pbpaste | fx"
dir() {
  mkdir -p $1
  cd $1
}

# GH
alias git-up="git fetch --all -p; git fetch origin master:master"
alias pr_new="~/dev/scripts/create-branch-and-pull-request.sh"
alias pr="gh pr view -w"
alias prn="gh pr view --json number --jq  '.number' | cat"

# env0
alias e0='cd ~/dev/env0'
alias ui="cd ~/dev/env0/frontend;pnpm start"
alias fe=ui
alias e2e="cd ~/dev/env0/e2e;pnpm open"
alias shag-in-pr="e0;./services/deployment-service/kubernetes/prepare-pr-env-for-k8s-agent.sh pr\$(prn)"
alias shag-in-pr-values="e0;./services/deployment-service/kubernetes/download-values-for-k8s-agent.sh pr\$(prn)"
alias pr_seed='open "https://console.seed.run/env0/Services/activity/stages/pr$(prn)"'
alias pr_e0='open "http://pr$(prn).dev.env0.com"'


alias my-ip='curl ipv4.icanhazip.com'

alias dr="docker run -it --rm"
alias k=kubectl
k-exec() {
  k exec -it $1 -- bash
}

# aws
alias a-id="aws sts get-caller-identity"

a() {
  if ! a-id &> /dev/null; then
    aws sso login --profile login
  fi
}

a-cred() {
  asp;
  eval $(aws configure export-credentials --profile $1 --format env)
}

a-reset() {
   asp;
   unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; unset AWS_SESSION_TOKEN;
}
