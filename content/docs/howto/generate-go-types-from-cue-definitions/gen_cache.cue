package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "1EVxuCFiX5uEd87ooHU5hezjgeZp6+Z4W80Pd83sIBI="
								"cue_types_gen.go 1":     "pXoaTyuig0daSdVNNiBcKHtvInCcd0B8AQuHKRJ49XE="
								"example 2":              "sSmBjui926f0NXS44ilQ3zP+pUeWhRjUrqpTU8uO7Hw="
								"cue_types_pet_gen.go 2": "BJzArfwbDmbidR2BEXEan8mr8Op1Cx8CWOKbSxAScB4="
							}
							multi_step: {
								hash:       "PRUIQEH1LRVHIIRS3BJTC3KHNUB9R39H4GFTHV6Q03BMLAF5ERJ0===="
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
