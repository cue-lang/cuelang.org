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
								hash:       "34HSKEUU2SFB4T6B6F0K358TUGDVDKCP9GPHI8KINADGTOO4EN7G===="
								scriptHash: "P9SKDOQRS3VB7RBERCPFBESGQC7961HQTGP14HBRJQB1DQ1DD530===="
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
