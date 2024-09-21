package site
{
	content: {
		docs: {
			howto: {
				"place-data-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "ckBkSgOz91HJgbjlYuLqCa6E0HDYIZcXJdqoTZdqah4="
								"go program":       "s8fcb0oMO6VIQ2INDDkOr81sVJPHJzz1su+bG70ej3Y="
							}
							multi_step: {
								hash:       "I7VMIMNG4ASII9U05LFPT5KGRV85SJIVMAVJ4J2D4NE0E4NK5830===="
								scriptHash: "B2ACPKB2I7S9HP09ENHJFI1UHG1SO348DOOJ6DIDMB2U9GAQLNBG===="
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
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue export . input.json --path input: -e output --out text"
									exitCode: 0
									output: """
											Hello, Charlie!
											How's the weather in your part of the world?

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.10.0"
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
											Hello, Charlie!
											How's the weather in your part of the world?

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
