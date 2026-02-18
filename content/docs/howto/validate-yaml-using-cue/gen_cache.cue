package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "NdOi+9uzh32KLNclg7Rh7XyiQIHY/K6tt9IbiTdOFmU="
								"initial x.cue":  "9DB6HqyD4n/iNBoFuSSL8M+FZND150+LRIg8BwaEAzQ="
								"another person": "KrD0Q2es0c/Q+70QFfbVLrrOOz7yXzDI9XsozZGXyG8="
								"fixed yaml":     "kyw3/PvtYx3JOFP84VHKFOKxlVghOFIodwlLdkU7+dc="
							}
							multi_step: {
								hash:       "5M9236V4RK1BHS2MCBBDH5DSS1EL08A7TMD5A33UJS9JEE0EE2GG===="
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
