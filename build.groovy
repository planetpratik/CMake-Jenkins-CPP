def findOS() {
    if (isUnix()) {
        def osName = sh(script: 'uname', returnStdout: true)
        if (osName.startsWith("Darwin")) {
            return "macOS"
        }
        else {
            return "Linux"
        }
    }
    else {
        return "Windows"
    }
}
return this