---
title: Building libcue as a shared library
authors: [jpluscplusm,4ad]
toc_hide: true
tags: [FIXME]
---

<!-- FIXME: is the canonical upstream github, or gerrithub? -->
The [`libcue`](https://github.com/cue-lang/libcue) library provides a mechanism
to use CUE in C and C-like languages. This guide demonstrates how it can be
compiled as a shared library, which is a required step before using it with
languages such as Java.

{{<info>}}
`libcue` is an experimental technology preview.
The library is under development and is subject to change.
{{</info>}}

## Prerequisites

- **Go version 1.22 or later** with `cgo` enabled
  ([installation details](https://go.dev/doc/install))
- **GCC or Clang** (any version shipped with a relatively modern Linux or macOS will be sufficient)
- **Git** ([installation details](https://git-scm.com/downloads))

## Set up the build environment

{{< step stepNumber="1" >}}
Check that this guide's prerequisites are met:

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IENHT19FTkFCTEVEPTEKZ28gdmVyc2lvbgpnbyBlbnYgQ0dPX0VOQUJMRUQKd2hpY2ggY2MgZ2l0" }
$ export CGO_ENABLED=1
$ go version
go version go1.22.4 linux/amd64
$ go env CGO_ENABLED
1
$ which cc git
/usr/bin/cc
/usr/bin/git
```
{{< /step >}}

{{< step stepNumber="2" >}}
Clone the `libcue` repository and change into its directory:

```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9saWJjdWUgbGliY3VlLXNvdXJjZQpjZCBsaWJjdWUtc291cmNl" }
$ git clone https://github.com/cue-lang/libcue libcue-source
...
$ cd libcue-source
```
{{< /step >}}

## Build the library

{{< step stepNumber="3" >}}
Build `libcue` as a shared library:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gYnVpbGQgLWJ1aWxkbW9kZT1jLXNoYXJlZCAtbyBsaWJjdWUuc28=" }
$ go build -buildmode=c-shared -o libcue.so
...
```

The value passed to the `-o` flag is the filename that will contain the compiled output.
This value will vary, depending on your operating system.

The value shown above (`libcue.so`) is appropriate for most Unix systems, such as Linux.
On macOS you should use `libcue.dylib`,
and on Windows `cue.dll` is required (*without* a "lib" prefix).
{{< /step >}}

## Store the shared library

{{< step stepNumber="4" >}}

To use the shared library built in the previous step, the compiler will need to
know the location of the library on your computer, at the time you use it.

Some compilers expect you to specify locations explicitly; some compilers check
predefined lists of locations; and some compilers can be controlled through
environment variables and settings. The location where you store the shared
library will depend on your operating system, the permissions you have on your
computer, and the specific compiler and build system that you intend to use
`libcue` with.

On a Unix system such as Linux, the value of the `LD_LIBRARY_PATH` environment
variable and the contents of the `/etc/ld.so.conf` file are commonly used to
control a compiler's behaviour, as explained in The Linux Documentation
Project's
["Program Library" how-to guide](https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html).
Documentation for Windows
[also exists](https://learn.microsoft.com/en-us/windows/win32/dlls/dynamic-link-library-search-order?redirectedfrom=MSDN#search_order_for_desktop_applications).

Here is an example of how to make `libcue` available to compilers, system-wide,
under Linux:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3AgbGliY3VlLnNvIC91c3IvbG9jYWwvbGliLw==" }
$ cp libcue.so /usr/local/lib/
```

On a Linux system your user probably won't have write access to the
`/usr/local/lib` directory. If this is the case then you will need to run this
command as a more privileged user -- possibly the `root` user, accessed via
`sudo` or `su`.
{{< /step >}}

{{<info>}}
How-to guides and tutorials on cuelang.org that use `libcue` assume that it has
been compiled as a shared library, with an appropriate filename, and has been
made available to all commands that require it, as described above.
{{</info>}}

<!-- TODO(jcm): add a test use of the lib. Something utterly trivial and C-based? -->

## Related content
