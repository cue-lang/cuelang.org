package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ViSDUn06VFDpakIHM+QZxXCrIywkIEPpA3rhKcEV1Vk="
								"data: bryn (broken)":           "x5/vgGijR4w3GC0jH+D71PACvcyJRtovZGpj7AEqy80="
								"data: charlie":                 "gMXHF1tz60MeavarjC1Ic8YIme08R4rUWH/ljb4MQAE="
								"schema: CUE":                   "wXVNzZxMekbsGoErJV83hD+a8DXI6KbhY2qFTRbmw3w="
								"data: bryn (fixed)":            "ThzQmC+aPM427/7xvfxkwVPgQhe0QENbOIqlNC5CS3w="
								"data: alex (reminder)":         "hSt98Q2VmJ60XrNJWyPAC8ir9g8ZIeVy2nepgF1y2PE="
								"data: bryn (reminder)":         "xDDaZtNEZqeMYGlgg0u/f0XaJgz3u3YssTPwbLl2rn0="
								"data: charlie (reminder)":      "LuDt/SvtiOpni7jm7xFJb2RiCAljS+QM/H2U8b0gjL0="
								"schema: CUE (reminder)":        "RqkWvi4mN7mt5ojj+RTVW/aIgVDirHUDIwtrFV48nd8="
								"policy: CUE (too restrictive)": "FEnebucy09VdR4vMx2uMQYd8S+1HhYwnCKSrbpX8SOg="
								"policy: CUE (correct)":         "Gd0aSAGbhyweagoYP+l2nTVFBSxQi+1uOytZm0uQPnI="
								"schema.proto":                  "CFVhP94m4kzzI7YUPHBCkRGmzKoBraPYF6iE70Xo340="
								"schema.json":                   "QCrgJD/3CFhWHTna4Xz6MlJFJyFHWkRPsjJm79R3AFg="
								"policy.cue":                    "pKUKecz5QoGXHrGFwodLN2jQ7SHzyOEs7UvIjo7lRVE="
								"data.yml (broken)":             "WHf2gE0oPx60xmRX1nv29attn2NneEo4g/RLFE50rIM="
								"data.yml (fixed)":              "IkoyCSLPVxOgLBsBL/KHS9gTLS/8tO4bpCtGAbSYUw4="
							}
							code: {
								constraints: "khdHuG3PXYUAIeT4pcTBTVoaP0wDK6LQqMv7okxafdo="
								definition:  "fTPY2rlY4JguzmDXL/Iuf+iJWoaeDv7rWWSKyYhphHM="
							}
							multi_step: {
								hash:       "BV2T5JVCIQACB7THQB63FE60ANJ8QGNIT8F3CQ7JH4SL1HVFRJ7G===="
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
