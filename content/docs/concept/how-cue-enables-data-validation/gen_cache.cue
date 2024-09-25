package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "uktYi1XS6gz8Efmr/j9gEuYAwqRx+wPzs31ngnvrGAY="
								"data: bryn (broken)":           "GaeoRH2f6wQwqR+DVyrV8M1/L9PSzv/R6lpgN3A4Sb8="
								"data: charlie":                 "pJXWGLzd0fdEgB0FoKi0nKuwFqyfXeKtAuAEuMPypPI="
								"schema: CUE":                   "1X1u2xJwNvwr4Mwo++JACpKKtFaKnUBsvalTuFp+1KE="
								"data: bryn (fixed)":            "ya5h4wWtXK6+3gsKYjGCOCeXc3HjTPTniqKlpj8ZlDU="
								"data: alex (reminder)":         "oCVRaQpPvAW9/MaapXO7cEQku5eDuerHLKBWAx4Ie8k="
								"data: bryn (reminder)":         "P0arg20BzdyyxVZOTJCaTn87zCgDBPPzvndMU9VhsP8="
								"data: charlie (reminder)":      "BFngcYfDltHNW/rQN+6TPdheOeKRWOcfKtxVbmFx82o="
								"schema: CUE (reminder)":        "xttA0cH/RGQymFhPDmpA09R7dpqvh+VrQ3MzHkYarbA="
								"policy: CUE (too restrictive)": "SKoakdYS+JZ0g9Lpyu5tE1QEWOX3txxd3aQmb1Oi61k="
								"policy: CUE (correct)":         "T98Cq04oMWggnUr6pNIXaDFiiXuAIH0JuafeBBri+uE="
								"schema.proto":                  "XAtjw9tOy+j6t6s1ixYC36VPxD34F4oLC57QwJnGiqw="
								"schema.json":                   "Dek68YpFcQExNXZ1d+92go46V7gUtXYnUeG4TSkKcvE="
								"policy.cue":                    "wRYrGoJYDfRgBFJdwvU8IvnMHXZWru3rhjtnv7jaB2M="
								"data.yml (broken)":             "tO5UMSsX3Bfqa2LZOnj5SDefxKszgd/woKyz9DClezU="
								"data.yml (fixed)":              "sw4T6SUdXlpAmOq9g8ieK17UoAvfIZUN8m0qkcmGC/w="
							}
							code: {
								constraints: "AWkIkZ48SXMtVsx05WifIIuOv5SuH8UnvYk0sf3MvkY="
								definition:  "kYckdp9Fp4y4ildqmrGTjQ+i7YinZJFtSppclpkEhnE="
							}
							multi_step: {
								hash:       "550QP9U0033GCIIVNUHN4OFEDMAREV8BAQG6AEILVA70NOFR89NG===="
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
