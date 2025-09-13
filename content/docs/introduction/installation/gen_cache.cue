package site
{
	content: {
		docs: {
			introduction: {
				installation: {
					page: {
						cache: {
							multi_step: {
								hash:       "2G8NVL7655K7GJHNEK3DKV72T2GU52U0460I8LGEU1NNH6TM9VMG===="
								scriptHash: "9IOOM07G1PL8JHO9MKVIG3N5MTPFB6S5VMIO3BOSEKG7K9OCC560===="
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
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-alpha.1.0.20250913190050-8572198e1792
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go install cuelang.org/go/cmd/cue@latest"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go install cuelang.org/go/cmd/cue@master"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module go.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@latest"
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
