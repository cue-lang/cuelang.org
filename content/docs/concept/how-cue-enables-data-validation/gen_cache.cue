package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "9Ip6azfBjDMp1GOJIFDhDdT/acLOV6iEpz3Xkj1iX3A="
								"data: bryn (broken)":           "fV0ghO+AW0gdrFEkSMGFzNL29n2iCEAsUOIq8qn5qk0="
								"data: charlie":                 "OGJvTwK9wQWj6WZDA51oH6npFEa618B0JhUKcpF87UE="
								"schema: CUE":                   "dIZIk6SYxBpE2kgDE2Uk+u1w+NaiUetBBRor7PraXBg="
								"data: bryn (fixed)":            "UnLX1UOC+vEAbHfJsy5gx4Ca8RDCy8H3tc1bXN1ru2A="
								"data: alex (reminder)":         "bSPyyCzNt9G0Exrv4XayNecQ+JHNnYCCXkNwcl6jIvs="
								"data: bryn (reminder)":         "N1Ehnbn8oF1PDAyyLcnhIxwPmo++F1lIM0qpJMArT74="
								"data: charlie (reminder)":      "PtM86xjn+J/V2RXrISspV8rwFOt0fCJHQcZrxQ+TdIo="
								"schema: CUE (reminder)":        "Sip6l8ejf02ghZ4AEhtwI7bNERrOhCXTlhtw8as3/Xg="
								"policy: CUE (too restrictive)": "o9UdnP3nbDjMyJt81hpQm51AuX1cuAbP54zI060fADU="
								"policy: CUE (correct)":         "9yhUiErQFQt3UEV6Z7qv95OWM01vlBQeEnLuIdtUgWE="
								"schema.proto":                  "JJQaeBD6EMvk4upfQNle7X52TYveEW8B+YZfMfRHF48="
								"schema.json":                   "R+KSdTJqyajxUjjEI4Smj/uT7NaBw1GIopVq5OhjGYg="
								"policy.cue":                    "iOFHfm0YUsEJmlCAjOxhD4MaoyAmk4XvwtXKC46piTE="
								"data.yml (broken)":             "Eq8hiEA8ATJuiD3CVlnPa3K+8KJ9KGJOW/mYkyxuIuc="
								"data.yml (fixed)":              "vhGolsJ6IqbnW5JzHfObELbKWL6/phT45tfIlLFHEvU="
							}
							code: {
								constraints: "+e0p6DgNX3e1BBASpeXPDySSrY2VBPg5iW9Ehc0qaww="
								definition:  "XaW15mp4CQRzKawhaTIJ9qiiCGiC/MiNrFWkOpah9TY="
							}
							multi_step: {
								hash:       "GI6U0G9NL3D3DS4FPU966TN63OKQHQ9Q27S535L39KBDT0ODV32G===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
