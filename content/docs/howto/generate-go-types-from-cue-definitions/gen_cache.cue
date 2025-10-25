package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "Imb5c1f8Ww7p3FE50rt75ga35SS2pjG3NQT/ikdkodU="
								"cue_types_gen.go 1":     "XXoW/vZwVqXWNipZJpndUY/pHY/lWrU8PV4HGmOKaL0="
								"example 2":              "mjYnh0nv8icXxL+IrS7PD623n/6aMdNIto+aGCeUqKs="
								"cue_types_pet_gen.go 2": "mCgcjaAo+iH+FFZiqLFFHn9u/cWrMaYdSSD6INCyxMc="
							}
							multi_step: {
								hash:       "E3PRFNRSBO11SFFGFVS6H8FSRPLVA0TTEP21J100MRI3O1UCCB80===="
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
