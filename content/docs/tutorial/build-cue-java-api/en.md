---
title: Building the Java API
tags:
- java api
authors:
- 4ad
toc_hide: true
---

{{{with _script_ "en" "disable ANSI escape codes from commands"}}}
export MAVEN_ARGS="-B"
export TERM="dumb"
{{{end}}}

We are adding support for using CUE from the Java programming language.

This tutorial demonstrates
how to build
[CUE's Java API](https://github.com/cue-lang/cue-api-java),
allowing you to use CUE from the Java programming language.

{{< info >}}
### Warning
This is *experimental* software,
consider it a technology preview.
The technical details described in this document
are subject to change without notice.
{{< /info >}}

## Prerequisites

- **Java `>=22`**
  ([which JDK distribution should I use?](https://whichjdk.com),
  [installation details for Eclipse Temurin](https://adoptium.net/installation))
- **Maven `>=3.8.7`** ([manual installation details](https://maven.apache.org/install.html), or use your package manager)
- **Go `>=1.22`**
  ([installation details](https://go.dev/doc/install),
  [cgo must be enabled](https://pkg.go.dev/cmd/cgo))
- **GCC or Clang** (any version shipped with Linux or macOS will suffice)
- **Git** (any version should suffice)

{{< info >}}
### Warning
The Java CUE API makes use of the [Foreign Function & Memory API](https://openjdk.org/jeps/454)
which only became available in Java 22,
so you will need [JDK 22](https://openjdk.org/projects/jdk/22/)
or newer.
Many package managers default to installing a LTS Java version,
such as Java 21,
make sure to check which version of Java you have installed
before proceeding  further.
{{< /info >}}

First, make sure you have the necessary software prerequisites installed and configured correctly:

{{{with script "en" "version"}}}
go version
go env CGO_ENABLED
#ellipsis 1
cc -v 2>&1 | sed -n '/ version /p'
#ellipsis 1
java --version
#ellipsis 1
mvn -v
git -v
{{{end}}}

## Installation

Java loads CUE as a shared library (`libcue`),
which must be available to your Java program at runtime,
so let's install `libcue` first.

### Build and install `libcue`

{{{with step}}}
Chose a directory where to put `libcue`
and clone the repository:

{{{with script "en" "clone libcue"}}}
#ellipsis 1
git clone https://github.com/cue-lang/libcue.git
{{{end}}}

{{{end}}}

{{{with step}}}
Then from within that repository run
`go build`:

{{{with script "en" "build libcue"}}}
cd libcue
#ellipsis 0
go build -o libcue.so -buildmode=c-shared
{{{end}}}

Use a target name appropiate for your operating system.
Above we used `libcue.so` which is appropiate for most Unix systems
(such as Linux)
on macOS use `libcue.dylib`,
and on Windows use `cue.dll`
(note the missing prefix).

{{{end}}}

{{{with step}}}
Place the compiled shared object file in a place
where the dynamic loader will find it,
for example on Linux such a place might be
`/usr/local/lib`.

{{{with _script_ "en" "set LD_LIBRARY_PATH"}}}
export LD_LIBRARY_PATH=$(readlink -f .)
{{{end}}}

{{{end}}}

{{< info >}}
Consult your operating system documentation
for information about how it finds shared libraries
and ways to control the search
(such as `LD_LIBRARY_PATH`).
{{< /info >}}

### Build the CUE Java API

{{{with step}}}
Chose a directory where to put `cue-api-java`
and clone the repository:

{{{with script "en" "clone cue-api-java"}}}
cd $HOME
#ellipsis 1
git clone https://github.com/cue-lang/cue-api-java.git
{{{end}}}

{{{end}}}

{{{with step}}}
Then from within that repository run maven.

{{{with script "en" "run maven"}}}
cd cue-api-java
#ellipsis 0
mvn package
{{{end}}}

Maven will run the tests
and if all goes well,
it will generate a JAR file in the `target` directory:

{{{with script "en" "ls jar"}}}
ls -l target/*.jar
{{{end}}}

{{{end}}}

## Related content

- TODO: add link to usage guide here.
