package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "Uy2LBQRRTUvzT71De3mry8sDfIr6I8ct8xgITevEH9k="
								"cue_types_gen.go 1": "muZVinA/knbAgMqW4Ul38odr0/0jDJAQbNAJv7wtH6U="
								"example 2":          "j6yJ4A1g78cVPu78i2ouIp0VUvvR5bJbujpgyXcbA9Q="
								"cue_types_gen.go 2": "sNCazEFHCXNiDdPq3l5T0CTAd+wYb4Xq+HzLVnwIqYE="
							}
							multi_step: {
								hash:       "RLNFO5JC4MMQ05118M5GAI6TVO3PFILMFBC0LJDBN56VN472DLA0===="
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
