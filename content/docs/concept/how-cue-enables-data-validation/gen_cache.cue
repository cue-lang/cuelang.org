package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "D+fsPkxDlZ+fjy/iSbmdXJiZdTozSi+GI5JXrQd+WNY="
								"data: bryn (broken)":           "4C+lQi8M7mRSbfUrNW4eNka8D4Lirbx0o9iAFxHxoQI="
								"data: charlie":                 "ImSCVfEISp+2DFyyIbjgew1Rym/WjIRLZoqobkXtVt0="
								"schema: CUE":                   "stig9QVlcDVEtxgyNsLCyNcRNxf4T+j6NAOM4+exiU8="
								"data: bryn (fixed)":            "41aFWoCtw/nUM0nv6skCsOmjeqRIEsCQjSnZbIAczr0="
								"data: alex (reminder)":         "/Z2yTQzF9uKs9I+277+BRHgQ31is1xxBK7SaaBpQCgs="
								"data: bryn (reminder)":         "gQP8eQxQ0WW2u1hdfY67efVdcUIZjwX7EP3rCrVO7kA="
								"data: charlie (reminder)":      "26NvWDLczLh5hofW21A2RVvRGY/r2KV0OoSNE+HraBI="
								"schema: CUE (reminder)":        "kVxvgXm8z9FswAt2NsVEndl6ko1Im8p+DXwb7YMVX1I="
								"policy: CUE (too restrictive)": "5CuoNKG1+ydHf5wYc0z8m6d6nsLbuTX7Fu6+rhz/SL4="
								"policy: CUE (correct)":         "PBocwgl48jHAWT28RVAHMIznzI9l0edRzUdsOQD7WcM="
								"schema.proto":                  "OGE5FGsjyCs9b7DCIxB3a3LImSl9Ql/KudHw5a3zfYY="
								"schema.json":                   "MZNueGBkaCdf+wZYluU1gjIZXlNeSLVRh1z5y5Lw8S8="
								"policy.cue":                    "4xeCKKdR1zXrm7R7zS1t4tqZHTXkuyYwRxlE+P9bIFQ="
								"data.yml (broken)":             "D1mEV4kR03c041iDK38HJOKsB3INa5u4r/QeWZDERWk="
								"data.yml (fixed)":              "hnKHOznu6otdwKhr2R7TFLUKFNnq5tXdgwHxyZ8/mIY="
							}
							code: {
								constraints: "xXS51ARt/jcYdjpDxDibpiq1vgKyDJ7JldJ02UmaIr4="
								definition:  "H2p2DjEJxVjqoGJEv9G5xzIOzCiiXYUzA8KjX0M159g="
							}
							multi_step: {
								hash:       "P6NHB6OI6KOJATO7NED3EH9U4F6Q97CI6FPPLFBQOE5EL20VL9CG===="
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
