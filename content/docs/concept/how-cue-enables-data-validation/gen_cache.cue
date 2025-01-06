package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "jGhb+1klWbhq7PiR33jGvxVxPMuOyNon65OVI62gtZ8="
								"data: bryn (broken)":           "DysIaFgiRvFhN1iMPfcT/am7PbzaIgvwTam5LJD0W1Y="
								"data: charlie":                 "P+4OIv1vHKsbUvQWrtIFdMFWAL0x+716hwmYpQHu7WA="
								"schema: CUE":                   "LT5IrNOQzv4I9QcpxdnY2gxyr2nHz4rOImj7BBiN7sE="
								"data: bryn (fixed)":            "75VgLIOmi3Fg13Dpow2Ai1XKPg/e+xhDbGsu0nupeXo="
								"data: alex (reminder)":         "VH0BDM2kj/FOScT0o74it3YI7I65QTaTmAbeuzKUiHk="
								"data: bryn (reminder)":         "4IEHDtdR2W1Q24GV6KmI8hruBfmBwu+j6LSuNChr7y0="
								"data: charlie (reminder)":      "NymNFHxBDFwQmfE2N5RaQNcLX7eAquPctD+XUjKuHGA="
								"schema: CUE (reminder)":        "MM3Ui578hnE11Jc48W9H2tB1rWrqc+c+7Yn6b2YHYDM="
								"policy: CUE (too restrictive)": "A1TFyNmv2gJa0tBrbMpdUcG24PtgpI/5UfUpRXo2SHc="
								"policy: CUE (correct)":         "2fRJchTeHDh9cRBNRKf502PstV4xqL9hm+BCWASEiVQ="
								"schema.proto":                  "dpZcq/us6EW8tOBtInSMjAyuBwrojmgAnhkGyV5cvoQ="
								"schema.json":                   "Q7vEUI2AnT3slSAX3zQvheWFElKlCrPkqopuAxJNzh4="
								"policy.cue":                    "pu/6oOFJ5V/RwlH8SYyuswFZyLN5j/UNipoLWp0wgZ0="
								"data.yml (broken)":             "EiptYfQkQlX+6tHBXBTuP79tAOKwD35l1Bqsi2fqOW0="
								"data.yml (fixed)":              "3lh+fLg7Ss7xFey8QKDGtL+eVXPzIYXm8k527so2910="
							}
							code: {
								constraints: "XrQUHJ2pilZ2UMGtwBzaSQmJHoNL41Z2Pef4wPYmPnA="
								definition:  "Bc77e60FXYh3BxaSuMqmqgoJMNAjhW3/pPvCgbxOOcw="
							}
							multi_step: {
								hash:       "64VFM7A5UEK58E2PBC160MRDV9JBSI9LI0TE671RNMN3UJA13P1G===="
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
