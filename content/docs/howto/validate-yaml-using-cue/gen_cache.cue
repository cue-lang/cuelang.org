package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "tGnQllMN7lBv3zG3eFBTCvyHcawXsc3/oS7G/vUc0zY="
								"initial x.cue":  "kAD8kP4pPoXXd5slW1NDSljDkuO9awzFrkOaKmh1KMw="
								"another person": "HKTdGhKG+68TetyMY1V2t5BkNU1VFr8eyu9Imk1AUIw="
								"fixed yaml":     "XgzZTy3+vIn1JK3ZnZnrSvhSvRR+ZE+Cg+qJV0YIOPc="
							}
							multi_step: {
								hash:       "QD7HG23QCE782AFM8A7LH6RFCVJGP8DMRGJ0NUR9T29EK2HD4J90===="
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
