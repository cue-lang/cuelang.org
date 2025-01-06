---
title: "Test: code block accessing a pre-release cue command"
---

### Blank line between `env` and `exec`

{{{with code "en" "blank line before exec"}}}
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

exec cue version
stdout 'v0.12.0-alpha.1'
cmp stdout out
-- file.cue --
x: 1
-- out --
cue version v0.12.0-alpha.1

go version go1.23.2
      -buildmode exe
       -compiler gc
       -trimpath true
  DefaultGODEBUG asynctimerchan=1,gotypesalias=0,httpservecontentkeepheaders=1,tls3des=1,tlskyber=0,x509keypairleaf=0,x509negativeserial=1
     CGO_ENABLED 0
          GOARCH arm64
            GOOS linux
         GOARM64 v8.0
cue.lang.version v0.12.0
{{{end}}}
