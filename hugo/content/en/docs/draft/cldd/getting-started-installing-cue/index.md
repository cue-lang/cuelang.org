---
title: Getting Started - Installing cue
draft: true
no_index: true
---

The `cue` command is the advanced tooling that unlocks the powerful combination
of CUE + Central Registry.

It's easy to get started running `cue` on your computer.
Select the tab for your computer's operating system, below, and follow its
installation instructions.

{{<tabs>}}

{{<tab name="Linux">}}

The following instructions are intended for use on any Linux distribution.
Alternative installation methods include
[compiling `cue` from source](FIXME),
[using Homebrew](FIXME),
[using Docker](FIXME),
or [using Arch Linux's `pacman`](FIXME).

{{< step stepNumber="1" >}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.
Scroll down to the section labelled "Assets" and download the appropriate
release archive for your your computer. For example:
```text { title="TERMINAL" type="terminal" codeToCopy="YXJjaD0kKGNhc2UgIiQodW5hbWUgLW0pIiBpbiB4ODZfNjQpIGVjaG8gYW1kNjQgOzsgYWFyY2g2NCB8IGFybTY0KSBlY2hvIGFybTY0IDs7IGVzYWMpCmN1cmwgLXNTTCAtbyBjdWUtdjAuMTEuMi50Z3ogaHR0cHM6Ly9naXRodWIuY29tL2N1ZS1sYW5nL2N1ZS9yZWxlYXNlcy9kb3dubG9hZC92MC4xMS4yL2N1ZV92MC4xMS4yX2xpbnV4XyR7YXJjaH0udGFyLmd6" }
$ arch=$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)
$ curl -sSL -o cue-v0.11.2.tgz https://github.com/cue-lang/cue/releases/download/v0.11.2/cue_v0.11.2_linux_${arch}.tar.gz
```
{{< /step >}}

{{< step stepNumber="2" >}}
Extract the archive you just downloaded into `/usr/local/cue/`, removing any
installation already present. For example:
```text { title="TERMINAL" type="terminal" codeToCopy="cm0gLXJmIC91c3IvbG9jYWwvY3VlICYmIG1rZGlyIC1wIC91c3IvbG9jYWwvY3VlICYmIHRhciAtQyAvdXNyL2xvY2FsL2N1ZSAteHpmIGN1ZS12MC4xMS4yLnRneg==" }
$ rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-v0.11.2.tgz
```
You may need to run this command as root, or using `sudo`.
{{< /step >}}

{{< step stepNumber="3" >}}
Add `/usr/local/cue` to the PATH environment variable.
You can do this by adding the following line to your `$HOME/.profile` file (or
`/etc/profile` for a system-wide installation):
```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IFBBVEg9L3Vzci9sb2NhbC9jdWU6JFBBVEg=" }
$ export PATH=/usr/local/cue:$PATH
```
Changes made to a profile file may not apply until the next time you log into
your computer. To apply this change immediately in a specific command shell,
run the previous command directly in that shell.
{{< /step >}}

{{< step stepNumber="4" >}}
Test your installation by opening a new command prompt and running this command:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.2
...
```
You should see the latest version of CUE reported, as shown here.
{{< /step >}}
{{</tab>}}

{{<tab name="MacOS">}}
The following instructions are intended for use on any MacOS version.
Alternative installation methods include
[compiling `cue` from source](FIXME),
or [using Homebrew](FIXME),

{{< step stepNumber="5" >}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.
Scroll down to the section labelled "Assets" and download the appropriate
release archive for your your computer. For example:
```text { title="TERMINAL" type="terminal" codeToCopy="YXJjaD0kKGNhc2UgIiQodW5hbWUgLW0pIiBpbiB4ODZfNjQpIGVjaG8gYW1kNjQgOzsgYWFyY2g2NCB8IGFybTY0KSBlY2hvIGFybTY0IDs7IGVzYWMpCmN1cmwgLXNTTCAtbyBjdWUtdjAuMTEuMi50Z3ogaHR0cHM6Ly9naXRodWIuY29tL2N1ZS1sYW5nL2N1ZS9yZWxlYXNlcy9kb3dubG9hZC92MC4xMS4yL2N1ZV92MC4xMS4yX2Rhcndpbl8ke2FyY2h9LnRhci5neg==" }
$ arch=$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)
$ curl -sSL -o cue-v0.11.2.tgz https://github.com/cue-lang/cue/releases/download/v0.11.2/cue_v0.11.2_darwin_${arch}.tar.gz
```
{{< /step >}}

{{< step stepNumber="6" >}}
Extract the archive you just downloaded into `/usr/local/cue/`, removing any
installation already present. For example:
```text { title="TERMINAL" type="terminal" codeToCopy="cm0gLXJmIC91c3IvbG9jYWwvY3VlICYmIG1rZGlyIC1wIC91c3IvbG9jYWwvY3VlICYmIHRhciAtQyAvdXNyL2xvY2FsL2N1ZSAteHpmIGN1ZS12MC4xMS4yLnRneg==" }
$ rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-v0.11.2.tgz
```
You may need to run this command as root, or using `sudo`.
{{< /step >}}

{{< step stepNumber="7" >}}
Add `/usr/local/cue` to the PATH environment variable.
You can do this by adding the following line to your `$HOME/.profile` file (or
`/etc/profile` for a system-wide installation):
```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IFBBVEg9L3Vzci9sb2NhbC9jdWU6JFBBVEg=" }
$ export PATH=/usr/local/cue:$PATH
```
Changes made to a profile file may not apply until the next time you log into
your computer. To apply this change immediately in a specific command shell,
run the previous command directly in that shell.
{{< /step >}}

{{< step stepNumber="8" >}}
Test your installation by opening a new command prompt and running this command:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.2
...
```
You should see the latest version of CUE reported, as shown here.
{{< /step >}}
{{</tab>}}

{{<tab name="Windows Subsystem for Linux (WSL)">}}
The following instructions are intended for use on any Linux distribution that
Windows Subsystem for Linux can run, including its default -- Ubuntu.
Alternative installation methods include
[compiling `cue` from source](FIXME),
[using Homebrew](FIXME),
[using Docker](FIXME),
or [using Arch Linux's `pacman`](FIXME).

{{< step stepNumber="9" >}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.
Scroll down to the section labelled "Assets" and download the appropriate
release archive for your your computer. For example:
```text { title="TERMINAL" type="terminal" codeToCopy="YXJjaD0kKGNhc2UgIiQodW5hbWUgLW0pIiBpbiB4ODZfNjQpIGVjaG8gYW1kNjQgOzsgYWFyY2g2NCB8IGFybTY0KSBlY2hvIGFybTY0IDs7IGVzYWMpCmN1cmwgLXNTTCAtbyBjdWUtdjAuMTEuMi50Z3ogaHR0cHM6Ly9naXRodWIuY29tL2N1ZS1sYW5nL2N1ZS9yZWxlYXNlcy9kb3dubG9hZC92MC4xMS4yL2N1ZV92MC4xMS4yX2xpbnV4XyR7YXJjaH0udGFyLmd6" }
$ arch=$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)
$ curl -sSL -o cue-v0.11.2.tgz https://github.com/cue-lang/cue/releases/download/v0.11.2/cue_v0.11.2_linux_${arch}.tar.gz
```
{{< /step >}}

{{< step stepNumber="10" >}}
Extract the archive you just downloaded into `/usr/local/cue/`, removing any
installation already present. For example:
```text { title="TERMINAL" type="terminal" codeToCopy="cm0gLXJmIC91c3IvbG9jYWwvY3VlICYmIG1rZGlyIC1wIC91c3IvbG9jYWwvY3VlICYmIHRhciAtQyAvdXNyL2xvY2FsL2N1ZSAteHpmIGN1ZS12MC4xMS4yLnRneg==" }
$ rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-v0.11.2.tgz
```
You may need to run this command as root, or using `sudo`.
{{< /step >}}

{{< step stepNumber="11" >}}
Add `/usr/local/cue` to the PATH environment variable.
You can do this by adding the following line to your `$HOME/.profile` file (or
`/etc/profile` for a system-wide installation):
```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IFBBVEg9L3Vzci9sb2NhbC9jdWU6JFBBVEg=" }
$ export PATH=/usr/local/cue:$PATH
```
Changes made to a profile file may not apply until the next time you log into
your computer. To apply this change immediately in a specific command shell,
run the previous command directly in that shell.
{{< /step >}}

{{< step stepNumber="12" >}}
Test your installation by opening a new command prompt and running this command:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.2
...
```
You should see the latest version of CUE reported, as shown here.
{{< /step >}}
{{</tab>}}

{{</tabs>}}
