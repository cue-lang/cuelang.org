package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "Qwmm8vbr0e8VBq0R62utglzlY9objdAZjmFWNBYpxkg="
								"schema.cue":      "taQKhbxb1gzJqLXZ819+PPKOgyCHAYaI1QxbUEawXFs="
								good:              "OZXpps6vTyYS3u2DnYhJlswotgIgBLAhYJ+hqxdr4NM="
								bad:               "qtT3pMybTICIwTuWNaHmij1ma1hBOpI31SAaCzUXmhY="
								"main go program": "RF8aoRsFUkFEAkEvhdql++VWfSSNMvSkTWwUAb0qT20="
							}
							multi_step: {
								hash:       "SL13P2F2ARPFQFMJ58PAAKFP7TLSOO09G5B55SDNCTQMH2SGHNNG===="
								scriptHash: "VAM0KKSBM82C8RJUDTVK260NDDDGVAVCN7NILI2RD8P34T3T3VVG===="
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
											    ./schema.cue:10:8

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
											$schema:     "http://json-schema.org/draft-07/schema#"
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
									cmd:      "go get cuelang.org/go@v0.9.1"
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
