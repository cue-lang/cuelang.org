+++
title = "快速开始"
weight = 150
description = "在你机器上安装 CUE"
+++

由于 CUE 使用 Go 的包管理器，所以 Go API 可以使用。

可以通过以下方式安装 `cue` 二进制文件。

## 二进制方式安装

### 从 Github 下载

安装包支持多个操作系统，包括 Linux、Window、MacOS，可以在 [Github](https://github.com/cue-lang/cue/releases) 获取下载。

### 使用 homebrew 安装

另外，CUE 在 MacOS 和 Linux 上通过 brew 安装。

```
brew install cue-lang/tap/cue
```

### 在 Arch Linux 上安装

Arch Linux 上你可以通过下面的命令安装官方包：

```
pacman -S cuelang-bin
```

## 通过源码安装

### 依赖

Go 1.12 或更高版本 (下文会介绍如何安装 Go)

### 安装 CUE

<!-- Keep the following in sync with cmd/cue/cmd/testdata/script/install*.txt -->

如果你已经安装过 Go，可以通过下面命令安装：

```
GO111MODULE=on go get cuelang.org/go/cmd/cue
```

如果在使用 Go 1.16：

```
go install cuelang.org/go/cmd/cue@latest
```

以上命令会安装 `cue` 命令行工具。

### 安装 Go

#### 下载 Go

你可以在 https://golang.org/dl/ 下载 Windows、MacOS 或 Linux 的二进制安装包。

如果你使用的是其他的操作系统，你需要通过 Go 源码进行安装。

#### 安装 Go

按照  https://golang.org/doc/install#install 的说明进行安装。

确保 Go 二进制在你机器的 PATH，CUE 使用 Go modules，所以没必要设置 GOPATH。