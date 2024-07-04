package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "d0+Vi25mRCW21O5ocMulJV1nlMPcn37UrWY4Mf3cVtg="
								"data: bryn (broken)":           "OsQalAWHQBRDh0oO2qIM82dMTljRHOptkhiJDqtlDEY="
								"data: charlie":                 "UEny/Lb8f4eG9w8x5qkEQloIHw1tK2dT67kILUEcuEo="
								"schema: CUE":                   "sThKMbcVxXhz0Pr7RpjhWjhKe1oWw+jgJ8HzCuB3aAk="
								"data: bryn (fixed)":            "9lHa6Tq1Joi7fBkisSxCvRDc6y7qkiTh2oscdrekI1Q="
								"data: alex (reminder)":         "Dci+bwlRE5cZa554BxFG5/nLervmkAwbju6RuqFNA9s="
								"data: bryn (reminder)":         "ZEdIeSyR/gcnP9X2qUzxA3bOkzf+WcZVo3ZsGiNewVk="
								"data: charlie (reminder)":      "8wFK5KYlunbcmV+n/VROD3Y4GGlShG0QzSX9BLM0Ry0="
								"schema: CUE (reminder)":        "MuZH288cn+A0vk9a0YM2TYVNsxhujV+Hqw6upxLTi24="
								"policy: CUE (too restrictive)": "Fe/hWkNfR1o28+HnEbgp3D0Ww9a4wuDeXUjLo+7zG3g="
								"policy: CUE (correct)":         "DiPMCU2KqzsPsgjBLeLJ8CvgOxY3CVOYdhWMdLS3zUY="
								"schema.proto":                  "vga8fiS8l1cxaywq+WjR/ThVZsFZ7mvmNPxVsfF7w70="
								"schema.json":                   "pOlrPUodn0oolCveeCIUkxZ47wIu4g/CbxRsXyPLK2M="
								"policy.cue":                    "9FgWKwKy73GsaAZ7gE5tHeOUtgkZZhb8Q5KCGjoABHk="
								"data.yml (broken)":             "tZxn51c2/1ouS4rK0+GQBBh+/HToGujVxiyTV+lE1gk="
								"data.yml (fixed)":              "/ApFkxd+pe2B2YELms5YXTBCzIsmvSCIbuLoaxAF/ko="
							}
							code: {
								constraints: "YiP2QzCId/W3thbIb20yLKjwr5/1cQ8Ra/i/A76iF9w="
								definition:  "dsaT/UUtef/SiB0u/yOq4KcNPW1x8yFEbztNFrnu+vg="
							}
							multi_step: {
								hash:       "SB2LGLTJSO121NNN5BKDG1UORK8UBT0CD959CC3RQ97LI7LPILH0===="
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
