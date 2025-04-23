package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "dzwbcrxb8OW21IWYHwiJxJFzaRw8Sub5xTt1qVK4XEU="
								"initial x.cue":  "MaRh4fN825iQrtyjPLCfkEzaD4YsBZpG7X86aazHFbY="
								"another person": "nyhBPthOHsI8nEH6Da4X8KAPnZUCdA4v3S/zK09EL3Q="
								"fixed yaml":     "bl+TRBOLxWaQ8LHWeWiq3s6c5e2hv4y9SRYIRr73Ohs="
							}
							multi_step: {
								hash:       "G1KLA5IK1D4L56IHS1DVLOI8QBPN029QF54M42PAF8F3M53686OG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
