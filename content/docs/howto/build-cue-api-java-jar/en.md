---
title: Building cue-api-java as a JAR
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

{{{with step}}}
Check that the prerequisites are met:

{{{with script "en" "prereqs"}}}
javac --version
#ellipsis 1
java --version
#ellipsis 1
mvn --version
git --version
{{{end}}}
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
Build `cue-api-java` as a JAR:

{{{with script "en" "go build"}}}
# ellipsis 0
mvn package
{{{end}}}

The build output from Maven will include the library's dependencies being
downloaded, its tests being run, a summary of those tests' results, and the
final build being performed. If the output does *not* contain a line matching
"`BUILD SUCCESS`", you will need to debug and fix any issues with your build.
{{{end}}}

# FIXME below here

## Store the shared library

{{{with step}}}

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

{{{with script "en" "mv libcue"}}}
# cp libcue.so /usr/local/lib/
{{{end}}}

On a Linux system your user probably won't have write access to the
`/usr/local/lib` directory. If so, you will need to run the `cp` command as a
more privileged user -- possibly the `root` user, accessed via `sudo` or `su`.
{{{end}}}

{{<info>}}
How-to guides and tutorials on cuelang.org that use `libcue` assume that it has
been compiled as a shared library as described above, and has been made
available system-wide with an appropriate filename.
{{</info>}}

<!-- TODO(jcm): add a test use of the lib. Something utterly trivial and C-based? -->

## Related content
