package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "7/DcWZNWCZK8b96Uiz2ACY8vUKNnpY7Vg3uMSBuuPQw="
								"data: bryn (broken)":           "tMdqZnD3tJYeaLmaisA9FI+itd2YNRZ+hFVWHNiLQL0="
								"data: charlie":                 "1lSRvwxv2gO155OXLvU3xcRn7hIKvcMs08gh/rSgEv0="
								"schema: CUE":                   "UdK5aW8KY/4ku2XuZze02HhfNdAennQBBbbEnyW/MeA="
								"data: bryn (fixed)":            "sNSgjuLd0+e8rq6QBAMiLAF/hnCFTI8hBa9RKHAj+l8="
								"data: alex (reminder)":         "/J3JU0bqfeDLF+PpwuLFBv4g6DMrTSgvRBlzWCIK+50="
								"data: bryn (reminder)":         "r5oau+zGSadoPnFXaR87rBSNCc5lLoZymK/3eGwSqso="
								"data: charlie (reminder)":      "oWs7j96Lzk3/CPECIcdS10ahqoV8IrqTjYLdX5UYCZ0="
								"schema: CUE (reminder)":        "dQVlTghMjwi1Z4ngfhLfjTk/syPG4BX5KWrgv5qB4Uw="
								"policy: CUE (too restrictive)": "JlKKAKaURs+NtozqlUgKMht4/yHxduHNneItkPZwn3Y="
								"policy: CUE (correct)":         "SLraDNdDbvWu/qLpauKH2eerYawi36zlWmqN6MG/190="
								"schema.proto":                  "UM0xZ+nTtcyA8OxCdYxW8t/lKceIRetIoZUhFN8AJ5g="
								"schema.json":                   "kyfhjsqOAvO2qckUx5LDCVHU2lVXCULl5l/gBs+1/jc="
								"policy.cue":                    "WLUg73PHhad2OqwZpb21QiUYkjtbQZT5N+lT7RaMg80="
								"data.yml (broken)":             "Qf91e5Z+3oP3uTjku3O0yUAN3HC/mrzFe6dsDaXiwNw="
								"data.yml (fixed)":              "yRCtHzArA5lm/cYeHTpNPVNjXu1HKEeJIXrqBTt1Uds="
							}
							code: {
								constraints: "q4vQLyDy0bq/l8IkzROugoiE1i9NlrCmFqVNJe045Bo="
								definition:  "KT5Xg7gOv7Q6V98C6jxS8ETWWRCBs9N0x8GZZEmhFBY="
							}
							multi_step: {
								hash:       "9TSOBOBQO6BD5M8FLDKMMB4443IBPSP1U6I2MCB0B326UNUC39P0===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
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
