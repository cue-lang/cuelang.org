package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "w2l/Z4j1Buwr0Tp2WrGAc34k/KVpaRGSqbgm0XCdmsk="
								"initial x.cue":  "iQdrtIOVjuKTRcsHI6ALfad0sQMY0+JUC4Xe3CHYPYk="
								"another person": "dc1IEs5PD7rj6SY4Kh48pefg9ws1mQ81ijwG87mOorI="
								"fixed yaml":     "UOY3BPPoRZt5ArZCgVLMipijSZ2WBYv2wZNtgJCZ0Ho="
							}
							multi_step: {
								hash:       "MEB0J5LM628QICV2AS8NR38QP8GU8LQ1DSSCIA7R01EV6NJ6TC8G===="
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
