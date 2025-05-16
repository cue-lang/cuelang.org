package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "T+zpkCGS7yElS4Sj3AeQr8rvTz3EXTKqbYFy6aJrrvU="
								"cue_types_gen.go 1": "svzqgwYQn/7HUwcdRgzZ2rwme1kgL0sQQBm7M1J7w7Y="
								"example 2":          "8sbmiEI5l1xGWc6tkTQCQIiOdizj6wYiU4g94BkzbDg="
								"cue_types_gen.go 2": "da8Zv0pUNIQ42FYqbX6xzKIXoLsr+t81iKmyGo/UFQ8="
							}
							multi_step: {
								hash:       "5S1RDCSEM144F0A4GBGNE62DD0HDR34K91H4HVTLOKTQ1P74NNLG===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
