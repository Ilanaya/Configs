There may issue with the `pre-commit` lacking executable bit - the solution is:
```shell
chmod 755 .husky/pre-commit
git config core.filemode false 
```

Case: Windows user switches from `core.autocrlf = true` to `core.autocrlf = false` on existing project:
```
git rm --cached -r .
git reset --hard
```