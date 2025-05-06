buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.3.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.7.10")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = File(rootProject.projectDir, "../build/android")

subprojects {
    project.buildDir = File(rootProject.buildDir, project.name)
    
    afterEvaluate {
        if (project.name != "app") {
            project.configurations.findByName("implementation")?.dependencies?.add(
                project.dependencies.project(":app")
            )
        }
    }
}