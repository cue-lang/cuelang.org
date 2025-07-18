package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "NNWhzJ45F/5Ybc1RdCTOowE5E/Bk7ztPIyMyJyvARkI="
								"cue_types_gen.go 1": "EKZoSRVDiqd+Hb9xpkdl5v8RnXRTf+CAXHzO2OfeDIw="
								"example 2":          "L/1amHARHPhFxKaq10KvfOhe4EklZw6CG4/bur74dy4="
								"cue_types_gen.go 2": "Rm4AyzR+GJ+es7Mxvyc2et5S+oRckh2RhIMszuqfl9Y="
							}
							multi_step: {
								hash:       "G1QVG42LQ6V0VOHMO2B27QV726MEOJ6H86CN8RAVE8U86JJFLLS0===="
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
