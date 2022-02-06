def findOS() {
    String osname = System.getProperty('os.name');
    def is64Bit = false;
    if (isUnix()) {
        def osNameByScript = sh(script: 'uname', returnStdout: true)
        // Currently we aren't using below boolean for Unix like OS builds.
        // But if needed, modify below if-else loop to return appropriate strings and modify Jenkinsfile to generate builds for those platforms.
        is64Bit = (System.getProperty("os.arch").indexOf("64") != -1);
        if (osNameByScript.startsWith("Darwin")) {
            return "macOS"
        }
        else {
            return "Linux"
        }
    }
    else if (osname.contains("Windows")) {
        if(System.getenv("ProgramFiles(x86)") != null) {
            is64Bit = true;
            return "Windows64"
        }
        else {
            return "Windows32"
        }
    } else {
        throw new Exception("Unsupported OS: ${osname}");
    }
}
return this