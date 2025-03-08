package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "L4XsjG9plWWuaW4pcDOCpsVM5+PhbalGK3RvVuRc0XE="
								"data: bryn (broken)":           "dIpGJkZl05FVCi0pxzhjps1kZjRnsclQRKfTCzR53hQ="
								"data: charlie":                 "uu2qKZr8OSfdirl8klzQ/MUsuu+NHp+9rHTYpiOH3YU="
								"schema: CUE":                   "4f+xIW4A+PXBg2n80YYVbKWZFV1RL2Ic8SdCVz+G1hI="
								"data: bryn (fixed)":            "/gH8poD88Ggb4neZ3bXHQ8J7o2FEaSDfyPcZvONJ1SU="
								"data: alex (reminder)":         "88gJxSb8neGnkHmx0PsKXaQ6OGnHoO50GYtwy5BLFzU="
								"data: bryn (reminder)":         "rMwnqrG3egz0DOtw9KC+ubF4PuqvLs/kGz4DDtyCQDI="
								"data: charlie (reminder)":      "C3Xi1UvuJTTthtn/hjic54PoB/Tm2jLU6MsUmafWnZs="
								"schema: CUE (reminder)":        "8Xx5uqFIfonS5i9KSFF59/Bl6uMjZN9enVRa3NMXT3A="
								"policy: CUE (too restrictive)": "QYrjRR3M5TLV/1MTYewWOsBTQypvfqdIHG4nciSvMBw="
								"policy: CUE (correct)":         "1BPx35TIerP9z/V1qyq5VvRyH7yN1ps7aYk0Jw1hXss="
								"schema.proto":                  "ePEjdX/5wF7o8bozxNBr3v7fTS507nAiZuyUxxZ5rqE="
								"schema.json":                   "slyQXvSiXAm0gmCrDgf+SZo7cXntNqqPat6L4mNjsCo="
								"policy.cue":                    "9XBWC7kzWaBwx7oRdI6wP+RxhiNTdk127Wyd/INNecM="
								"data.yml (broken)":             "q9lfESaVlC/l6pD9GwsjrhwZAB22t3L3K192Pm44vJw="
								"data.yml (fixed)":              "Xjl1HyD9vnP854O09/v6rQUWfEaGmiBm8EMn/LZXMPo="
							}
							code: {
								constraints: "VG4oShLHCVW8RnDncrFt0EEM877lK9qBGuudoZlMmUU="
								definition:  "AoFSo+PY5bL0P/wIwhb1WW/eJrsNS/uZ+xsAznipuFw="
							}
							multi_step: {
								hash:       "42I2A70EJJ2O87OUOKEV2SEJO5VITJ3FPNEMB5NU5NFJ1QHMRGR0===="
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
