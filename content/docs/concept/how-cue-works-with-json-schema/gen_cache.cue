package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "hymUjw/fZDhzWA3pNQvK0hG+SJDr7XpUcfLv9AqBqWU="
								"schema.cue":      "hRM4y/YZc7KAAt7u+hIPCuWDTbQg9dE14cITp2rorrM="
								good:              "cljtXthlGIRWS57pRKP1kpOWAsxL7dtEeEg2pxWUkas="
								bad:               "6CYS4/HxCMcFwTQUAl9/UOnc8qgREeovExVjxgRYruM="
								"main go program": "XFORjOPs6HEqVsCm5CZhZVuJJJn6djnWbrNZYjP+4r0="
							}
							multi_step: {
								hash:       "TP4OK0I64FD2QQFGO5P7L8B53LS397BJ10K06DST70D90UEU3U30===="
								scriptHash: "00PMNUB0O1TO8KAKSMBHH9UAUMIUM16B4D8S3TJI5OTEV8JUR3M0===="
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
											    ./schema.cue:10:9

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
								}]
							}
						}
					}
				}
			}
		}
	}
}
