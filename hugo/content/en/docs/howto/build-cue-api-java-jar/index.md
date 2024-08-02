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

{{< step stepNumber="1" >}}
Check that the executable prerequisites are met:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YWMgLS12ZXJzaW9uCmphdmEgLS12ZXJzaW9uCm12biAtLXZlcnNpb24KZ2l0IC0tdmVyc2lvbg==" }
$ javac --version
javac 22.0.2
$ java --version
openjdk 22.0.2 2024-07-16
...
$ mvn --version
...
$ git --version
git version 2.39.2
```

{{<warning>}}
Many package managers choose to install a Long Term Support Java version,
such as Java 21.

The Java CUE API uses the
[Foreign Function & Memory API](https://openjdk.org/jeps/454)
which only became available in Java 22.
You must be using
[JDK 22](https://openjdk.org/projects/jdk/22/) or later:
**make sure to check your Java version before continuing.**
{{</warning>}}
{{< /step >}}

{{< step stepNumber="2" >}}
Teach the Java runtime loader how to locate your `libcue` installation:

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IExEX0xJQlJBUllfUEFUSD0vdXNyL2xvY2FsL2xpYjokTERfTElCUkFSWV9QQVRI" }
$ export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
```

This guide builds on the process documented in
{{< linkto/inline "howto/build-libcue-shared-library" >}},
where `libcue` is installed into the `/usr/local/lib/` directory.
The Java runtime loader needs to be instructed to search this directory for
shared libraries. Here, we use the 
[`LD_LIBRARY_PATH`](https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80)
environment variable to achieve this, but other mechanisms can also accomplish
the same result -- such as invoking Java with the parameter\
[`-Djava.library.path=...`](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/System.html#java.library.path).

Whatever mechanism you choose, if you have installed `libcue` into a different
directory then be sure to teach the loader about the appropriate directory for
*your* system.
{{< /step >}}

{{< step stepNumber="3" >}}
Clone the `cue-api-java` repository and change into its directory:

<!-- TODO(jcm): is the canonical upstream github or gerrithub? -->
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9jdWUtYXBpLWphdmEgY3VlLWFwaS1qYXZhLXNvdXJjZQpjZCBjdWUtYXBpLWphdmEtc291cmNl" }
$ git clone https://github.com/cue-lang/cue-api-java cue-api-java-source
...
$ cd cue-api-java-source
```
{{< /step >}}

{{< step stepNumber="4" >}}
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

{{< step stepNumber="5" >}}
Use Maven to build `cue-api-java`:

```text { title="TERMINAL" type="terminal" codeToCopy="bXZuIHBhY2thZ2U=" }
$ mvn package
...
```

The build output from Maven will include the library's dependencies being
downloaded, its tests being run, a summary of the test results, and the final
build being performed. **If the output does *not* contain a line matching
"`BUILD SUCCESS`", you will need to debug and fix the issues with your build.**
{{< /step >}}

{{< step stepNumber="6" >}}
Check the contents of the JAR file built by Maven:

```text { title="TERMINAL" type="terminal" codeToCopy="amFyIC0tbGlzdCAtLWZpbGUgdGFyZ2V0L0NVRSouamFyIG9yZy9jdWVsYW5nL2xpYmN1ZQ==" }
$ jar --list --file target/CUE*.jar org/cuelang/libcue
org/cuelang/libcue/
org/cuelang/libcue/cue_h$cue_newctx.class
org/cuelang/libcue/cue_h$cue_error_string.class
org/cuelang/libcue/cue_h$cue_compile_string.class
org/cuelang/libcue/cue_h$cue_compile_bytes.class
...
```
{{< /step >}}

## Store the library

{{< step stepNumber="7" >}}
To use the JAR file you built in the previous step multiple tools will need to
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

```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgL3Vzci9sb2NhbC9zaGFyZS9qYXZhLwpjcCB0YXJnZXQvQ1VFKi5qYXIgL3Vzci9sb2NhbC9zaGFyZS9qYXZhL0NVRS5qYXI=" }
$ mkdir -p /usr/local/share/java/
$ cp target/CUE*.jar /usr/local/share/java/CUE.jar
```

On a Linux system your user probably won't have write access to the
`/usr/local/share/java/` directory. If so, you will need to run the `cp` command as a
more privileged user -- possibly the `root` user, accessed via `sudo` or `su`.
{{< /step >}}

<!-- TODO(jcm): add a test use of the lib -->

<!--
## Use the library

TODO(jcm): links to other content
-->

## Related content

- {{< linkto/related/howto "build-libcue-shared-library" >}}
