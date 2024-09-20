package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ybMtlwMBU1GkreHlBiaD1Czx1eN7Hexwj/c7hSyG+90="
								"data: bryn (broken)":           "QRqVVcLJOJKwD4ihme9eb1s8hGTMpsMta4vGrvf08dQ="
								"data: charlie":                 "VGgMAHkym2xDYedVTGHftKZeX/0tH61xAfzra95aEGg="
								"schema: CUE":                   "cuTkw+ORBRqKjKl7GmSVYJbGpXy/aZjUfgFNxwyuwLQ="
								"data: bryn (fixed)":            "x1f7c/sY3a8uPlSVTwHe18fyRAK2TODhwUmw4CL22pI="
								"data: alex (reminder)":         "VmJ7ZQVjosQ2+r0bX6lWVkirZhiF0ybIy+j9Td6aNrM="
								"data: bryn (reminder)":         "1A34atzHRcyOZ5P6ix24n37oS/tbccMXJbnDhBvVIHs="
								"data: charlie (reminder)":      "BR2jBx5GpkBDQ5gImkIkbpHGoo2P0VPN0WjCrrZLiV4="
								"schema: CUE (reminder)":        "Sg9eIj5N3b2z/MtGMbvZenDSZH9lGzOPUgMVQRquWYQ="
								"policy: CUE (too restrictive)": "um9ERvYeinpyAN3HILPBVQQqJNGJdGw0ILYiLeEPAI0="
								"policy: CUE (correct)":         "LnoxGWfQXNagVHrxo+SJBcQAC7JKF/Md64jRtWjwClk="
								"schema.proto":                  "ZioqySo7FpK1gpY7hqqpYDPqtTAX+Tticx4j/Cbn6dc="
								"schema.json":                   "am+DUuJpF9zrV2HVeYIyFa6SXFo+vfxtT39erzV2LFg="
								"policy.cue":                    "OSUqNurDPJMrnMxTdGTTJQuL22IKwLSLy6anfNUtfl4="
								"data.yml (broken)":             "6+/WbsAmRF2f9sCwbVYI/NZkwFdU8nyxIhHDG/0CVyw="
								"data.yml (fixed)":              "iKeo1WabeZoesH7vCgCexemdkK53UVZSSt38M9xDaps="
							}
							code: {
								constraints: "j9lYk/Kd1VvBQPGxpYVj8+vfrTiBmQwHwPuvEPRYkxo="
								definition:  "aIrDjhqJMn1RR9Gbyrqw81dswF6v0DgUjEShUzx5Ylk="
							}
							multi_step: {
								hash:       "2IVGHU1498LQU0LUINMO779Q1Q8TSO0TMUTBPPBID2AAP42GP7M0===="
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
