package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "2Hx0GpCR47sI0bT3/Faa9T40VR0aY3B8BzGAsx0/MMo="
								"data: bryn (broken)":           "7QBkLkTQvkl4k2julodIuRyjE7gV0CnlduwMr5bA4CU="
								"data: charlie":                 "FYmeJ9umKfX5OLQWaOwQP8ZF119jC1wF+xCuhHPyuPw="
								"schema: CUE":                   "gdZehgeNyL4o9+9DrEEzChnV7dTlRCrFpQ7Llufnlw8="
								"data: bryn (fixed)":            "fxTHslLrFvQR8hqc6oZTVLQVIxhl5+AMCHU3DonufNc="
								"data: alex (reminder)":         "JWNMAHsVS0NPwhoDDIKhOmA00r7z4HvuXq9VuPQx0XY="
								"data: bryn (reminder)":         "bo7fHJGj+VYToVvOxQn1AL9aGUDFxZUrz+0cRREJPM8="
								"data: charlie (reminder)":      "+NYqeNaic9oyqPxI9C+vD6RNysk42HqpHy7yryN2as4="
								"schema: CUE (reminder)":        "IbbXSC8l95cSf0LeHQ2stLE14v1FIaFl2K2s7AY/cjg="
								"policy: CUE (too restrictive)": "54OF74kmgabx8uhg1dYG2M6dmP2C1umRCS1Vr5Z6fko="
								"policy: CUE (correct)":         "A0FW8RppRduOMueA6rFWj5C5irXfolOIXAA9XiJ+B5Q="
								"schema.proto":                  "UuNCfaCB7uw8D1Jh+QC+8BLZPo7xASNZx1+S0EWa/ug="
								"schema.json":                   "CCpqrrqmqc45Q2LG6UMA95bHEBXLh05hvmmLk/GaYtc="
								"policy.cue":                    "Vr1FUnEVVhxM2LG2b9/CayvIS/2eVTQjqFR6fJyPI/g="
								"data.yml (broken)":             "oXMwoM12IwT21dAfvaXgKUrtraGjmgp9CdO9CjSvxTc="
								"data.yml (fixed)":              "6AHTCJan21cE7TKXlIRKWlVLC4DJEku61IFCiFMiDcA="
							}
							code: {
								constraints: "BDWDdMoNqhbUznQScsdwJqISkbRJd5ei/6rHD/6vCOE="
								definition:  "OmP0uxVv6hKI688LjRl9HCjC08FWFIbOUUt/D/xY8wc="
							}
							multi_step: {
								hash:       "2G7HUCSG137BRQDMD885MK51K9I6RCAP8TU2L9L7JL1UU680EVD0===="
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
