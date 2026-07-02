package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "z5O8TPvo1eN/x+47klfBoBdr0vJm+/bDr+S5mTCWrBk="
								"cue_types_gen.go 1":     "Pres5jb9On8ALe61Awh8t6v173Hh8TJ3ZgPczKUMjTY="
								"example 2":              "vCQw56//WdO5nKjuwLfXx6U8iDiPqBHbcoYMk9OdM9g="
								"cue_types_pet_gen.go 2": "4/kKivgaiczkFs6z+7WgglrdRqh+MpdzRi3Wh1jAJeQ="
							}
							multi_step: {
								hash:       "0UPGR19I09GM000OGUD6NLH1EFBHQ3J5IMVC8QRMEFIJCFJK4S9G===="
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
