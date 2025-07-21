package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "/uncdfUuwg4EMKJrjMlFfYtajrFr+rj5oK+r4Di6GjA="
								"cue_types_gen.go 1": "VisBu17ASZRLiR9vpQhBO7LcPwFBlnZ71UnzafqWlxs="
								"example 2":          "E2efupsmn5gegW+K5RuQHCvJKyPynNyXIjT0sD7qS4w="
								"cue_types_gen.go 2": "8YRjymfXMVEPn9PHxR/zJTuQAua8o1+1ux5R+oKZ6ok="
							}
							multi_step: {
								hash:       "50HHHEK1HIPCP4G16IQ5COPR6RMT84KC59Q943C1N1UPCAA2DSV0===="
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
