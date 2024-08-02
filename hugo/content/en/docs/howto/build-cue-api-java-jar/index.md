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
[1mApache Maven 3.9.8 (36645f6c9b5079805ea5009217e36f2cffd34256)[m
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
[[1;34mINFO[m] Scanning for projects...
[[1;33mWARNING[m] 
[[1;33mWARNING[m] Some problems were encountered while building the effective model for org.cuelang:CUE:jar:0.0-devel
[[1;33mWARNING[m] 'dependencies.dependency.version' for org.jetbrains:annotations:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 25, column 22
[[1;33mWARNING[m] 'dependencies.dependency.version' for org.junit.jupiter:junit-jupiter:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 31, column 22
[[1;33mWARNING[m] 
[[1;33mWARNING[m] It is highly recommended to fix these problems because they threaten the stability of your build.
[[1;33mWARNING[m] 
[[1;33mWARNING[m] For this reason, future Maven versions might no longer support building such malformed projects.
[[1;33mWARNING[m] 
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--------------------------< [0;36morg.cuelang:CUE[0;1m >---------------------------[m
[[1;34mINFO[m] [1mBuilding CUE 0.0-devel[m
[[1;34mINFO[m]   from pom.xml
[[1;34mINFO[m] [1m--------------------------------[ jar ]---------------------------------[m
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--- [0;32mresources:3.3.1:resources[m [1m(default-resources)[m @ [36mCUE[0;1m ---[m
[[1;33mWARNING[m] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[[1;34mINFO[m] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/main/resources
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--- [0;32mcompiler:3.10.1:compile[m [1m(default-compile)[m @ [36mCUE[0;1m ---[m
[[1;34mINFO[m] Changes detected - recompiling the module!
[[1;33mWARNING[m] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[[1;34mINFO[m] Compiling 14 source files to /home/runner/cue-api-java-source/target/classes
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--- [0;32mresources:3.3.1:testResources[m [1m(default-testResources)[m @ [36mCUE[0;1m ---[m
[[1;33mWARNING[m] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[[1;34mINFO[m] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/test/resources
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--- [0;32mcompiler:3.10.1:testCompile[m [1m(default-testCompile)[m @ [36mCUE[0;1m ---[m
[[1;34mINFO[m] Changes detected - recompiling the module!
[[1;33mWARNING[m] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[[1;34mINFO[m] Compiling 3 source files to /home/runner/cue-api-java-source/target/test-classes
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--- [0;32msurefire:3.0.0-M5:test[m [1m(default-test)[m @ [36mCUE[0;1m ---[m
[[1;34mINFO[m] 
[[1;34mINFO[m] -------------------------------------------------------
[[1;34mINFO[m]  T E S T S
[[1;34mINFO[m] -------------------------------------------------------
[[1;34mINFO[m] Running org.cuelang.cue.[1mCueContextTest[m
[[1;34mINFO[m] [1;32mTests run: [0;1;32m17[m, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.555 s - in org.cuelang.cue.[1mCueContextTest[m
[[1;34mINFO[m] Running org.cuelang.cue.[1mValueTest[m
[[1;34mINFO[m] [1;32mTests run: [0;1;32m32[m, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.316 s - in org.cuelang.cue.[1mValueTest[m
[[1;34mINFO[m] Running org.cuelang.cue.[1mAttributeTest[m
[[1;34mINFO[m] [1;32mTests run: [0;1;32m6[m, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.072 s - in org.cuelang.cue.[1mAttributeTest[m
[[1;34mINFO[m] 
[[1;34mINFO[m] Results:
[[1;34mINFO[m] 
[[1;34mINFO[m] [1;32mTests run: 55, Failures: 0, Errors: 0, Skipped: 0[m
[[1;34mINFO[m] 
[[1;34mINFO[m] 
[[1;34mINFO[m] [1m--- [0;32mjar:3.4.1:jar[m [1m(default-jar)[m @ [36mCUE[0;1m ---[m
[[1;34mINFO[m] Building jar: /home/runner/cue-api-java-source/target/CUE-0.0-devel.jar
[[1;34mINFO[m] [1m------------------------------------------------------------------------[m
[[1;34mINFO[m] [1;32mBUILD SUCCESS[m
[[1;34mINFO[m] [1m------------------------------------------------------------------------[m
[[1;34mINFO[m] Total time:  9.093 s
[[1;34mINFO[m] Finished at: 2024-08-05T09:21:55Z
[[1;34mINFO[m] [1m------------------------------------------------------------------------[m
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
