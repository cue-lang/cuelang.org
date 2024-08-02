---
title: Building cue-api-java as a JAR file
authors: [jpluscplusm,4ad]
tags: [java api]
toc_hide: true
---

{{{with _upload_ "en" "HIDDEN: configure Maven download cache"}}}
-- /root/.m2/settings.xml --
<settings xmlns="http://maven.apache.org/SETTINGS/1.2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.2.0 https://maven.apache.org/xsd/settings-1.2.0.xsd">
<!-- cf. https://maven.apache.org/settings.html#settings-details -->
	<localRepository>/caches/maven/repository</localRepository>
</settings>
{{{end}}}

The library [`cue-api-java`](https://github.com/cue-lang/cue-api-java) provides
a mechanism to use CUE in the Java language. This guide demonstrates how it can
be compiled into Java bytecode, which is a required step before using it with
projects written in Java, and storing the result in a JAR file.

{{<info>}}
`cue-api-java` is an experimental technology preview.
The library is under development and is subject to change.
{{</info>}}

## Prerequisites

- **Java JDK version 22 or later**
  -- [choosing a JDK distribution](https://whichjdk.com)
- **Apache Maven version 3.8.7 or later**
  -- [installation details](https://maven.apache.org/install.html)
- **[`libcue`](https://github.com/cue-lang/libcue)**,
  a library that enables access to CUE from C-like languages
  -- [installation details]({{< relref "docs/howto/build-libcue-shared-library" >}})
- **Git** -- [installation details](https://git-scm.com/downloads)


## Set up the build environment

{{{with step}}}
Check that the executable prerequisites are met:

{{{with script "en" "check prereqs"}}}
javac --version
#ellipsis 1
java --version
#ellipsis 0
mvn --version
git --version
{{{end}}}

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
{{{end}}}

{{{with step}}}
Teach the Java runtime loader how to locate your `libcue` installation:

{{{with script "en" "export LD_LIBRARY_PATH"}}}
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
{{{end}}}

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
{{{end}}}

{{{with step}}}
Clone the `cue-api-java` repository and change into its directory:

<!-- TODO(jcm): is the canonical upstream github or gerrithub? -->
{{{with script "en" "git clone"}}}
#ellipsis 0
git clone https://github.com/cue-lang/cue-api-java cue-api-java-source
cd cue-api-java-source
{{{end}}}
{{{end}}}

{{{with step}}}
Select a specific commit to build:

<!-- TODO(jcm): derive this commit id from the id stored in site.cue -->
{{{with script "en" "git checkout"}}}
#ellipsis 1
git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e
{{{end}}}

`cue-api-java` is not currently versioned, so this step uses a specific commit reference.
{{{end}}}

## Build the library

{{{with step}}}
Use Maven to build `cue-api-java`:

{{{with script "en" "maven build"}}}
#ellipsis 0
mvn package
{{{end}}}

The build output from Maven will include the library's dependencies being
downloaded, its tests being run, a summary of the test results, and the final
build being performed. **If the output does *not* contain a line matching
"`BUILD SUCCESS`", you will need to debug and fix the issues with your build.**
{{{end}}}

{{{with step}}}
Check the contents of the JAR file built by Maven:

{{{with script "en" "jar list"}}}
#ellipsis 5
jar --list --file target/CUE*.jar org/cuelang/libcue
{{{end}}}
{{{end}}}

## Store the library

{{{with step}}}
To use the JAR file you built in the previous step multiple tools will need to
know the locations of the JAR and the `libcue` shared library on your computer.
The Java compiler, the runtime loader, and the language runtime will need to
know these locations *every time* you compile or run a Java program that uses
CUE.

As discussed above, the `libcue` shared library can be pointed towards using the
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

{{{with script "en" "mv jar"}}}
#norun
mkdir -p /usr/local/share/java/
cp target/CUE*.jar /usr/local/share/java/CUE.jar
{{{end}}}

On a Linux system your user probably won't have write access to the
`/usr/local/share/java/` directory. If so, you will need to run the `cp` command as a
more privileged user -- possibly the `root` user, accessed via `sudo` or `su`.
{{{end}}}

<!-- TODO(jcm): add a test use of the lib -->

<!--
## Use the library

TODO(jcm): links to other content
-->

## Related content

- {{< linkto/related/howto "build-libcue-shared-library" >}}
