package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "lhVIr16ojYLW+YF8obS4UgWrbYh669DGFAeKyvmvzwM="
								"data: bryn (broken)":           "mF+iSblva2JeT/Vu/TXdaqJcn41LJ6D3ujACumNPtHY="
								"data: charlie":                 "QHbofLn9qA0sx9WGyBJk0vWBd3/mxv6g/gvhTobRWLw="
								"schema: CUE":                   "2Hr0J5uKmecJQfoirJzw/5c4aEls+4vGoi7uwKqijck="
								"data: bryn (fixed)":            "5U7bJGDPPbnlWNavGhJQguExqYV1+thRKD1mimlILaM="
								"data: alex (reminder)":         "pbUwYg6Dp4zwp27NvF9VknrJtuMGI1auMPaNRsRTM9I="
								"data: bryn (reminder)":         "2pPVXVEnES3DzpIfg+8s/+VoEJ0FQ2VFHY9u0+3hN5g="
								"data: charlie (reminder)":      "OklWqKScCKAAFYunDSH0W6osTs56BAjncDw6OBJH0KI="
								"schema: CUE (reminder)":        "EFqa2Bev3aGcT7AXzo1bgmITDesfv0E+2xOrk7u8oaI="
								"policy: CUE (too restrictive)": "eLgG/BWIeM4xlZMalJK7dPPeGiFpcRResiLAzKNtfPg="
								"policy: CUE (correct)":         "5MEZl8DS+wUyMT/vYNUrdleSUlf3+NODR+PRHsrltPE="
								"schema.proto":                  "gV+upGhsgQPgiUTa3etLsV7dcs1o0EbfmGmXSZZ9BFs="
								"schema.json":                   "6UHzWRCuJJx+VeucvU9BbvrkF/Cbxhv9Ec+s2zTtPTE="
								"policy.cue":                    "Y2z95yUmqB74ppKOy2YcNeKnd7E4NY4H0/4fTn0favw="
								"data.yml (broken)":             "HjGOdOSfrd7XVht/ePUxxsB111vOpAQHD91f+dLHhVc="
								"data.yml (fixed)":              "KjhljoeNsu/H8n1hh86db8h8yOlpJaVd/3Exd89fkK8="
							}
							code: {
								constraints: "43KX8C+W4UrFSADBbqOfvjvIj2J+AsdzMESvHwPD6qE="
								definition:  "ynf4MhAcd8nRC+DVBe8FntBBxROhAoztXEiYY5E64x4="
							}
							multi_step: {
								hash:       "OKHE290U2D5A6GBBA9T2A8LCMT8OGLAV9AEF0DR7QJRDHV700J00===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
