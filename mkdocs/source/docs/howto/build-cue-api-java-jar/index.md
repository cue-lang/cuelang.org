---
title: Building cue-api-java as a JAR file
authors: [jpluscplusm,4ad]
tags: [java api]
toc_hide: true
---

The library
[`cue-api-java`](https://github.com/cue-lang/cue-api-java)
provides a Java API to CUE.
This guide demonstrates how to compile the library
and store the result in a JAR file on your computer.
This is a required step before the library can be used by Java programs to
access the capabilities of the CUE language.

<!--more-->

{{<info>}}
`cue-api-java` is an experimental technology preview
which is under development and is subject to change.
{{</info>}}

## Prerequisites

- **Java JDK version 22 or later**
  -- [choosing a JDK distribution](https://whichjdk.com)
- **Apache Maven version 3.8.7 or later**
  -- [installation details](https://maven.apache.org/install.html)
- **[`libcue`](https://github.com/cue-lang/libcue)**,
  a low-level library that enables cross-language access to CUE
  -- [installation details]({{< relref "docs/howto/build-libcue-shared-library" >}})
- **Git** -- [installation details](https://git-scm.com/downloads)


## Set up the build environment

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Check that the executable prerequisites are met:

```` { .text title="TERMINAL" data-copy="javac --version&#10;mvn --version&#10;git --version" }
$ javac --version
javac 22.0.2
$ mvn --version
...
$ git --version
git version 2.47.2
````

{{<warning>}}
Many package managers choose to install a "Long Term Support" Java version,
such as Java 21.

The Java CUE API uses the
[Foreign Function & Memory API](https://openjdk.org/jeps/454)
which only became available in Java 22.
You must be using
[JDK 22](https://openjdk.org/projects/jdk/22/) or later:
**make sure to check your Java version before continuing.**
{{</warning>}}

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Teach Java and the operating system how to locate your `libcue` installation:

```` { .text title="TERMINAL" data-copy="export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" }
$ export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
````

This guide builds on the process documented in
{{< linkto/inline "howto/build-libcue-shared-library" >}}.
That guide installs `libcue` into the `/usr/local/lib/` directory, and so the
build process needs to be instructed to search this directory for shared
libraries. Here, we choose to use the
[`LD_LIBRARY_PATH`](https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80)
environment variable to achieve this because of how the Maven build process
works. We *don't* use other mechanisms here, such as invoking Java with the parameter
[`-Djava.library.path=...`](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/System.html#java.library.path), because they may not work as expected with Maven.

Whatever mechanism you choose, if you have installed `libcue` into a different
directory then be sure to teach the loader about the appropriate directory for
*your* system.

---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Clone the `cue-api-java` repository and change into its directory:

<!-- TODO(jcm): is the canonical upstream github or gerrithub? -->
```` { .text title="TERMINAL" data-copy="git clone https://github.com/cue-lang/cue-api-java cue-api-java-source&#10;cd cue-api-java-source" }
$ git clone https://github.com/cue-lang/cue-api-java cue-api-java-source
...
$ cd cue-api-java-source
````

---


[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Select a specific commit to build:

<!-- TODO(jcm): derive this commit id from the id stored in site.cue -->
```` { .text title="TERMINAL" data-copy="git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e" }
$ git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e
Note: switching to '3c12bb9e9ea203d4de8308b4145e876e4b60207e'.
...
````

`cue-api-java` is not currently versioned, so this step uses a specific commit reference.

---


## Build the library

[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Use Maven to build `cue-api-java`:

```` { .text title="TERMINAL" data-copy="mvn package" }
$ mvn package
...
````

The build log output from Maven will include the library's dependencies being
downloaded, its tests being run, a summary of the test results, and the final
build being performed. **If the output does *not* contain a line matching
"`BUILD SUCCESS`", you will need to debug and fix the issues with your build.**

---


## Test the build

It's a good idea to test the JAR file created by Maven.

[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Create a program to test that Java can load the CUE API successfully:

```` { .java title="cue-api-java-source/TestLoad.java" }
import org.cuelang.cue.*;

public class TestLoad {
  public static void main(String[] args) throws Exception {
    var ctx = new CueContext();
    System.out.println("CUE loaded successfully!");
  }
}
````

---


[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Compile the test program,
after making sure the CUE JAR can be found under a predictable filename:

```` { .text title="TERMINAL" data-copy="mv target/CUE*.jar CUE.jar&#10;javac -cp CUE.jar TestLoad.java" }
$ mv target/CUE*.jar CUE.jar
$ javac -cp CUE.jar TestLoad.java
````

---


[**:material-chevron-right-circle-outline: Step 8**](#step-8){id="step-8"}: Execute the test program:

```` { .text title="TERMINAL" data-copy="java --enable-native-access=ALL-UNNAMED -cp CUE.jar:. TestLoad" }
$ java --enable-native-access=ALL-UNNAMED -cp CUE.jar:. TestLoad
CUE loaded successfully!
````

The `--enable-native-access` flag avoids a runtime warning from Java that the
[Foreign Function & Memory API](https://openjdk.org/jeps/454) is used by
`cue-api-java` to access `libcue`.

---


## Store the library

[**:material-chevron-right-circle-outline: Step 9**](#step-9){id="step-9"}: To use the JAR file you built in the previous step multiple tools will need to
know the locations of the JAR and the `libcue` shared library on your computer.
The Java compiler, the runtime loader, and the language runtime will need to
know these locations *every time* you compile or run a Java program that uses
CUE.

As discussed above, the location of the `libcue` shared library can be identified using the
[`LD_LIBRARY_PATH`](https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80)
environment variable, or other mechanisms such as Java's
[`-Djava.library.path=...`](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/System.html#java.library.path)
parameter.

You can place the JAR anywhere on your system, and tell Java about that
location using one of the
[various mechanisms](https://en.wikipedia.org/wiki/Classpath#Setting_the_path_to_execute_Java_programs)
that it supports.
Java guides on cuelang.org assume that the JAR is available in the directory
`/usr/local/share/java/`, which you can set up as follows:

```` { .text title="TERMINAL" data-copy="mkdir -p /usr/local/share/java/&#10;cp CUE.jar /usr/local/share/java/" }
$ mkdir -p /usr/local/share/java/
$ cp CUE.jar /usr/local/share/java/
````

On a Linux system your user probably won't have write access to the
`/usr/local/share/java/` directory. If so, you will need to run these commands
as a more privileged user -- possibly the `root` user, accessed via `sudo` or `su`.

---


<!--
## Use the library

TODO(jcm): links to other content
-->

## Related content

- {{< linkto/related/howto "build-libcue-shared-library" >}}
