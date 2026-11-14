package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "1q1zqS7q6Ov8ljMZb3itQZcAQzBfkCfvEF2ejlCMdjQ="
								"initial x.cue":  "tdwth6mz0wbs3p92s6PfDhqwOvT9YrhgWFWp1Y7DrtE="
								"another person": "cGV3KTLUtVT0+zx/5zVayXBJRYTNc54fwFF2wMBWqZ8="
								"fixed yaml":     "L+uULK6+JfO3i/W4qYkxDkKel5kM6bSQkgnS4OLmJs8="
							}
							multi_step: {
								hash:       "9BKP4OCEJH8COI24VFHLQUR40D7VSQIGVQTR9GJL4MKQ7RNFMU40===="
								scriptHash: "FCVR3RQM9KMC4K4253KBPI107J84GMJJJ8ULKG41E4AVUBFH6UUG===="
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
											    ./x.cue:7:25
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
