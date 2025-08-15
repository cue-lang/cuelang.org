package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "HPu80YNGBenY3RKySkWHnCt1ltXZaEUXChV/Y0j6q9o="
								"data: bryn (broken)":           "J+wIWTyZY8wEeJnFLMqF3hVYi/UOtkdVgc+VNHjxfCQ="
								"data: charlie":                 "4NH3RdAt6En9HS7OVwXbM/oNs4zzrIsGXpLbK75Kj/s="
								"schema: CUE":                   "PAnZ2Zl+ythuaUg3iDit7NVH2Q434zFGokIBIscvCLg="
								"data: bryn (fixed)":            "ErJxfkGXSe4xst26MU78swTAtQ/pov5Zl2BDQQDaWPs="
								"data: alex (reminder)":         "RejONsgZMIrPlVmwA9P6mjV0W3MIVwFqIAsL/mpXof4="
								"data: bryn (reminder)":         "sxJiRTWtOZJ+h8M7FgwUrLu/IfngPHVKZIrAa0CgfHc="
								"data: charlie (reminder)":      "SC8n/p498f2w9TmUqmNi4gFtwQ3ntqYGwDnH3ZYrlyU="
								"schema: CUE (reminder)":        "UyEhuKPepmVUyHUnie6Lnslbv0f8qbS87KamVPqYUoI="
								"policy: CUE (too restrictive)": "9S7qvswpOBqhpO5SWcVfxEp3f/Xk1LX40K1qjrEd2A8="
								"policy: CUE (correct)":         "Yke4zgUZv3cuE94pXwPP3IDAQWMwk8lMhbEyBgtJ4BY="
								"schema.proto":                  "33NCZtSntp9QVtLJT9Zfc4GYSnHrOI059JQk2s0Pebs="
								"schema.json":                   "Kf3HA9Qqb4puo0hWwd1SEWi9leR1WIoe5ckJIgdlWOU="
								"policy.cue":                    "G+xcNJ5mArkQmRqpZc9nH5897n9UeXl4OwAawRFy8K0="
								"data.yml (broken)":             "t1RKCwWsZkdNEB3xWUBsbOBtrMrtnlr1D4lJmYY5mh8="
								"data.yml (fixed)":              "cTIulzzYfUL1a6h27pR70sKeYTG3oUZt1s1VUdMqd6k="
							}
							code: {
								constraints: "0WRtT17ljx1DXXQJDZnIdSGtpiqtyAvcXL5QM5Sqs+I="
								definition:  "NRpb7yjptOx+ngrmYxx6b3cXBS+DRhT7vJu0j3s+9fg="
							}
							multi_step: {
								hash:       "0GH36A5LA1IPD4NV0LN81B848U89K8MGFLO8SBDK2AELVUQ8PDBG===="
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
