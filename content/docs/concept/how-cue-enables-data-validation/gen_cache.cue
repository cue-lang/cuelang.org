package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "1RzrjazO3JuWJ1DR2ij/pBHcKQVART2NinW3w/bj15M="
								"data: bryn (broken)":           "/WSJlFBWGubyg1Bn8A/C4PovZZXjWCvsA26wi2zNAVQ="
								"data: charlie":                 "Ry9HqKvQx0GL2qCyM02HGwD6r9yOnvqxcRxJztgvjzg="
								"schema: CUE":                   "U8w9o6EZtjH7+tj4x4duoFBobdkW6t8wxnZ8it4IM+o="
								"data: bryn (fixed)":            "mM90c5yMrdhHU5EFYuLUgJt3aPDXeOrR7tV3Opc/Rj8="
								"data: alex (reminder)":         "HDsFx/WY6tC9cSrDyJvvBuYDJzZs7dnmz1IzDowuwno="
								"data: bryn (reminder)":         "+5PdhY0uL4hOEie0oBY/7lRvT2hzYzwqgQ7Krp8XIRw="
								"data: charlie (reminder)":      "go9Xvqku9CYhUQIEdKe/yu0UKwyvU0zBKq8NO7tKE+8="
								"schema: CUE (reminder)":        "/l33al4WAgRPSSq/rMGf4GP6PN08Ra5D4XnRbrgzZ1g="
								"policy: CUE (too restrictive)": "+QXCfAz7i5HUXoViCBG7v5csk3hwUVg4UJdhMzEXUAk="
								"policy: CUE (correct)":         "AMFns2K5Ms6Hjrm6eLmFFiLbXBpuX32JW7RRFwnmRi8="
								"schema.proto":                  "6Ly9IR8lv/Pb6u54tJs3qHoPfRrry7dsv+MTfGLq1ec="
								"schema.json":                   "ja2dSrlbvcHBCI/MqDMRljaFBAIqJ4R9N3xrAdLh94g="
								"policy.cue":                    "/BXsw5Kea2cK8coRnVnJXVH8SBNWgvdK8eKf1pgOC/M="
								"data.yml (broken)":             "/w43Nw2nlZ8/gWYAQg2nNyO/B01cCyc18gTqQCZt804="
								"data.yml (fixed)":              "j5694BdSwVlu4PWGcyD7sYvoLcgkLWT2Ew4ZIUjV5UA="
							}
							code: {
								constraints: "eTv9FI2fmtAN5ylDwi3pWFaqwrnZoZyjU9qIhg2IEVE="
								definition:  "ud3fmwuLjueW0qzpWO49eJj41YSPgGOdaY/Vfz+CgVc="
							}
							multi_step: {
								hash:       "CG37Q4R0EL3F3RP0VG1B1QC2A1B2KHQ1K7T7T1IMO445PVJM6RHG===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
