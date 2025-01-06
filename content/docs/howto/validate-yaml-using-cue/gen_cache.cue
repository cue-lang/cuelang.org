package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "xP36IPbGhudeuEmAjtR+arY6YXzn/KyhpXizXCUJfPk="
								"initial x.cue":  "Pf0gZhzxCKdild2GHgemqG51IQoD0k6il0yHcdNEhVM="
								"another person": "C12yolTb0dEoZtGTJHcx3gZnFGL7iVd5Pfey4M7KKrY="
								"fixed yaml":     "OaBcNGQ5zY1F/rKMiGr17HJZad9QeMQythAQVkX0ttM="
							}
							multi_step: {
								hash:       "BIMVAU97A3F4GPSPA5KL0IC0D3UR9L0602BOFP7486LFM8VO12R0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
