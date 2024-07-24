package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "1x0ov1Sp7ZaMzxYLPxEP3a91rCz1rCgr6VkZ5WMclXY="
								"data: bryn (broken)":           "q7M2RIU/awNde3PpgBgb2x9xFNN3seGtYhzvoF22Jnw="
								"data: charlie":                 "G15ldLZvBeb7duSmiwOYBOJp03DNPLgZ1v76s6jk/wQ="
								"schema: CUE":                   "3H8RX1tO4B+7AYgEeDaH+IPTy1/C7iumtvm0AkIs/xI="
								"data: bryn (fixed)":            "9QNSS6nBSc5t2y3h4B2EW+008GNY71E7JqkwBee4aeE="
								"data: alex (reminder)":         "LIgsns/FlY1tHXqqna2k0mj4BfPJqpAsdE2n3GV0QO0="
								"data: bryn (reminder)":         "vNs5gLyAGJzIM21YChyYlBSAlI+k08GZjz+1fszC7zQ="
								"data: charlie (reminder)":      "rHQ8rIZkHJXlqbHXYAfSaEhWUfh3WOX87iyV57YSnZU="
								"schema: CUE (reminder)":        "MEHeNZdmmtlJy8o5WZ8H/HhZI4CdSL41kCcBD1fhGrY="
								"policy: CUE (too restrictive)": "kFMM2SfdRuok2pHRt/qPcfrm1JaQkwOtq8xUmWsc32c="
								"policy: CUE (correct)":         "I+4ehMtTGnFF4L90CIn9h/AEqa5AMopbarA36hnBH+k="
								"schema.proto":                  "5nHWdnPjzZi+Szz/UNlVMc03iZfpkKS7zhYxLjqW5tU="
								"schema.json":                   "GFGP8oTec4IZArUYzhb7Tk/MCgG8VQ1Mzsx2XSkxd7o="
								"policy.cue":                    "G+0ud1N//FOZXYk358gmnoufS2H4Zne4NCdqTOp5R98="
								"data.yml (broken)":             "P3DMKpKYOnUEn29VvHyhxhPbOigsCAzxr3flrUBOFOY="
								"data.yml (fixed)":              "Y8XYdeNGKrC111/5vnvZnuggx3MQC9RnRcBzJ58A4U8="
							}
							code: {
								constraints: "LW0BwhG0F957f1RsizBRYfyOLVY9ntOkoWWF+RoCCpc="
								definition:  "Jl+YWx8X1/g0XKzGx5n5B3BJOabjqgxgqNqXBJqmrFk="
							}
							multi_step: {
								hash:       "4PHF7QVB804BGHK8TOQAS9G14SBEOOQ64N5774VNENVR18JHH2JG===="
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
