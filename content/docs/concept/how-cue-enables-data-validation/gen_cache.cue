package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "WnWTFU0lPq46u0A/NtzbEklIzT7fA3/TUFB6pottYmU="
								"data: bryn (broken)":           "VfHxg145+2g0TC6u0xGwVyAg8eaAib2c7o2ZIWowivI="
								"data: charlie":                 "9IxCONMaUgAi5c6y74VXcWhpaTSg7LIY1x8ZPND0xp4="
								"schema: CUE":                   "ODodb3/dGDIbIsfZb2obBNZJwmdijdiAUD9aEZR4Ta0="
								"data: bryn (fixed)":            "AysJZAoOX7PZbjs2/+rP2KjVjbu46CprIYHgnwHRpX8="
								"data: alex (reminder)":         "lOjp21+HfDgN07PSg6xC8a0q7gazId5vlEmAFSljmbY="
								"data: bryn (reminder)":         "VQAzliaYAiD0U9DDnVLUiNMqZV8LgqReK82CCQydYHQ="
								"data: charlie (reminder)":      "6T4+a2ORbXFCY3JMwhGz4+cpGMs4OBllVNgKk2eNydw="
								"schema: CUE (reminder)":        "Z4UyS+K5gGrfm8BVz4UBl/fiU5vnwn5R3XYXhJbQins="
								"policy: CUE (too restrictive)": "Oy5zY0kY8Z3ASGSsE3cCGcHWUFRatPSdh/9K4U9WARk="
								"policy: CUE (correct)":         "BZzoUhQsg/3EJqb7rCqEE2hVqEsZIX8J6eoBy/iR5d8="
								"schema.proto":                  "FHQglAi+L8Ty6h42Q475h3oX7UmPCOC5p2I08Bq95F0="
								"schema.json":                   "Cnc00xNUBqoMz6ha8YfNkdGeHOynsygJfConWAdHmkc="
								"policy.cue":                    "+s4KldxO0CsMppB1aHp0wMtvqjKP/6cnC/UYcXTy0Ac="
								"data.yml (broken)":             "TjXjkZy70Rhmb0+CkZ0wcz4rQ/2a+jbjvVlBk3OYEg0="
								"data.yml (fixed)":              "uYr4vnZgt/dZIzF0BdCeHQLQe5694Y48ll9fupd5CcQ="
							}
							code: {
								constraints: "sfNgTh9FA3v8lkXi8bXsMTErz63FW+wtrqoxB9UpxhI="
								definition:  "vx4eriYzKNWVRZtz9iXSZJ/p/Q/nACAQBr9ND72Lt1w="
							}
							multi_step: {
								hash:       "JIE29DLL7UMSMIRPSK5N8NRJMO6FCSTM0U4H1VQPUPVADPM97AA0===="
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
