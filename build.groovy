def findOS() {
    if (isUnix()) {
        def osName = sh(script: 'uname', returnStdout: true)
        if (uname.startsWith("Darwin")) {
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