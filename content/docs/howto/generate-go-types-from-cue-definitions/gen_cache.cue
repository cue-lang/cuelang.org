package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "Hhbo1qNwCYJNxeR+u/s6LRuIbGmdWbKYhavzbyAnJfw="
								"cue_types_gen.go 1": "J/aVlvQVg+tATi7CFPzfFx4bUpd1VNDxfImC/KaBr/E="
								"example 2":          "6z3RnpErcIKeywfsefWmCMgBe486YvtR+0tmgBQfO4U="
								"cue_types_gen.go 2": "/pMZ+k+CPtyoQ1wPqGsrpXTBb7qHR4AsiQVk+yddoqw="
							}
							multi_step: {
								hash:       "N5FIMDGVA02TI44KJ6HPIDFDD0E9VSCOGOFJ533G9FC0EUM68MF0===="
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
