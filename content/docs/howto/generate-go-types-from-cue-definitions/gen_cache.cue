package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "IHGN5CYnPjC06JJTdI+exthobbQ+WtbieonrwB+6Sbs="
								"cue_types_gen.go 1":     "QKxt63Mi2Aa460ZOB/BYYtVo1YufEnVI8fC53lWOIdk="
								"example 2":              "Xd+pljQ8T09xqyeznVDW0kOSRfBaeJviISr/fOA1RlE="
								"cue_types_pet_gen.go 2": "kbey/pLVZiApeWCVSgie5Hr5NKnb3/MRz7kAP6vjFgw="
							}
							multi_step: {
								hash:       "BNFQ4C9BN2HI4HQ7BMLBVPE3856EHG9UULNSNP0SMUH0BU7AHT7G===="
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
