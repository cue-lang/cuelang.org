package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "bzwRhKN9PAHtIHUpW5AV7CZHycEBWAuy7hf+8UrLEyg="
								"data: bryn (broken)":           "x9qJzsEnJuK0U1GYqm5iza2IIO27Ee2TbOKPxcLBLBs="
								"data: charlie":                 "gKdANM9cTQtc1RsIHZO728e+ZeyMxJJTU3tF+I8i4Uk="
								"schema: CUE":                   "Cn/QWqpPLGMaDoj3x4MOzMHNniKYD3ae0kRrB3iPUvs="
								"data: bryn (fixed)":            "Uz3n/5GTaCFLiBPR7qH82wpo7fJPNdh4rpsNH+WvbdM="
								"data: alex (reminder)":         "sCrnjl9cTIgbvCZXjdn2gA03Jqzveb8w97Ql9jDM0J4="
								"data: bryn (reminder)":         "jzLuJN83CvgRySvsbMyXQVKgJonhpMg71WTjxrnpZsE="
								"data: charlie (reminder)":      "K2DiKcU6jblw+5HFKyTYL/7semOv8IfwXcRyDdIJk7w="
								"schema: CUE (reminder)":        "NPJmZP874CkSoqrka0oc6lLaQJqOwsHC01QsLTykcFk="
								"policy: CUE (too restrictive)": "x0huZKpZSitOQ65U2KLgnhiD8Ppw/b/2WW7pPdCDEDc="
								"policy: CUE (correct)":         "e8ett4L2oouJaCiJrY3LXMc+PmfMnUnSiOLS0QTUQaA="
								"schema.proto":                  "ypK8JsaOlBiW27pQ89VhK2GkFEjQyMEL7snclEkdjiY="
								"schema.json":                   "Wl80n8LmQFXy1BJ4cA+5oYa+Zm7IxO8WM7Gd+gsWhhI="
								"policy.cue":                    "H1v76XbLPViR8HHTRi20Ihgs3IIObYAU1t/Meb+5CFM="
								"data.yml (broken)":             "nKIxr8c8x9VH9IWCCIpGqt1OEVPNqQcgOdPLKxsr8n4="
								"data.yml (fixed)":              "Hp5cMKS0gsVDhmNd53qfZhoKii7J8ZQzI6nZ+UDXU0Y="
							}
							code: {
								constraints: "0NowZZaA16u8Fzz/CJULJSKUGlJsxy38bPU04h0RH1k="
								definition:  "vuYWOREQtwL5iJitoL64PwxaHnQZF/SUWSQi9IarRs8="
							}
							multi_step: {
								hash:       "3OPOKFCN7JMIG5QKD40OQOHGE47GRGJ9538G1OQ6KRPVJCAGQRTG===="
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
