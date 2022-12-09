const { modifyJsonFile } = require('modify-json-file')
const path = require('node:path')

modifyJsonFile(path.join(__dirname, 'keybindings.json'), keybindingsArr => {
    return keybindingsArr.filter(({ command }) => {
        return !command.startsWith('-')
    })
})
