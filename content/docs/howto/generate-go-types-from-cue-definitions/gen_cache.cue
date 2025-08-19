package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "jY3iPZ4mOhfusbvdAXrp3CJl12hen7HWLTG1xD/cDfM="
								"cue_types_gen.go 1":     "XlyrAc22eHhvixRhNgaxBDmZzneRnk7mvuQYY2G/IEo="
								"example 2":              "oyRtLc6fQHl7RpaorSWTm6ABRWuuRd0yY4TSxfwL2TA="
								"cue_types_pet_gen.go 2": "ec3sVPh+DPEqWpqZB3nUKeupVo4ZM8Auhkzp20Rdtwc="
							}
							multi_step: {
								hash:       "V85T949AM8GFKFDVME5MMCU4ULATJGEH7D1BKON5JUUPNNUDN92G===="
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
