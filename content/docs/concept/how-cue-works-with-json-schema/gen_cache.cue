package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "9GysRY05VV7EhUTi3I0teIxq9c00zOLFEI4BUKNVnh8="
								"schema.cue":      "NPLcSFI5ZawLfzjZ/Bu/fUzgxamFoSlC4lW8ehDEUxw="
								good:              "+H7nfWFJ8oqcALsn6XiLPspF+me1FzKS0E0nh3irBP8="
								bad:               "8cdxVXTslBAdVHVTVRz+aDYmG5u8ShhQcChjHFfrK7o="
								"main go program": "/5bvbwp/XmtqCoL5prntzleBwRz89vK7KYbl4W1vZB4="
							}
							multi_step: {
								hash:       "QGOKRS75K1BGST7OCM47SLA08AEOQJPKVE92I1SU3A4IA2QP3070===="
								scriptHash: "K8P2K9ARENNNU45COQ81H3NU9Q6DCPBO5SB6DQKPQKBNBIJ43OD0===="
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
									cmd:      "cue import -l '#Person:' schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#Person' schema.cue good.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
											    ./bad.json:2:13
											    ./schema.cue:11:9

											"""
								}, {
									doc:      ""
									cmd:      "cue vet schema.json good.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
											    ./bad.json:2:13
											    ./schema.json:13:13

											"""
								}, {
									doc:      "#ellipsis 4"
									cmd:      "cue def json: schema.json"
									exitCode: 0
									output: """
											$schema:     "https://json-schema.org/draft/2020-12/schema"
											type:        "object"
											title:       "Main Person schema."
											description: "This schema defines a person."
											...

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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
									cmd:      "go run . schema.json good.json"
									exitCode: 0
									output: """
											{
											\tname:    "Dorothy Cartwright"
											\taddress: "Ripon, North Yorkshire"
											}

											"""
								}, {
									doc:      ""
									cmd:      "go run . schema.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
											    bad.json:2:13
											    schema.json:13:13
											exit status 1

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
