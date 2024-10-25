package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								"x.cue":     "9zy/I6C0B+GPhPb/Cpa4WpHoWiA3aGw4d5eQaV8Zw0A="
								"data.yaml": "rRrZbIA/Cd+Ls9XXmijz9EnmnjESOttYDyOPR6UDRFY="
								"main.go":   "nnf2h41JByp6yt3NuzGur9u2SotivvgdZan+OV7X2fI="
							}
							multi_step: {
								hash:       "6IS85IPMH52D0M1DT7UUMNVHV0JU66USC343JMOFOJIIH38006D0===="
								scriptHash: "DSOPTI0FQR4APBU1U9I1MJBMPOQVPN7FLN4ELUOTCC0L44VB55K0===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export x.cue"
									exitCode: 1
									output: """
											x: incomplete value _
											y: x.f undefined as x is incomplete (type _):
											    ./x.cue:4:4

											"""
								}, {
									doc:      ""
									cmd:      "cue eval x.cue"
									exitCode: 0
									output: """
											x: _
											y: x.f

											"""
								}, {
									doc:      ""
									cmd:      "cue export x.cue data.yaml"
									exitCode: 0
									output: """
											{
											    "x": {
											        "f": 5
											    },
											    "y": 5
											}

											"""
								}, {
									doc:      ""
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module mod.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.10.1"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go run ."
									exitCode: 0
									output: """
											step1: {
											\tx: _
											\ty: x.f
											}
											step2: {
											\tx: {
											\t\tf: 5
											\t}
											}
											res: {
											\tx: {
											\t\tf: 5
											\t}
											\ty: 5
											}

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
									exitCode: 0
									output: """
											...

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
