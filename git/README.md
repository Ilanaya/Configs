1. * `git push origin --delete bad-branch-name` deletes the branch from origin
2. When working with `https` use `git config --global credential.helper cache`
3. Setting up `upstream` branch is made with one of commands:
  * `git branch -u <remote>/<branch>`
  * `git checkout -b <branch> <remote>/<branch>`
  * `git checkout --track <remote>/<branch>`
  * If the branch name you’re
trying to checkout (a) doesn’t exist and (b) exactly matches a name on only one remote

    `git checkout <branch>`
***
5. Upstream branch can be referenced as `@{upstream}` or `@{u}`, i.e. `git merge origin/main` can be replaced with `git merge @{u}`
***
6.  `git rebase --onto <target> <parent> <child>`
  
    If `child` is subbranch of `parent` this command will rebase all commits from `child`, ignoring commits, presented in parent onto `target`

7. Commit can be references by at least four chars of its SHA-1 hash, but there has to be an ambiguous reference. `git log --abbrev-commit` will show log with shorter values, but keep them unique (7 chars by default)