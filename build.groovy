def findOS() {
    if (isUnix()) {
        def osNameByScript = sh(script: 'uname', returnStdout: true)
        if (osNameByScript.startsWith("Darwin")) {
            return "macOS"
        }
        else {
            return "Linux"
        }
    }
    else {
        def batScript = '''@echo off && if defined ProgramFiles(x86) ( @echo Windows64 ) else ( @echo Windows32 )'''
        def windowsArch = bat(script: batScript, returnStdout: true).trim()
        return windowsArch
    }
}
return this