---
title: Building the Java API
tags:
- java api
authors:
- 4ad
toc_hide: true
---

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

```text { title="TERMINAL" codeToCopy="Z28gdmVyc2lvbgpnbyBlbnYgQ0dPX0VOQUJMRUQKY2MgLXYgMj4mMSB8IHNlZCAtbiAnLyB2ZXJzaW9uIC9wJwpqYXZhIC0tdmVyc2lvbgptdm4gLXYKZ2l0IC12" }
$ go version
go version go1.22.1 linux/amd64
$ go env CGO_ENABLED
1
$ cc -v 2>&1 | sed -n '/ version /p'
gcc version 12.2.0 (Debian 12.2.0-14) 
...
$ java --version
openjdk 22 2024-03-19
...
$ mvn -v
[1mApache Maven 3.8.7[m
...
$ git -v
git version 2.39.2
```

## Installation

Java loads CUE as a shared library (`libcue`),
which must be available to your Java program at runtime,
so let's install `libcue` first.

### Build and install `libcue`

{{< step stepNumber="1" >}}
Chose a directory where to put `libcue`
and clone the repository:

```text { title="TERMINAL" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9saWJjdWUuZ2l0" }
$ git clone https://github.com/cue-lang/libcue.git
Cloning into 'libcue'...
...
```

{{< /step >}}

{{< step stepNumber="2" >}}
Then from within that repository run
`go build`:

```text { title="TERMINAL" codeToCopy="Y2QgbGliY3VlCmdvIGJ1aWxkIC1vIGxpYmN1ZS5zbyAtYnVpbGRtb2RlPWMtc2hhcmVk" }
$ cd libcue
$ go build -o libcue.so -buildmode=c-shared
...
```

Use a target name appropiate for your operating system.
Above we used `libcue.so` which is appropiate for most Unix systems
(such as Linux)
on macOS use `libcue.dylib`,
and on Windows use `cue.dll`
(note the missing prefix).

{{< /step >}}

{{< step stepNumber="3" >}}
Place the compiled shared object file in a place
where the dynamic loader will find it,
for example on Linux such a place might be
`/usr/local/lib`.
{{< /step >}}

{{< info >}}
Consult your operating system documentation
for information about how it finds shared libraries
and ways to control the search
(such as `LD_LIBRARY_PATH`).
{{< /info >}}

### Build the CUE Java API

{{< step stepNumber="4" >}}
Chose a directory where to put `cue-api-java`
and clone the repository:

```text { title="TERMINAL" codeToCopy="Y2QgJEhPTUUKZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9jdWUtYXBpLWphdmEuZ2l0" }
$ cd $HOME
$ git clone https://github.com/cue-lang/cue-api-java.git
Cloning into 'cue-api-java'...
...
```

{{< /step >}}

{{< step stepNumber="5" >}}
Then from within that repository run maven.

```text { title="TERMINAL" codeToCopy="Y2QgY3VlLWFwaS1qYXZhCm12biBwYWNrYWdl" }
$ cd cue-api-java
$ mvn package
...
```

Maven will run the tests
and if all goes well,
it will generate a JAR file in the `target` directory:

```text { title="TERMINAL" codeToCopy="bHMgLWwgdGFyZ2V0LyouamFy" }
$ ls -l target/*.jar
-rw-rw-rw- 1 runner dialout 97771 Apr 10 15:30 target/CUE-0.0-devel.jar
```

{{< /step >}}

## Related content

- TODO: add link to usage guide here.
