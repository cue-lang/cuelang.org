package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "KF4NFMFwUkIgo7Oy5CrFSUJfQwCDmVSH064DHCdq3i0="
								"cue_types_gen.go 1":     "Ah9BowgPQoBjuGE8/gqrbktPTcIXEbVPVxThfbKTLt8="
								"example 2":              "AA6SCU3t8k54O8shu8tMbH5uHE3IQeARHPvSu00S9QI="
								"cue_types_pet_gen.go 2": "k+PMuilydMx7s/CxmG85DEUgG9aohofI8qgywhBTPJs="
							}
							multi_step: {
								hash:       "QR3GE2OLE3I7R0E0IVUT04LQOQ7EMD0NPLULRKHENO2LQ2D6D1H0===="
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
