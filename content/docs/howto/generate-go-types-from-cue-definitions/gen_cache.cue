package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "wVapJXx+7mcQkX/j7NDKV5Lbgavih6B3xjABwTpntZ4="
								"cue_types_gen.go 1": "gkRF+aXAaIeivQifmu/tTSofuAOM4qj65TN5ftjslM4="
								"example 2":          "LoCk0WsQ3ZLLE5dURR2hpauOsPHnxUNNhl/4vZpXy60="
								"cue_types_gen.go 2": "pLiWUa/c6pO9bbCafR6MLgb1YgBIL9tvgwY+N1Em/E0="
							}
							multi_step: {
								hash:       "04MGLP068IMA6HKVCF3MTH1F4R2IRJOUHCQ2JADOK6AN4DBTBPTG===="
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
