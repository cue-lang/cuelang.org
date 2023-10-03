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
# we should really use a full-qualified domain here
go mod init example
{{{end}}}

{{{with upload "en" "go test code"}}}
-- main_test.go --
package main

import (
	"fmt"
	"math/rand"
	"strings"
	"testing"
	"time"
)

func TestRand(t *testing.T) {
	time.Sleep(time.Duration(rand.Int63n(10)) * time.Millisecond)
	words := strings.Fields("ink runs from the corners of my mouth")
	rand.Shuffle(len(words), func(i, j int) {
		words[i], words[j] = words[j], words[i]
	})
	fmt.Printf("%s\n", strings.Join(words, "\n"))
}
{{{end}}}

{{{with script "en" "go test"}}}
go test
{{{end}}}
