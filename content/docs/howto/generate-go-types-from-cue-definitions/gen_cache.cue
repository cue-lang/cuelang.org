package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "FwFK3qMj0vPM7UjqFmkDowjUGo28HUIVn42Y6oHZ7YM="
								"cue_types_gen.go 1": "ZSddWfstAh+zPZ6aa+wiNPLuzGDGDUovJKwv3ASa0jU="
								"example 2":          "4LcHbks3+agoLHqffpLSHVYRCavSvUzYLc2ExNTNdVs="
								"cue_types_gen.go 2": "FI59dsGGtPxMi0pE9OU++s3nqMAvRAfrniLNyP+CKmM="
							}
							multi_step: {
								hash:       "QJCMVO66JH34HT8NNBJ8PCH0VGDIA5U804VQ4G2ATHKA22GCVBEG===="
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
