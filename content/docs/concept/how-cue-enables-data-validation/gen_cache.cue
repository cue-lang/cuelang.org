package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "9uzPqsrjdCW3dIG/gG60Lh/hliSVSptvQuZhTX7XJoY="
								"data: bryn (broken)":           "LTclbsYW7w9ofFRDG4uQESsY/RMUa8XanAstUucTDSE="
								"data: charlie":                 "4sMp9PguejvoioMUku4zcTc+VRbsi2QOjkItA2XgJ9o="
								"schema: CUE":                   "gCQ89LgY0pqXOxjuMo5XnCfNoOXRifAjcZQU22Hhkng="
								"data: bryn (fixed)":            "BMDl1R449trfHy9jcWGrAcRFQA69h3LF1xQ6nN5eByY="
								"data: alex (reminder)":         "JMuPgjCdZfPJZHwl0mcBaSkNdiDOn3w03NlViAFdJaQ="
								"data: bryn (reminder)":         "VcZjbvQLAk4dahw5xWf2Khi3zLRoTJtOTQr7dFzqpBk="
								"data: charlie (reminder)":      "BU1MIkEwKjuiOOERPgxj4A2+CCiVu6FqeufeDYjl+eA="
								"schema: CUE (reminder)":        "iz/O6v4/K9tgD2NMGFE1jC0mT701bJgJupvdGVLABsk="
								"policy: CUE (too restrictive)": "P3Etdc07dt/Be6DAQJpOkOKw/2RkltOyXOqYl0WiKfU="
								"policy: CUE (correct)":         "+IObk/rsacHLedcPIz1Dcc8rbMI6d31YhHcij7yThkY="
								"schema.proto":                  "Twn3bo8BqvrC2zPE/hzI6zEZKh34ekcSZN9kuAsnwHg="
								"schema.json":                   "5dTYztEjBUrFl20hYFrBsHDFSnMYXN3gdl512gSyBxg="
								"policy.cue":                    "7tn3LH6w1zhH9A6mzruVu/vpqNL5ZKBgQzWNkQUqbDM="
								"data.yml (broken)":             "vEWec49tvIdE6ziXjTO1M0wM7N8R43PdKJbNsEOPHlw="
								"data.yml (fixed)":              "DK74SZTOmlecEwT05UuxIWoLIbKAWwtMcYaWO7jp0PQ="
							}
							code: {
								constraints: "csK3evZ7E07CqyXkgWPucPRleloOUuC24JSw/VzIfVY="
								definition:  "0jNj9gxI4OdJinBmZqfxYa2wOiX9nqbBEEPqqAn1yUk="
							}
							multi_step: {
								hash:       "3A9025VP286K4UG4SK6N5R47KJTE38037US5GBTHQIN0BDMH15V0===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

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
