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
        def windowsArch = bat(script: '@echo off && if defined ProgramFiles(x86) ( @echo Windows64 ) else ( @echo Windows32 )', returnStdout: true)
        return windowsArch
    }
}
return this