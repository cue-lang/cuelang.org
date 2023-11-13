+++
title = "快速开始"
weight = 150
description = "在你机器上安装 CUE"
+++

CUE 的 Go APIs 在 [`cuelang.org/go`](https://pkg.go.dev/cuelang.org/go) 包中定义，
所以通过 [Go 的原生依赖管理](https://go.dev/doc/modules/managing-dependencies) 可以直接进行引用。

可以通过以下方式安装 `cue` 二进制文件。

## 通过官方二进制安装 CUE

### 从 Github 下载

安装包支持多个操作系统，包括 Linux、Window、macOS，可以在 [CUE官方网站](/releases) 下载。

### 使用 homebrew 安装

另外，CUE 在 MacOS 和 Linux 上通过 brew 安装。

```
brew install cue
```

### 在 Arch Linux 上安装

Arch Linux 上你可以通过下面的命令安装官方包：

```
pacman -S cuelang-bin
```

## 通过源码安装

### 依赖

Go 1.16 或更高版本 (下文会介绍如何安装 Go)

### 安装 CUE

安装 `cue` 命令行工具：

```
go install cuelang.org/go/cmd/cue@latest
```

### 安装 Go

#### 下载 Go

你可以在 https://golang.org/dl/ 下载 Windows、MacOS 或 Linux 的二进制安装包。

如果你使用的是其他的操作系统，你需要通过 Go 源码进行安装。

#### 安装 Go

按照 https://go.dev/doc/install 的说明进行安装。
确保 Go 二进制在你机器的 PATH，然后按照上文介绍安装 CUE。
