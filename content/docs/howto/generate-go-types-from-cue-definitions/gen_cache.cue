package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "SQp8Clj8ub2Fj5J8fh7frMxeoR169WcuVSxVPvxiz3k="
								"cue_types_gen.go 1":     "IHeruxBW2bI8d83yWNnxEiTO+9a+FaHX8Xz8/v3+lAg="
								"example 2":              "79rnph7mmhBdPwX0TMZLQg+N7gfUad76cC9fLUXHNkU="
								"cue_types_pet_gen.go 2": "tV+RA0p/nxmT6r5VrTTrKKmqlvPB+JgkX9IjWrTCSsY="
							}
							multi_step: {
								hash:       "J6DUR8DQEO10UI1GEDKPIBUJ9C2FS2FSEOBBJ5V5C4LVB9U4N2H0===="
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
