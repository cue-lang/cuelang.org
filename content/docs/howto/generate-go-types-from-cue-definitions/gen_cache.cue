package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "IDdcDcaz+BVsPbI4jZvWFXY9G4S0zb5Les7+1gbieXM="
								"cue_types_gen.go 1":     "kR+BgUFeWNRkhPbe3zc3nIwO5PKlSv4xt66STpgPaPM="
								"example 2":              "EFcLiawn6WCTtFrCS+hjzVrOnxiLfBsT9DoqSL4S9lM="
								"cue_types_pet_gen.go 2": "J2ip+G8apOcTCBGzpgQvPo5IM+pzQE0pDjMg4qERF4U="
							}
							multi_step: {
								hash:       "0MN2A5355FVP2IG2EQ6GVSKFBRG2LQ8B01359KLVNA3FMQ59DMOG===="
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
