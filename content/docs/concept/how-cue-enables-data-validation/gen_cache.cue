package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "qVvrl/Xle+kU0ygP/AXGPAKkjZldbzuVt6/gTYbPX5o="
								"data: bryn (broken)":           "Zp/JCUxyTjwnXfjTdCgeEZhPpD8zFAxNCeXtH/gpozU="
								"data: charlie":                 "eK3yBHoum/PQZejoj3SSDJwJJKIXa9uza2b9kMPvLJE="
								"schema: CUE":                   "ZMLBsyw+LAOqccFbnBH3Yc+lNHAz5i7U65KX7y+z7z4="
								"data: bryn (fixed)":            "V6sn9WIpgZLrEaTWLJkzDw5Lw6s/DzaSM6vK6LCkjjA="
								"data: alex (reminder)":         "KTZfDyveVVGJSnZqEkNbI5tjUmkCVf3JhOmYldU83wg="
								"data: bryn (reminder)":         "6RcKIcpTaRdTAUvICykkYxbubBxsbAT00rokNlGPz2k="
								"data: charlie (reminder)":      "AIeyKboXCyoAR4QxEA5Jmy7d5xZunXMqClRbUgqv+ac="
								"schema: CUE (reminder)":        "//JYYwz0JylOi8aE/Q4iUNu2CMA8Ts9bT0epiIRRqcU="
								"policy: CUE (too restrictive)": "OFL7lsrwnb7De0+raVLAFzFsqUTD8tPsM083odiss2I="
								"policy: CUE (correct)":         "RCUg9PVDv/7VBdr8SMvoS85SJGQXuo0Pf/a8/twQOtY="
								"schema.proto":                  "Tf9ICDzO6OCIRLIVGB3tvZXYOnFRmWLMcra0a+QZb4w="
								"schema.json":                   "vDAslzk7uCcJEAsaRqqhc9BTR1c9dVCvXMvFyB5yzLk="
								"policy.cue":                    "2lkfiPjeWPSN4WGieuoyqWtM21Z6RVVkwl02eOIwxSE="
								"data.yml (broken)":             "EmXLoO1Un/Vrv3Dzz710XLanL63typ1ZQkk7H+Dr3V4="
								"data.yml (fixed)":              "DJTbLc3DmnVz2kWPTrP8+PhY+3cEx/x1/LUjA6hmud4="
							}
							code: {
								constraints: "WbAsVRmCfzMtPlJmLLcCn6XUSvv8gf13FNc+g/ZdC6Q="
								definition:  "tBudTiaJT6yBfvipjxmPBuUMK0cy79ntGLA0LbMx9F8="
							}
							multi_step: {
								hash:       "N8CFFER096MLRDJARPM8F5U7T7BAJPM0RDR7QU7VN2T86KF2NKJG===="
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
