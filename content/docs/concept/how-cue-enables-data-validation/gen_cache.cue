package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "0rUccgngS4BEgXAkEcQoqEbhhWX+nAtQlFL7A7A6WGQ="
								"data: bryn (broken)":           "WG/BWv+7gwNQghA+1imIWG7BURL+fom+jW/NFgK2ARw="
								"data: charlie":                 "3/hOy+eUeG2AHP+hkkNMmnHPD8SDZptIMdgJmMVCAks="
								"schema: CUE":                   "YN8uuBvcGlFv51qp7szF838AavJuE028iEFQpuactBs="
								"data: bryn (fixed)":            "S5AyN924Pxu67P0xElYVNkwn2OxIai880DN75qmlUkM="
								"data: alex (reminder)":         "oheBuUaOrhNuaOUU1+BnqGufgNKQEUuWtywPLbC/XDo="
								"data: bryn (reminder)":         "LyiGjnH2YsYfIit+iLIjAEVdbmoXX3QTKkiogfsDp2Q="
								"data: charlie (reminder)":      "ZTjF2DrdSnxyQXn1Gcp2G2qOzp1jHqDFG07iDrwnhKY="
								"schema: CUE (reminder)":        "SxxT+TNJD7aZ1Kr+9q3Da5vdNQ/lc4sefUUoAT1SaWU="
								"policy: CUE (too restrictive)": "e7H4wOzs7Ym6ZmpXfxdpVY2mR/yopMgghbq8gALU38Y="
								"policy: CUE (correct)":         "xc7XRa/5PAX2S8Ggdcv34QU0QsCTyW8P9uz1dmxYL+8="
								"schema.proto":                  "Ht8PesYyDZJIl0JtiazKcKp1s+4ZfKDWFsk4Sx1ZjDE="
								"schema.json":                   "wT5eSwnoKeMoOS2yzf7cfXUmNzZ384V0aMrAtPRFX1o="
								"policy.cue":                    "nve1Z2VUAw2cUXMIIkXlKfFHneZ6FOmplEK2YE0jdaA="
								"data.yml (broken)":             "VXjo44ZBrHRFx8xgu/UqcKd462ShFcrIBGfFmQi+My8="
								"data.yml (fixed)":              "oEFdk+6XNrvxYpwDD9YAKnPqfqdU0UMVt/CyE6ZRetg="
							}
							code: {
								constraints: "YmLDvPQZvOZPyg0DW61JfjnFTpNUB/UDE7ngRq9cCdU="
								definition:  "l2KI3lqYjfybw+kxIDZqtUwkyIZmRJVauqGl45Cg1n0="
							}
							multi_step: {
								hash:       "ILKLATQUF97A0ON0SK943UP0P38IAJSLEFBGMKIMLTTTH6FQDE7G===="
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
