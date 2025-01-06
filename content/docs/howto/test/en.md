---
title: "Test: code block accessing a pre-release cue command"
---

### No blank line between `env` and `exec`

{{{with code "en" "no blank line before exec"}}}
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
exec cue version
cmp stdout out
-- file.cue --
x: 1
-- out --
cue version v0.11.1

go version go1.23.2
      -buildmode exe
       -compiler gc
       -trimpath true
  DefaultGODEBUG asynctimerchan=1,gotypesalias=0,httpservecontentkeepheaders=1,tls3des=1,tlskyber=0,x509keypairleaf=0,x509negativeserial=1
     CGO_ENABLED 0
          GOARCH amd64
            GOOS linux
         GOAMD64 v1
cue.lang.version v0.11.1
{{{end}}}

### Blank line between `env` and `exec`

{{{with code "en" "blank line before exec"}}}
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

exec cue version
cmp stdout out
-- file.cue --
x: 1
-- out --
cue version v0.11.1

go version go1.23.2
      -buildmode exe
       -compiler gc
       -trimpath true
  DefaultGODEBUG asynctimerchan=1,gotypesalias=0,httpservecontentkeepheaders=1,tls3des=1,tlskyber=0,x509keypairleaf=0,x509negativeserial=1
     CGO_ENABLED 0
          GOARCH amd64
            GOOS linux
         GOAMD64 v1
cue.lang.version v0.11.1
{{{end}}}
