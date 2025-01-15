---
title: Installing cue
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

{{< step stepNumber="1" >}}
Open the [latest release](https://github.com/cue-lang/cue/releases/latest)
download page.

Fetch the compressed archive that's suitable for your computer, along with the
`checksums.txt` file:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VybCAtc1NMTyBodHRwczovL2dpdGh1Yi5jb20vY3VlLWxhbmcvY3VlL3JlbGVhc2VzL2Rvd25sb2FkL3YwLjExLjEvY3VlX3YwLjExLjFfbGludXhfYW1kNjQudGFyLmd6CmN1cmwgLXNTTE8gaHR0cHM6Ly9naXRodWIuY29tL2N1ZS1sYW5nL2N1ZS9yZWxlYXNlcy9kb3dubG9hZC92MC4xMS4xL2NoZWNrc3Vtcy50eHQ=" }
$ curl -sSLO https://github.com/cue-lang/cue/releases/download/v0.11.1/cue_v0.11.1_linux_amd64.tar.gz
$ curl -sSLO https://github.com/cue-lang/cue/releases/download/v0.11.1/checksums.txt
```

Here, we're using `curl` to download the correct files for installation on a
x86-64/AMD64 Linux computer, but you can use any download tool you like.
WSL can use either the Windows or Linux archive, but these instructions
demonstrate an installation using the Linux archive.
{{< /step >}}

{{< step stepNumber="2" >}}
Verify the downloaded file using its checksum in `checksums.txt`:
```text { title="TERMINAL" type="terminal" codeToCopy="Z3JlcCBsaW51eF9hbWQ2NCBjaGVja3N1bXMudHh0IHwgc2hhc3VtIC1hIDI1NiAtYw==" }
$ grep linux_amd64 checksums.txt | shasum -a 256 -c
cue_v0.11.1_linux_amd64.tar.gz: OK
```

This example is for our AMD64 Linux computer. If your computer is different
then modify the `grep` command to find the filename of the compressed archive
you downloaded.

If the verification fails and doesn't say your downloaded file is "OK" then **stop!**
[Get in touch](#TODO) with the team, and let us help make sure that the
security of your computer isn't at risk.
{{< /step >}}

{{< step stepNumber="3" >}}
Unpack the `cue` command from inside the compressed archive:
```text { title="TERMINAL" type="terminal" codeToCopy="dGFyIHh6ZiBjdWVfdjAuMTEuMV9saW51eF9hbWQ2NC50YXIuZ3ogY3Vl" }
$ tar xzf cue_v0.11.1_linux_amd64.tar.gz cue
```
{{< /step >}}

{{< step stepNumber="4" >}}
Move the `cue` command to a commonly-used directory for programs:
```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgJEhPTUUvYmluLwptdiBjdWUgJEhPTUUvYmluLw==" }
$ mkdir -p $HOME/bin/
$ mv cue $HOME/bin/
```
{{< /step >}}

{{< step stepNumber="5" >}}
Make sure the program directory is in your `PATH` setting so that you can
invoke `cue` from inside any directory:
```text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyAnZXhwb3J0IFBBVEg9JEhPTUUvYmluOiRQQVRIJyA+PiRIT01FLy5wcm9maWxl" }
$ echo 'export PATH=$HOME/bin:$PATH' >>$HOME/.profile
```
{{< /step >}}

{{< step stepNumber="6" >}}
Restart your terminal program to pick up the `PATH` setting changes, and check
you can run `cue` successfully:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.1
...
```
{{< /step >}}

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

{{< step stepNumber="7" >}}
Open PowerShell by press Win+X and selecting "Windows Terminal" or "PowerShell".

You can also search for "PowerShell" in the Start menu.
{{< /step >}}

{{< step stepNumber="8" >}}
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
{{< /step >}}

{{< step stepNumber="9" >}}
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
{{< /step >}}

{{< step stepNumber="10" >}}
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
{{< /step >}}

{{< step stepNumber="11" >}}
To make `cue.exe` accessible from any directory in PowerShell you need to add
its directory to the system’s PATH environment variable.

This example uses `C:\Tools` again, but you should update it to match the
directory you used in the previous step:
```text { title="TERMINAL" type="terminal"  }
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Tools", [System.EnvironmentVariableTarget]::Machine)
```
{{< /step >}}
{{< step stepNumber="12" >}}
Open a new PowerShell window to make sure the changes to the PATH have taken
effect.

In the new PowerShell session, run the following command to check if `cue.exe`
is accessible globally:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlLmV4ZSB2ZXJzaW9u" }
$ cue.exe version
cue version v0.11.1
...
```
{{< /step >}}
