package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "HcY787ELPrdRo6u+azTc4L1K6DYEamaJXhlp3d6UpUg="
								"initial x.cue":  "sqRlKtPj6ysIVf8DeTdxXkC+zqIPCYh0D+LfIwRvVeY="
								"another person": "Qfq6QudFNW7Fo4lNi98XvQYKimIJPiID7IsZQCe9nU0="
								"fixed yaml":     "s1lhBs2ibfZKuXd1eWUXQufoh1/jcTTQGrp4jX/p+KQ="
							}
							multi_step: {
								hash:       "2RRHIIL5FA36HT5LD519405FHAM6RKHG02P1KRODFLBHHGL6QK1G===="
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
