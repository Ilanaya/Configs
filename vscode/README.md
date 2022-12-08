* Extensions notes
  * [SCSS Intellisense](https://marketplace.visualstudio.com/items?itemName=mrmlnc.vscode-scss) excludes `node_modules` from scanning by default.
  ```jsonc
  {
    "scss.scannerExclude": [
      "**/.git",
      "**/bower_components",
      "**/node_modules/!(@tc)/**" //added manually
    ],
  }
  ```