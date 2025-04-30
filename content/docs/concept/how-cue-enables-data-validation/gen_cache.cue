package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "3Pcl5Q3Lkkec4HMQBiO1McWK7QME25VlU96JoRpdLtg="
								"data: bryn (broken)":           "yvOxEEnPK4ChNEj2C8nWyBsvcgGEmGoBUYGIauv5Bb0="
								"data: charlie":                 "drKknBaWdn2kH0XrMSs1a//AsoabGp7gsnVETLkEglQ="
								"schema: CUE":                   "0/3y2fmL2vf+EN1YiPxTgeF+tfiyRRrAElPjAN9Piko="
								"data: bryn (fixed)":            "oHg5zJZ/vDxN7lMCdVKLSzxkqd7JSZXpoFM5miPfiko="
								"data: alex (reminder)":         "q8niiXWtSM4Zp4QdZPafOwq7dSneU7xADxrcEuz9TwI="
								"data: bryn (reminder)":         "VCe3Is++56cTVDswlUaWmhzZ7dkjcWgnkww+QIX050g="
								"data: charlie (reminder)":      "0e0cUffk56cc3zW5iGpgF8ZI5kWZjHAFM46qxmwc+Ag="
								"schema: CUE (reminder)":        "WSVK1vFspijgSIVOoiXIMzsxOOEjCdVhzFUsNN5eakk="
								"policy: CUE (too restrictive)": "cLuuqoGVTMqcj561Ow5BzfUmzfqsaHnfdpQ2gtzHDQg="
								"policy: CUE (correct)":         "k+Gd0O6P0+elQPX9BjLrCCBamwl//KoaSkoMl8L1lG4="
								"schema.proto":                  "qMic7zoHKFEMsFAbOEn5jcJjEpKr8MFwm+nYbL/ldgo="
								"schema.json":                   "EEZivccygXDZs4snNYECCMYTOSz8YX9IutUH7+x0FTc="
								"policy.cue":                    "rFPgofttNVG5sJFRiwYX+fRy4lCuJvFZ/N+BwG/GTS8="
								"data.yml (broken)":             "2fa/9K8guY1xezg8xhVVGHCjNln7ydIMdY39E7JaeOw="
								"data.yml (fixed)":              "P8iFpfXzuKNd3l87QGnkhftqE7DesuvolkaxirNFjQU="
							}
							code: {
								constraints: "R9Xq9xkzxypGcRhIPOXD7bgQ3mMd+h2Ja1IN09lbAe8="
								definition:  "CO450E19hAtKX0YtBE4dVp9rH4x1fiKuIBfaQssvfXY="
							}
							multi_step: {
								hash:       "94STQ0HS1C292A64BACA0UQAMUJGIRQCQH93MHUMNF81JIG47BR0===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
