return {
    cmd = {
        "jdtls",
    },
    cmd_env = {
        JAVA_HOME = "/usr/lib/jvm/java-21-openjdk",
    },
    root_markers = {
        "build.gradle",
        "build.gradle.kts",
        "settings.gradle",
        "settings.gradle.kts",
        "pom.xml",
        ".git",
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-openjdk",
                    },
                },
            },
            completion = {
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                },
            },
            import = {
                gradle = {
                    enabled = true,
                    version = "9.5.0",
                    java = {
                        home = "/usr/lib/jvm/java-21-openjdk",
                    },
                    wrapper = {
                        enabled = true,
                    },
                },
                maven = {
                    enabled = true,
                },
            },
            signatureHelp = {
                enabled = true,
            },
        },
    },
}
