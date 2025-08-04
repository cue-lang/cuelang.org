package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "2tST/5tuZFzmC2QuW8UHQ8SBpD3RJ2yyKzzLRUw+w44="
								"cue_types_gen.go 1":     "zk6zTB9BganlQ2CMwtzTKrcwtCtciM/4APOKNaSaXHM="
								"example 2":              "6tESBqv9l26FMxWo0RlZbv0+EemdauZND8F2wW+dCCo="
								"cue_types_pet_gen.go 2": "RzaDuh58Qxs7KyvzmkbjIPIf2pJijrMIO4LC8yLpJEQ="
							}
							multi_step: {
								hash:       "1QH8EGL1PRO0LMCGDAOUCTDNAHMC2TOLFI3E4GV8BF9Q9PBLRL50===="
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
