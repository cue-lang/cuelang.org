package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "bSdimxStnrNFpl5ZiB6yD56SOsFDegtBCktjlHkGGBM="
								"data: bryn (broken)":           "c6hxo5cIhEknpH9LFoTAzUD0HzQMKQZazC9VTrqE+NM="
								"data: charlie":                 "pCEdLY68/DbVjAHWTJ4o4ZgcZxgMi2iKeeFKq2tUdU8="
								"schema: CUE":                   "h08z86pzQSCYPQGL3tn/PmX5lqyzgJMSI3yHU1qLSVo="
								"data: bryn (fixed)":            "HY1uh9PBqSPPgEpyl53dniTnwrTQhxcggZ+27YbTbDg="
								"data: alex (reminder)":         "AJ2BmirP5F+wRFLQGuPcp9L3jteSKLYPqOd3kT9Zdrg="
								"data: bryn (reminder)":         "BhOKh/5UE6gBdQkg7ndOwefsrPyz1tA0paCZ1pf1Za0="
								"data: charlie (reminder)":      "heS3kZaFNMmsuQaBVX37Z+zPK9IAgSZrkW9QjOTGB/0="
								"schema: CUE (reminder)":        "pXPGEFWG0hYHcr/K29JcOlzfBHxHYoOpPY2nsVflb9A="
								"policy: CUE (too restrictive)": "zzIWtGTQli+ABVGoX8sV5l8QdkwB8qHUwg3MIyoWX4w="
								"policy: CUE (correct)":         "WijdDzdGXR93K/nkRymOJCVhkxwBMxK8YDgA0ME2uCA="
								"schema.proto":                  "jhMfoy3G9ZzVtAbbG+57ZZCGTY3rQd9Ri1znkcYW6z0="
								"schema.json":                   "Zc6czj1Uuf9yz5ErIIKXaq8JSgCxyPWV8CfrMXvylCk="
								"policy.cue":                    "NwaSAEm2x+Cyacg+lreC5skoKrhdiFWd/ro6yo+4l5E="
								"data.yml (broken)":             "dwQ8zDELyVaSIhwb1dSHjwg/WNZVIoZso7Mj+84bncc="
								"data.yml (fixed)":              "iEyY4YGCDexC9i4Huyjf7GpajvlSt0nrf7fCqLEEwvg="
							}
							code: {
								constraints: "Ar/Xf5JXwLSwU9uJ9IuAoJV/hFSyo/yBFKAcQS42p+A="
								definition:  "9FPTRy9IIE6ZZY0FMQV/fISp2SOdHWjVQ0DxsRpdyBM="
							}
							multi_step: {
								hash:       "L4EHEE30D302SL3TR1N6M0QUGV81KBA9P7FE5IOOFF6MHH4B5OVG===="
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
