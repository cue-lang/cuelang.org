package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "YRIXVI7Ic2IzHuKh0im8mbbnFoWmP7rve40AKZBDuVg="
								"data: bryn (broken)":           "EvhampPqDpOXrXjCWbJKmYyG6EIemzewbO71/gaJK/k="
								"data: charlie":                 "VaZTusuQzhN+LEIHkn6scbFbkWQMqAR0I5RUmntjX/U="
								"schema: CUE":                   "AHJ+RR9c/tvUNVUFm82PESAhYniqfyyeSQt4qeOx0Dk="
								"data: bryn (fixed)":            "IlH3WvZOWGQ7230oK8B6MkrqqQXToQyOYXs0O1Ehwdk="
								"data: alex (reminder)":         "SjLoOUsohdFRir2z6XMV8XT+Qr1P8M3A+EoExspOl6E="
								"data: bryn (reminder)":         "5SvK3HHytAC/K7jyllsNYXauWnJOVAYEym0Hnx2wmPk="
								"data: charlie (reminder)":      "lFXKJn8fzrKPQaIlIWOmmeWCCQlisbpSKHFhVAObJkg="
								"schema: CUE (reminder)":        "MUOwwoTHv4MvDvUNLL7jEZWdfobnXgtgB2xgeRHB/vs="
								"policy: CUE (too restrictive)": "eL471d6/NaCDk3MHf6229u/pbU2GexRfytrN+53X2CY="
								"policy: CUE (correct)":         "OEMRfvsW1IGbMAOnFMPLwXMeV8MkPaI6YK4BFmwL3NQ="
								"schema.proto":                  "qyN6jB9oMyvZ+SuK2OZKUYTFVNM5TrX7IWjxqSkZufQ="
								"schema.json":                   "dlxkkcINT0sGYX+L2h+AkTU/xOh/TYim9DZJSHUve8Q="
								"policy.cue":                    "+9wFd/SNTYg3K3hekpwk44/UaN3Q/WR860TppkPKtSA="
								"data.yml (broken)":             "+FinivvPEPpnvvYJZTL7AcJDXLoAmfWUx2BDZ4FInHs="
								"data.yml (fixed)":              "PKONpb5UWNITc8kUcs9zCrfgV7PRlx4pxPGPHXx4l6A="
							}
							code: {
								constraints: "Y4Iwkx0oeq/0HB58hZxKa6aZ5z3j6pxDjCBJcXLWmNI="
								definition:  "uKeQs7BPTFqE2lcilEFz6ZUUaxJA54XE5bKgoiHSs9g="
							}
							multi_step: {
								hash:       "S6H9FDVGQ5JS4LH9AML9056EQEBP2PPUHNA3HAG762IS6HQ7S3MG===="
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
