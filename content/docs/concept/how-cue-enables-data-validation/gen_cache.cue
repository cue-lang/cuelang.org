package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "aCQXg56gJVVqZ4G2IPITFz4IN3D9tl9NnYGSFwF0DyE="
								"data: bryn (broken)":           "Nb1pOZXC4NyxRqVdSaVe/6sJI/O5c4Anc25uPw36Fd0="
								"data: charlie":                 "7xOtIZMiyJreNr+2eOqwwgZK5CVvd5FCpVBBvXItJMU="
								"schema: CUE":                   "O38o/EAeLyCvNxaMu9p/RcyVk2grhSN5pVaWXerLvE0="
								"data: bryn (fixed)":            "Xo9euHN9f9NPV3e5eBjOKkgXTEhereazl1ReLRv28vc="
								"data: alex (reminder)":         "F99TDbc5L9dem5Vge0s0tnSOmrU4u/m1V6cs5EXCous="
								"data: bryn (reminder)":         "GzJQXojzcG5qG8NE65GfZnc3+CPN/eWRV1+VGPnOhJk="
								"data: charlie (reminder)":      "audZKpdAkRIQTClWihBrF7+GIfEYrlV9lIiPWZRMboU="
								"schema: CUE (reminder)":        "ETqzZNWjNPT3jVhOb/7KD5BVcYGITWmRmJyrSEADg2U="
								"policy: CUE (too restrictive)": "tkJvNyhXBHtVv9juFTYYOZ0U+/m3AtyNxkWwMisjAc0="
								"policy: CUE (correct)":         "WUHGMwY0DlWVVHpq14/evSbjimXecSWgN4fe7s8vT+A="
								"schema.proto":                  "np/iNbDQH6Vq8CCyxugV7xaTBMxuEltYZKcXNbMqhus="
								"schema.json":                   "ifbQLAOYn01SibES2IKuJVbvycEKOrwUwwfjJP+jiIQ="
								"policy.cue":                    "IpsUC+23MIybRT7RxPTV+VFVRC7HF832TGxPVsa7MZ8="
								"data.yml (broken)":             "rA02X1fKiPwuV2+ep1/ajhWBAQVMS+axfVT2WyAHJHo="
								"data.yml (fixed)":              "8tQJThaMsZ4/a3CtzDIo1+aOaibI00YKVOHDi/vX9Kc="
							}
							code: {
								constraints: "QflE7X02V1Kgw5ppRkE4JIrII4HyUJ1PXFGUTG4M/Os="
								definition:  "fXUazH+GzdVGllFMHj5Z4f9n4Us7Jdy5fj6DGedaozc="
							}
							multi_step: {
								hash:       "24FAH9G3A5GKQ5VPUJNU7HSTH4TB27OIPL7OUAVRV0ST0AFEEJ7G===="
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
