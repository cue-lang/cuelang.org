---
title: Go API basics
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This howto demonstrates getting started with CUE's Go API.

{{{with script "en" "go version"}}}
go version
{{{end}}}

{{{with script "en" "start module"}}}
go mod init example
{{{end}}}

{{{with upload "en" "go test code"}}}
-- main_test.go --
package main

import (
	"math/rand"
	"testing"
	"time"
)

func TestRand(t *testing.T) {
	time.Sleep(time.Duration(rand.Int63n(10)) * time.Millisecond)
}
{{{end}}}

{{{with script "en" "go test"}}}
go test
{{{end}}}
