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

{{{with step}}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.
Scroll down to the section labelled "Assets" and download the appropriate
release archive for your your computer. For example:
{{{with script "en" "linux-download"}}}
arch=$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64|arm64) echo arm64 ;; esac)
curl -sSL -o cue-${CUELANG_CUE_LATEST}.tgz https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/cue_${CUELANG_CUE_LATEST}_linux_${arch}.tar.gz
{{{end}}}
{{{end}}}

{{{with step}}}
Extract the archive you just downloaded into `/usr/local/cue/`, removing any
installation already present. For example:
{{{with script "en" "linux-extract"}}}
rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-${CUELANG_CUE_LATEST}.tgz
{{{end}}}
You may need to run this command as root, or using `sudo`.
{{{end}}}

{{{with step}}}
Add `/usr/local/cue` to the PATH environment variable.
You can do this by adding the following line to your `$HOME/.profile` file (or
`/etc/profile` for a system-wide installation):
{{{with script "en" "linux-path"}}}
export PATH=/usr/local/cue:$PATH
{{{end}}}
Changes made to a profile file may not apply until the next time you log into
your computer. To apply this change immediately in a specific command shell,
run the previous command directly in that shell.
{{{end}}}

{{{with step}}}
{{{with _script_ "en" "HIDDEN: check downloaded cue is installed"}}}
which cue | grep "^/usr/local/cue/cue$"
{{{end}}}

Test your installation by opening a new command prompt and running this command:
{{{with script "en" "linux-cue-version"}}}
#ellipsis 1
cue version
{{{end}}}
You should see the latest version of CUE reported, as shown here.
{{{end}}}
{{</tab>}}

{{<tab name="MacOS">}}
The following instructions are intended for use on any MacOS version.
Alternative installation methods include
[compiling `cue` from source](FIXME),
or [using Homebrew](FIXME),

{{{with step}}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.
Scroll down to the section labelled "Assets" and download the appropriate
release archive for your your computer. For example:
{{{with script "en" "macos-download"}}}
arch=$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64|arm64) echo arm64 ;; esac)
curl -sSL -o cue-${CUELANG_CUE_LATEST}.tgz https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/cue_${CUELANG_CUE_LATEST}_darwin_${arch}.tar.gz
{{{end}}}
{{{end}}}

{{{with step}}}
Extract the archive you just downloaded into `/usr/local/cue/`, removing any
installation already present. For example:
{{{with script "en" "macos-extract"}}}
#norun
rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-${CUELANG_CUE_LATEST}.tgz
{{{end}}}
You may need to run this command as root, or using `sudo`.
{{{end}}}

{{{with step}}}
Add `/usr/local/cue` to the PATH environment variable.
You can do this by adding the following line to your `$HOME/.profile` file (or
`/etc/profile` for a system-wide installation):
{{{with script "en" "macos-path"}}}
export PATH=/usr/local/cue:$PATH
{{{end}}}
Changes made to a profile file may not apply until the next time you log into
your computer. To apply this change immediately in a specific command shell,
run the previous command directly in that shell.
{{{end}}}

{{{with step}}}
Test your installation by opening a new command prompt and running this command:
{{{with script "en" "macos-cue-version"}}}
#ellipsis 1
cue version
{{{end}}}
You should see the latest version of CUE reported, as shown here.
{{{end}}}
{{</tab>}}

{{<tab name="Windows Subsystem for Linux (WSL)">}}
The following instructions are intended for use on any Linux distribution that
Windows Subsystem for Linux can run, including its default -- Ubuntu.
Alternative installation methods include
[compiling `cue` from source](FIXME),
[using Homebrew](FIXME),
[using Docker](FIXME),
or [using Arch Linux's `pacman`](FIXME).

{{{with step}}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.
Scroll down to the section labelled "Assets" and download the appropriate
release archive for your your computer. For example:
{{{with script "en" "wsl-download"}}}
arch=$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64|arm64) echo arm64 ;; esac)
curl -sSL -o cue-${CUELANG_CUE_LATEST}.tgz https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/cue_${CUELANG_CUE_LATEST}_linux_${arch}.tar.gz
{{{end}}}
{{{end}}}

{{{with step}}}
Extract the archive you just downloaded into `/usr/local/cue/`, removing any
installation already present. For example:
{{{with script "en" "wsl-extract"}}}
rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-${CUELANG_CUE_LATEST}.tgz
{{{end}}}
You may need to run this command as root, or using `sudo`.
{{{end}}}

{{{with step}}}
Add `/usr/local/cue` to the PATH environment variable.
You can do this by adding the following line to your `$HOME/.profile` file (or
`/etc/profile` for a system-wide installation):
{{{with script "en" "wsl-path"}}}
export PATH=/usr/local/cue:$PATH
{{{end}}}
Changes made to a profile file may not apply until the next time you log into
your computer. To apply this change immediately in a specific command shell,
run the previous command directly in that shell.
{{{end}}}

{{{with step}}}
{{{with _script_ "en" "HIDDEN: wsl check downloaded cue is installed"}}}
which cue | grep "^/usr/local/cue/cue$"
{{{end}}}

Test your installation by opening a new command prompt and running this command:
{{{with script "en" "wsl-cue-version"}}}
#ellipsis 1
cue version
{{{end}}}
You should see the latest version of CUE reported, as shown here.
{{{end}}}
{{</tab>}}

{{</tabs>}}
