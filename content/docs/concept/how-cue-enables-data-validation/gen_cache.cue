package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "lowaEPe9kY8wblhCH5y3aMIzWQdB5B2YKPjA92dqMsU="
								"data: bryn (broken)":           "eeufpxqsrNYeFmSclEXUjHjdl3NTabHDG4BoPOMZAVw="
								"data: charlie":                 "R9UMEBz+UMuPusqvsSU5dqvrYvcvbb3OkGE+qXW6X48="
								"schema: CUE":                   "a+mCgue770ETYiWacStPiXeO37Vq2Fqt0afDKxW7oKY="
								"data: bryn (fixed)":            "wIA5gdPBIGAbh+LfwY55J4no/06zIC7vxOwrT5lsPaU="
								"data: alex (reminder)":         "2xoWRQd0+C9oVBNiOd7uSqMLSb5Qj5KoKXXxoVI7BDc="
								"data: bryn (reminder)":         "d3liR8yheji3s1ZrTontYPZIcgYf2MVbG9xnvgJYkxE="
								"data: charlie (reminder)":      "Me0DaD5Hstyv3/2nKiMcKe2lad3J3zNezUKPauqn0iw="
								"schema: CUE (reminder)":        "/R9awJiNbCGyStJHzRqjXStUPdxpY8ZkHWw4mtUXzv4="
								"policy: CUE (too restrictive)": "GN/FsM5QTtR4Gu23dwB5M5EF9V91BpFx/YkzO2P2KFg="
								"policy: CUE (correct)":         "Gv9z4ufglWBHMvqWlAh2jP/otD3xyHS2J0PAigCyv20="
								"schema.proto":                  "omnPyKNXCm198DOJgxuPO5bLbauKMlCL08j8kNfqSv8="
								"schema.json":                   "4lvjYcQ/6Oz02r/hJNQ7vlOFRMIBb2Mj5GKNmStRbjg="
								"policy.cue":                    "9vFpVaMsEUzaZf4HfW6+MDvHVUCkCWOYrEC3V1CHo4I="
								"data.yml (broken)":             "sHaPc8bGCwNY8YiJqevGgz39lGoL/m3eSOsUds1qDpI="
								"data.yml (fixed)":              "kSpz236IVaKHkinvcccQImM8evzaQrc5dJnGdWrPRik="
							}
							code: {
								constraints: "aOYewwQgyS7RvfK4jA72wKKA28bcz1dgcm79vqJftDk="
								definition:  "z1jMayLWdDs/MUA/bGekiuoLMrbbsKfNhTlSB78hpq4="
							}
							multi_step: {
								hash:       "PO0EOM9A6BDOSOLAN3DRTOCNE91PET5SAASJF12SAJVIDMIKU6E0===="
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
