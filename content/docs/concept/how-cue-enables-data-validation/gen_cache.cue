package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "pg4SC+EDlpLIAtVIrLa3lrBTDOBmFw/D7o+/SAhOdJs="
								"data: bryn (broken)":           "bP5gCDBTllj5drS1R2NaVuREvhTfb6N3Hd/FjNScf1c="
								"data: charlie":                 "gi2uHRjE1pLV4TiTKMXCL/V2yKYPnok+PY2n/fKKHgw="
								"schema: CUE":                   "/18sUfS4H098rO6L8NXuyOy3kWnYqWADxzDkVttLI8k="
								"data: bryn (fixed)":            "YcGPEVsWLHwbx/paBjke1cDP9SnclQf9Mq7asxugGWc="
								"data: alex (reminder)":         "4hlqEvQgw0QMWDUJE03zgxc8DHIyb0xEGHLWkbsSEAU="
								"data: bryn (reminder)":         "G21NCfn0RT55CyAktJObVuZydPgbOnOzAt+577F4cEI="
								"data: charlie (reminder)":      "L246Z0Rmps6+GXYxv8TPQJWoZSCiX6DZn3Zc1/SnWDc="
								"schema: CUE (reminder)":        "LznhIbjKhEIPZKcAsVBa6ezQ7U1V7eWu44ndcmZkWkc="
								"policy: CUE (too restrictive)": "sgqiB+7jJL2j2n+owU3Aj4mWiWvm6iZeTuZF7r0dNkA="
								"policy: CUE (correct)":         "6PKBOwrrKgFJYy/0pT7LQb3TOnoXzWjCZZAvikT6O74="
								"schema.proto":                  "cImgRJ1s+6WiIaOr24NhYCB11pLkzozxkVwFwRT0y4c="
								"schema.json":                   "YJXJ+bgEDCfTKbNcZRfhNkCfoHrWishpDytqv56LfSU="
								"policy.cue":                    "w5IhS8sMFp+zg/dS6Iy0uz2jFjcYcvnBjz3t5RYVBRU="
								"data.yml (broken)":             "0jyGDrZYXZ9xBeNFki7stzvH7ZHj2lHviHqW1i26XEY="
								"data.yml (fixed)":              "1ZIGdXGfC5+BpohPM0QW3yAl40bnryYScV7u2jn35q0="
							}
							code: {
								constraints: "y8NpeyIsu8bBNDMj/opZfslhFT1jKpExh9Fbk5QPEVQ="
								definition:  "1Jnu5zz3zEes2k+eHnYPpX4KfQ+pA2OqOB5vQ2IlO08="
							}
							multi_step: {
								hash:       "ECCIT2E3MP6UAT5F2D38SDFSMI8D2JVG97OUG85OJUKPCO2AC290===="
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
