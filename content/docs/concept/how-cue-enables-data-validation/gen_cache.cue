package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "5/OmnivGWSGCf8mIX52jr5qzE64y4XqbjfeiVGneQRU="
								"data: bryn (broken)":           "73cA27PMJ5nxZrhwqyLNJQF/rE2rK2FnFmRcaC1nTFg="
								"data: charlie":                 "jdzV2ttaj0gTJd4LD7+5KXzt10jce8jxOCSmyybkUy8="
								"schema: CUE":                   "pUNggD/YDdMdiYLjV1U5ykzgGiH8EFPy3agB2SX1nkQ="
								"data: bryn (fixed)":            "+0OpNpezm+DNuGO+MYUMHyVaRGrL0KseVFNt+WmS9Ko="
								"data: alex (reminder)":         "U51PJXcV8xeE6wjjw5nTLmoKojyqWrcEG3yw2//HMLA="
								"data: bryn (reminder)":         "S3/yS+rbURpyIVaXYVuqlbCq8GgpB20miXxpyRa5WXM="
								"data: charlie (reminder)":      "4v6w4WCtCICIlOrL/Su+/TrDoklJzUZh7dQqM40BiSk="
								"schema: CUE (reminder)":        "Qu6kTTWjO+dcvZVxD38vwsaAoQB+4D7weN94YsAz/nQ="
								"policy: CUE (too restrictive)": "3gGkCDy2PuguR+Fl88+T9LHKg8Relxqo7uyfNQeBzz4="
								"policy: CUE (correct)":         "LjZduPUQuenyj9QoPoHitVCB5bYHq7aXRdowJbUIOQk="
								"schema.proto":                  "poU6Qedat4MQVMlKU7M1Ge6sCF7MpRmwYvLmGYhQIho="
								"schema.json":                   "pGmlH5itJp4XCDrFL33yLhiDtu/8Mu+7bhDYkkJyOP4="
								"policy.cue":                    "eH8Yw7+LwJ6w+SU44Tp+aHOWzzkBxT/txyJRFdc3IvY="
								"data.yml (broken)":             "doAQjhlywevUpml9i88D8VG7K5RtDKr0Zd1cZBTwkLI="
								"data.yml (fixed)":              "lPHEaRcbQDrvVLIMKKfLA4GEPNE+8qmpfOa6w/nqmPg="
							}
							code: {
								constraints: "WTup6qMZKTRNZvJOhiGBSUiPGC8HQtV8XTVdiQCcDj4="
								definition:  "v0Yye0KDvAjPsstAWhFoi0t7pFWGEzVIKHT3mxInpSw="
							}
							multi_step: {
								hash:       "9TU2P4Q85S82I3DRC1DC8HDU6P8AABQEV7PLSE70QFVNGOHDRDCG===="
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
