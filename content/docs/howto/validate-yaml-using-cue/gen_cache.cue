package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "kz8KXTkk68iW6tyx6+3MOzgW5sEfitI0YgCCneMAQpo="
								"initial x.cue":  "Y50xh+sro0/hRl25L4yUKCT8olNj2weWrFsflptuq1M="
								"another person": "fJI5JFwlN6T4bSSTXTRFPzGcv5aUu6YC0pfxGiUYtLM="
								"fixed yaml":     "R0j1P2WT5f3Wfb1r1WbAnPTxwNJw9UBmMNKvqy122CU="
							}
							multi_step: {
								hash:       "HSH3HQH1UMD7QH3F83IE96OI1UHHIRG5RL0ERAJ2KITJ59M1A360===="
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
