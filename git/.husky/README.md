There may issue with the `pre-commit` lacking executable bit - the solution is:
```shell
chmod 755 .husky/pre-commit
git config core.filemode false 
```