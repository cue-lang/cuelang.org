---
title: Building cue-api-java as a JAR
authors: [jpluscplusm,4ad]
tags: [java api]
toc_hide: true
---
FIXME: add tag
The library [`cue-api-java`](https://github.com/cue-lang/cue-api-java) provides
a mechanism to use CUE in the Java language. This guide demonstrates how it can
be compiled into a JAR, which is a required step before using it with projects
written in Java.

{{<info>}}
`cue-api-java` is an experimental technology preview.
The library is under development and is subject to change.
{{</info>}}

## Prerequisites

FIXME: libcue
- **Java JDK version 22 or later**
  -- [choosing a JDK distribution](https://whichjdk.com)
- **Apache Maven version 3.8.7 or later**
  -- [installation details](https://maven.apache.org/install.html)
- **Git** -- [installation details](https://git-scm.com/downloads)

## Set up the build environment

{{< step stepNumber="1" >}}
Check that the prerequisites are met:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YWMgLS12ZXJzaW9uCmphdmEgLS12ZXJzaW9uCm12biAtLXZlcnNpb24KZ2l0IC0tdmVyc2lvbg==" }
$ javac --version
javac 22.0.2
$ java --version
openjdk 22.0.2 2024-07-16
...
$ mvn --version
[0m[0mApache Maven 3.9.8 (36645f6c9b5079805ea5009217e36f2cffd34256)
...
$ git --version
git version 2.39.2
```
{{< /step >}}

{{< step stepNumber="2" >}}
Clone the `cue-api-java` repository and change into its directory:

<!-- TODO(jcm): is the canonical upstream github or gerrithub? -->
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9jdWUtYXBpLWphdmEgY3VlLWFwaS1qYXZhLXNvdXJjZQpjZCBjdWUtYXBpLWphdmEtc291cmNl" }
$ git clone https://github.com/cue-lang/cue-api-java cue-api-java-source
...
$ cd cue-api-java-source
```
{{< /step >}}

{{< step stepNumber="3" >}}
Select a specific commit to build:

<!-- TODO(jcm): derive this commit id from the id stored in site.cue -->
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNoZWNrb3V0IDNjMTJiYjllOWVhMjAzZDRkZTgzMDhiNDE0NWU4NzZlNGI2MDIwN2U=" }
$ git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e
Note: switching to '3c12bb9e9ea203d4de8308b4145e876e4b60207e'.
...
```

`cue-api-java` is not currently versioned, so this step uses a specific commit reference.
{{< /step >}}

## Build the library

{{< step stepNumber="4" >}}
Build `cue-api-java` as a JAR:

```text { title="TERMINAL" type="terminal" codeToCopy="bXZuIHBhY2thZ2U=" }
# ellipsis 0
$ mvn package
[0m[0m[INFO] Scanning for projects...
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for org.cuelang:CUE:jar:0.0-devel
[WARNING] 'dependencies.dependency.version' for org.jetbrains:annotations:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 25, column 22
[WARNING] 'dependencies.dependency.version' for org.junit.jupiter:junit-jupiter:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 31, column 22
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
[INFO] 
[INFO] --------------------------< org.cuelang:CUE >---------------------------
[INFO] Building CUE 0.0-devel
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ CUE ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/main/resources
[INFO] 
[INFO] --- compiler:3.10.1:compile (default-compile) @ CUE ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 14 source files to /home/runner/cue-api-java-source/target/classes
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ CUE ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/test/resources
[INFO] 
[INFO] --- compiler:3.10.1:testCompile (default-testCompile) @ CUE ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 3 source files to /home/runner/cue-api-java-source/target/test-classes
[INFO] 
[INFO] --- surefire:3.0.0-M5:test (default-test) @ CUE ---
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running org.cuelang.cue.CueContextTest
[INFO] Tests run: 17, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.679 s - in org.cuelang.cue.CueContextTest
[INFO] Running org.cuelang.cue.ValueTest
[INFO] Tests run: 32, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.318 s - in org.cuelang.cue.ValueTest
[INFO] Running org.cuelang.cue.AttributeTest
[INFO] Tests run: 6, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.063 s - in org.cuelang.cue.AttributeTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 55, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- jar:3.4.1:jar (default-jar) @ CUE ---
[INFO] Building jar: /home/runner/cue-api-java-source/target/CUE-0.0-devel.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  9.121 s
[INFO] Finished at: 2024-08-02T17:27:38Z
[INFO] ------------------------------------------------------------------------
[0m[0m```

The build output from Maven will include the library's dependencies being
downloaded, its tests being run, a summary of those tests' results, and the
final build being performed. If the output does *not* contain a line matching
"`BUILD SUCCESS`", you will need to debug and fix any issues with your build.
{{< /step >}}

# FIXME below here

## Store the shared library

{{< step stepNumber="5" >}}

To use the shared library built in the previous step the compiler, the runtime
loader, and potentially the language runtime will need to know the location of
the library on your computer, at the appropriate time. The compiler will need
to know this at the point that you compile code, with the language runtime or
runtime loader needing the location every time you execute a program that uses
`libcue`.

Some compilers and runtimes expect you to specify locations explicitly; some
check predefined lists of locations; and some can be controlled through
environment variables and settings. The location where you store the shared
library will depend on your operating system, the permissions you have on your
computer, and the specific compiler and build system that you intend to use
`libcue` with.

On a Unix system such as Linux
the value of the environment variable `LD_LIBRARY_PATH`
and the contents of the file `/etc/ld.so.conf`
are commonly used to control the behaviour of the runtime loader,
as explained in The Linux Documentation Project's
[Program Library](https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)
guide. Documentation for Windows
[also exists](https://learn.microsoft.com/en-us/windows/win32/dlls/dynamic-link-library-search-order?redirectedfrom=MSDN#search_order_for_desktop_applications).

Here is an example of how to make `libcue` available to compilers and runtimes,
system-wide, under Linux:

```text { title="TERMINAL" type="terminal" codeToCopy="" }
```

On a Linux system your user probably won't have write access to the
`/usr/local/lib` directory. If so, you will need to run the `cp` command as a
more privileged user -- possibly the `root` user, accessed via `sudo` or `su`.
{{< /step >}}

{{<info>}}
How-to guides and tutorials on cuelang.org that use `libcue` assume that it has
been compiled as a shared library as described above, and has been made
available system-wide with an appropriate filename.
{{</info>}}

<!-- TODO(jcm): add a test use of the lib. Something utterly trivial and C-based? -->

## Related content
