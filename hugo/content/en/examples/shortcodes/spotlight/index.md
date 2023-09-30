---
title: Spotlight
weight: 25
---

Use this shortcode to e.g. spotlight the prerequisites or related content.

In order to spotlight some content, you can use `{{</* spotlight */>}}`.

```
{{</* spotlight */>}}

## Prerequisites

- **A tool to edit text files.** Any text editor you have will be fine. Some popular text editors are VSCode, Vim, Nano, and Emacs; but if you need to use Notepad that will work fine.
- **A command terminal.** `cue` works well using any terminal on Linux and Mac, and on PowerShell or `cmd.exe` in Windows.

{{</* /spotlight */>}}
```

The rendered output looks like this:

{{< spotlight >}}

## Prerequisites

-   **A tool to edit text files.** Any text editor you have will be fine. Some popular text editors are VSCode, Vim, Nano, and Emacs; but if you need to use Notepad that will work fine.
-   **A command terminal.** `cue` works well using any terminal on Linux and Mac, and on PowerShell or `cmd.exe` in Windows.

{{< /spotlight >}}

## Attributes

title
: optional - add a title width a bottom border. The title gets an h2, therefore it is recommended that when you are using headings inside the spotlight you only use h3-6.

theme
: options - default is `blue`, other option is `yellow`.

Also, if the spotlight is the last part of the content (like when it is used for the related content), there is more whitespace above the spotlight.

## Example

```
{{</* spotlight title="Related content" theme="yellow" */>}}

### Prerequisites

- **A tool to edit text files.** Any text editor you have will be fine. Some popular text editors are VSCode, Vim, Nano, and Emacs; but if you need to use Notepad that will work fine.
- **A command terminal.** `cue` works well using any terminal on Linux and Mac, and on PowerShell or `cmd.exe` in Windows.

{{</* /spotlight */>}}
```

The rendered output looks like this:

{{< spotlight title="Related content" theme="yellow" >}}

### Prerequisites

-   **A tool to edit text files.** Any text editor you have will be fine. Some popular text editors are VSCode, Vim, Nano, and Emacs; but if you need to use Notepad that will work fine.
-   **A command terminal.** `cue` works well using any terminal on Linux and Mac, and on PowerShell or `cmd.exe` in Windows.

{{< /spotlight >}}
