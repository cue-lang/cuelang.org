---
title: Building libcue as a shared library
authors: [jpluscplusm,4ad]
toc_hide: true
---

The library [`libcue`](https://github.com/cue-lang/libcue) provides a mechanism
to use CUE in C and C-like languages. This guide demonstrates how it can be
compiled as a shared library, which is a required step before using it with
languages such as Java.

{{<info>}}
`libcue` is an experimental technology preview.
The library is under development and is subject to change.
{{</info>}}

## Prerequisites

- **Go version 1.22 or later** with [`cgo`](https://pkg.go.dev/cmd/cgo) enabled
  -- [installation details](https://go.dev/doc/install)
- **GCC or Clang** -- any version shipped with a relatively modern Linux or macOS will be sufficient
- **Git** -- [installation details](https://git-scm.com/downloads)

## Set up the build environment

{{< step stepNumber="1" >}}
Enable [`cgo`](https://pkg.go.dev/cmd/cgo):

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IENHT19FTkFCTEVEPTE=" }
$ export CGO_ENABLED=1
```
{{< /step >}}

{{< step stepNumber="2" >}}
Check that the Go prerequisites are met:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gdmVyc2lvbgpnbyBlbnYgQ0dPX0VOQUJMRUQ=" }
$ go version
go version go1.23.2 linux/amd64
$ go env CGO_ENABLED
1
```

Check that other prerequisites are met:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2MgLS12ZXJzaW9uCmdpdCAtLXZlcnNpb24=" }
$ cc --version
cc (Debian 12.2.0-14) 12.2.0
...
$ git --version
git version 2.39.5
```
{{< /step >}}

{{< step stepNumber="3" >}}
Clone the `libcue` repository and change into its directory:

<!-- TODO(jcm): is the canonical upstream github or gerrithub? -->
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9saWJjdWUgbGliY3VlLXNvdXJjZQpjZCBsaWJjdWUtc291cmNl" }
$ git clone https://github.com/cue-lang/libcue libcue-source
...
$ cd libcue-source
```
{{< /step >}}

{{< step stepNumber="4" >}}
Select a specific commit to build:

```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNoZWNrb3V0IDFjODYxY2M5Y2RjNTU4NGY1ZDI2YjBhNzExMmFhMmFmZWU3NGQ0Y2Y=" }
$ git checkout 1c861cc9cdc5584f5d26b0a7112aa2afee74d4cf
Note: switching to '1c861cc9cdc5584f5d26b0a7112aa2afee74d4cf'.
...
```
<!-- TODO(jcm): derive this commit id from the id stored in site.cue -->

`libcue` is not currently versioned, so this step uses a specific commit reference.
{{< /step >}}

## Build the library

{{< step stepNumber="5" >}}
Build `libcue` as a shared library:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gYnVpbGQgLWJ1aWxkbW9kZT1jLXNoYXJlZCAtbyBsaWJjdWUuc28=" }
$ go build -buildmode=c-shared -o libcue.so
...
```

The value passed to the `-o` flag is the filename that will contain the compiled output.
This value will vary, depending on your operating system.

The value shown above (`libcue.so`) is appropriate for most Unix systems, such as Linux.
On macOS you should use `libcue.dylib`,
and Windows requires `cue.dll` (*without* a "lib" prefix).
{{< /step >}}

## Store the shared library

{{< step stepNumber="6" >}}

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3AgbGliY3VlLnNvIC91c3IvbG9jYWwvbGliLw==" }
$ cp libcue.so /usr/local/lib/
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
