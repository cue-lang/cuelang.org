package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "QSECp6WbxF5JLqjrQ+b8oFtHui+ZaoTqnAgaX+IchL0="
								"data: bryn (broken)":           "KXg11WoWmc7UBEOAvnKqcPEhpsEwHV82aG2sVFMlc0s="
								"data: charlie":                 "DG0XpNPTmeU/z7KgfrEUMmITgvBRLg1dy4p2DY9B0xM="
								"schema: CUE":                   "sNOo9IxC46c4eMQNpRLbfGh3gR3yKGzoFiTEnBKTIxk="
								"data: bryn (fixed)":            "xizmT6/stv3JRPR1BiZ6Exk6BJvWWD3On3p8O4obXPI="
								"data: alex (reminder)":         "zmDBI6yWXc+DZuq0CeQ37zQJ5DukdH7Ng14c8Nnv+2U="
								"data: bryn (reminder)":         "ujCd1hXb7okPVpA3O1e6W9B7Z9VOlHV1I8Qi1jzwTQc="
								"data: charlie (reminder)":      "fHecSRRMpq9hjg5vFLTq8AK5B/o3hnHeuczYLmwMViE="
								"schema: CUE (reminder)":        "pO5Q2Tacx67ZsS3Jw2papVKzURIPSByiunwG0FSY6Zw="
								"policy: CUE (too restrictive)": "psSYPLjU+CrwmP8PvHxzwIH/GVU6nXg92uy+S/y/DTI="
								"policy: CUE (correct)":         "eO1Z8mAGJIik4Rvs0qb+EP6lgCC+JAc4m1+TLSpTcug="
								"schema.proto":                  "lWO4crZBOf3xyWnSAprdeGZ2gZavSq2doGbfSR3DOb8="
								"schema.json":                   "DfITFToph9d7mBPUDTUeewbAeIdi07yKHnDBywZgkpY="
								"policy.cue":                    "gqhwJbpGmVqEwTGdo9NzSdKcrj58IbnUO/BPCCAWo10="
								"data.yml (broken)":             "Bw35ftyqhK0f1zkRi7xeCppsOCIRP3CfcP+NOLwqCtQ="
								"data.yml (fixed)":              "BXGFxvEtrIHxgSP8pFgmMDXz8QpNbvBWQA/Yl81YOA0="
							}
							code: {
								constraints: "oI3NbeAL54GTm6K/sT2TX5f4tkQ49P8dbruXgCQzxbI="
								definition:  "rl++0K3Hu6pPADni7WIATqufMIw0lHn2TmJ1Ba9pVh4="
							}
							multi_step: {
								hash:       "VSM9A61C75IOJ6U98JENL4UCAN6MQ6NLCUODBFNMASRMKJ5IJIM0===="
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
											    ./schema.json:9:21
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
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
