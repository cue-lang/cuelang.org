---
title: Getting Started - Installing cue
draft: true
no_index: true
---

The `cue` command is the advanced tooling that unlocks the powerful combination
of CUE + Central Registry.

It's easy to get started running `cue` on your computer: just choose one of
these options and follow the steps ...

- [Installation on Linux, MacOS, or Windows Subsystem for Linux](#installation-on-linux-macos-or-windows-subsystem-for-linux)
- [Installation on Windows PowerShell](#installation-on-windows-powershell)

## Installation on Linux, MacOS, or Windows Subsystem for Linux

To install the `cue` command on a Linux, MacOS, or Windows Subsystem for Linux
(WSL) operating system, follow these instructions:

{{{with step}}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.

Fetch the compressed archive that's suitable for your computer, along with the
`checksums.txt` file:
{{{with script "en" "download"}}}
curl -sSLO https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/cue_${CUELANG_CUE_LATEST}_linux_amd64.tar.gz
curl -sSLO https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/checksums.txt
{{{end}}}

Here, we're using `curl` to download the correct files for installation on a
x86-64/AMD64 Linux computer, but you can use any download tool you like.
WSL can use either the Windows or Linux archive, but these instructions
demonstrate an installation using the Linux archive.
{{{end}}}

{{{with step}}}
Verify the downloaded file using its checksum in `checksums.txt`:
{{{with script "en" "verify"}}}
grep linux_amd64 checksums.txt | shasum -a 256 -c
{{{end}}}

This example is for our AMD64 Linux computer. If your computer is different
then modify the `grep` command to find the filename of the compressed archive
you downloaded.

If the verification fails and doesn't say your downloaded file is "OK" then **stop!**
[Get in touch](#TODO) with the team, and let us help make sure that the
security of your computer isn't at risk.
{{{end}}}

{{{with step}}}
Unpack the `cue` command from inside the compressed archive:
{{{with script "en" "unpack"}}}
tar xzf cue_${CUELANG_CUE_LATEST}_linux_amd64.tar.gz cue
{{{end}}}
{{{end}}}

{{{with step}}}
Move the `cue` command to a commonly-used directory for programs:
{{{with script "en" "mv"}}}
mkdir -p $HOME/bin/
mv cue $HOME/bin/
{{{end}}}
{{{end}}}

{{{with step}}}
Make sure the program directory is in your `PATH` setting so that you can
invoke `cue` from inside any directory:
{{{with script "en" "profile"}}}
echo 'export PATH=$HOME/bin:$PATH' >>$HOME/.profile
{{{end}}}
{{{end}}}

{{{with step}}}
Restart your terminal program to pick up the `PATH` setting changes, and check
you can run `cue` successfully:
{{{with script "en" "cue version"}}}
#This isn't a true test of the PATH changes, above, as they're a little fiddly to test inside the preprocessor.
#ellipsis 1
cue version
{{{end}}}
{{{end}}}

## Installation on Windows PowerShell

FIXME: I don't /think/ this can be written using PowerShell, given the
preprocessor's current facilities.

Idea: move to a more narrative:
- "download the file to your computer"
- "unpack the `cue.exe` file using your usual zip file program"
- ... style?

---

<!--
These instructions are adapted from a ChatGPT response to the following prompt,
modified to match the presentation, style, and flow of the previous section:

  Please give me step by step instructions for a Windows computer running PowerShell, explaining:
  - how to download the zip file at
	https://github.com/cue-lang/cue/releases/download/v0.11.1/cue_v0.11.1_windows_amd64.zip
	that contains a command-line tool called "cue.exe"
  - how to download the "checksums.txt" file from
	https://github.com/cue-lang/cue/releases/download/v0.11.1/checksums.txt
    that contains the SHA256 checksum of several files including the zip file
  - how to check the SHA256 checksum of the downloaded zip file
  - how to unpack the "cue.exe" tool
  - how to persistently add the tool to the PowerShell's path setting so that
    "cue.exe" can be invoked from any directory.
-->

To install the `cue.exe` command on a Windows computer using PowerShell, follow
these instructions:

{{{with step}}}
Open PowerShell by press Win+X and selecting "Windows Terminal" or "PowerShell".

You can also search for "PowerShell" in the Start menu.
{{{end}}}

{{{with step}}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.

Fetch the zip file that's suitable for your computer, along with the
`checksums.txt` file:
```text { title="TERMINAL" type="terminal"  }
Invoke-WebRequest -Uri "https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/cue_${CUELANG_CUE_LATEST}_windows_amd64.zip" -OutFile "cue_${CUELANG_CUE_LATEST}_windows_amd64.zip"
Invoke-WebRequest -Uri "https://github.com/cue-lang/cue/releases/download/${CUELANG_CUE_LATEST}/checksums.txt" -OutFile "checksums.txt"
```

**FIXME: we can't get CUELANG_CUE_LATEST interpolation outside a real `script`
block; but when using script blocks (even marked with `#norun`) the parsing
fails on certain PowerShell commands - e.g. the checksum conditional in the
next step.**
{{{end}}}

{{{with step}}}
Verify the downloaded zip file using its checksum in `checksums.txt`:

```text { title="TERMINAL" type="terminal"  }
$checksum = Select-String -Path "checksums.txt" -Pattern "cue_${CUELANG_CUE_LATEST}_windows_amd64.zip" | ForEach-Object { $_.Line.Split(" ")[0] }
$fileChecksum = Get-FileHash -Path "cue_${CUELANG_CUE_LATEST}_windows_amd64.zip" -Algorithm SHA256 | Select-Object -ExpandProperty Hash
if ($fileChecksum -eq $checksum) {
    Write-Host "Checksum matches!"
} else {
    Write-Host "Checksum does not match!"
}
```

This example is for our AMD64 Windows computer. If your Windows computer has a
different architecture then modify both commands to reflect the name of the zip
file you downloaded.

If the verification fails and doesn't say your checksum matches then **stop!**
[Get in touch](#TODO) with the team, and let us help make sure that the
security of your computer isn't at risk.
{{{end}}}

{{{with step}}}
Unpack the `cue.exe` command from inside the zip file into a directory of your
choice.

Here, we choose the directory `C:\Tools`:

```text { title="TERMINAL" type="terminal"  }
mkdir C:\Tools
Expand-Archive -Path "cue_${CUELANG_CUE_LATEST}_windows_amd64.zip" -DestinationPath "C:\Tools"
Get-ChildItem "C:\Tools"
```

This example uses the `Expand-Archive` command, which extracts all the files
contained inside a zip file. The last command should list the `cue.exe` file,
along with some additional documentation files that you can safely delete.
{{{end}}}

{{{with step}}}
To make `cue.exe` accessible from any directory in PowerShell you need to add
its directory to the system’s PATH environment variable.

This example uses `C:\Tools` again, but you should update it to match the
directory you used in the previous step:
```text { title="TERMINAL" type="terminal"  }
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools", [System.EnvironmentVariableTarget]::Machine)
```
{{{end}}}

{{{with _script_ "en" "HIDDEN: set up cue.exe"}}}
mkdir -p $HOME/bin
export PATH=$HOME/bin:$PATH
ln -s $HOME/bin/cue $HOME/bin/cue.exe
{{{end}}}
{{{with step}}}
Open a new PowerShell window to make sure the changes to the PATH have taken
effect.

In the new PowerShell session, run the following command to check if `cue.exe`
is accessible globally:
{{{with script "en" "windows cue version"}}}
#ellipsis 1
cue.exe version
{{{end}}}
{{{end}}}
