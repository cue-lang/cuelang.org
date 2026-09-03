package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "UA6NaZKKWEQWSIsQDE80N7KNGYG1JVJ1XMvvr/nEevE="
								"data: bryn (broken)":           "u0O153x5txwBcZVouPFXUNSc2cml7MKW8tXP3D4feq8="
								"data: charlie":                 "my2c6CTGUR1OcDnYFWXRe4Tj/Z0namBroNMwR35nAuQ="
								"schema: CUE":                   "mXcT/SVyAeig5L4TevKfTEFtQ6zfAQXCQrBdIdyREYY="
								"data: bryn (fixed)":            "nV+iGDCT7UvhnGRNpZqFzGS01+ce63DKlQY+X6JMzBg="
								"data: alex (reminder)":         "yrTVW064dyaZjPlyCgY1Y/+mz58p6nzUrXYnE30WmZI="
								"data: bryn (reminder)":         "kpYLA/Q+lAuroZixHFyrdWdiKvtIG/GE8kSFnt/RPS4="
								"data: charlie (reminder)":      "Wjf9ALhivqf/VRUACkvN43v9ckHqDyxsnl+N3hOjuZU="
								"schema: CUE (reminder)":        "qQgeP9BlcHB2NwH06LFyT9guv3fazuWqfDljshLPYGw="
								"policy: CUE (too restrictive)": "d0iqgeaAcIIhLwjO99G0IwOOA1Ev5P1EbMjz6mJtKjw="
								"policy: CUE (correct)":         "m7nni78lCukE3WzNVMnczZOo2gG8NAC9TtY/fP3RbTE="
								"schema.proto":                  "HJ9aJnQtIxstN4aD/Snat26QzjSS6qiYd/DpNXTxZ/k="
								"schema.json":                   "4qe3QkQ/SQBlxM0xw1ReIPUmldUccYRxaKBNOa7eA7E="
								"policy.cue":                    "u9H8tCfvTkNPUmiioByhDnoFa5fcFyTbq8w/lszduW8="
								"data.yml (broken)":             "k+YAtNwz6RWukuywfO9JHmptyAENNwB2MDNdR8l2m1s="
								"data.yml (fixed)":              "hU6fQXp7tYaXxEOax0cO21vwYL1pzucPwEkLw65Y68w="
							}
							code: {
								constraints: "4a2rFmM4C2Az6Mh7oAmCs8DvMRbi7yJru0endTeS27k="
								definition:  "ZptQCBvH9wcoEZf2MqIarkRU6MzwsYRPGl5SOQ7K69g="
							}
							multi_step: {
								hash:       "SKOT27HC0OGGS80OL6SAO76F2K8F5BQCAAPDHRSTHMP5EK1TRFTG===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
