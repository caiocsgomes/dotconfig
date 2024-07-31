## Adding files to gha workspace and also managing output

https://github.com/actions/github-script/issues/266

## Getting amount of current and desired runners

k -n NAMESPACE get ephemeralrunnersets.actions.github.com

## Get auto scaling runner sets

```bash
k -n gha-runner-scale-set get AutoScalingRunnerSet
```

## Login with gh cli
```bash
gh auth login # use https and login in the browser, it's easier
```

## List repos with gh cli disabling interactive shell
```bash
GH_PAGER=cat gh repo list
```
