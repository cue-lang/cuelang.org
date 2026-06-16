package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "c+MEBeayD2mjSqRam6eKxGpXDmPgwMYaxu+l4MSm/hM="
								"cue_types_gen.go 1":     "XEDsYkz8Reou9RvTLpfublhXkLXPj+4QqkH9RCIxOlE="
								"example 2":              "d0uXCEEYWLcwuc6VeRGpd2XXHiw6YxO5jVNbIqPidjs="
								"cue_types_pet_gen.go 2": "FG51+gT6WuijX3dw8Lakx/0NgpHnFO+Wg4LMsGgbu4E="
							}
							multi_step: {
								hash:       "ECUS8FGPLJGEV9HBU74PKB5EIUV30AKJ6Q8HIL8N9ITR084BO3CG===="
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
