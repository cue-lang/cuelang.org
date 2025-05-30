package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "+PvTGPd0qPBxD1bcWFZRtfGjWLgJLn2Mu1NAmCoF1+8="
								"cue_types_gen.go 1": "3Rv2NRdrQqwscuy/jhLrv9iMpIuMuAhTgm7VlCN7z0o="
								"example 2":          "H8gIOfF3Aj5fFJR6bxaKi7kFJP2ND54LYvE+B5etJyY="
								"cue_types_gen.go 2": "fs84EQVs8sSG/Sqk/vz2GhXaSdTCE6IovlROl0hJXDA="
							}
							multi_step: {
								hash:       "AALE82FG54OIS704CMJ4Q314UKA7EE6ULBLQA1IUL4IFVB71T2G0===="
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
