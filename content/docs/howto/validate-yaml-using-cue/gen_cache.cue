package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "3M7M160Pjua6b3lJUTLWSZQMhvfWLIW3Tuq4XJFjwz0="
								"initial x.cue":  "QCZflwnRNHS8wrsOBiOYtbDXW1v6NZ35MEO1UNOCicE="
								"another person": "lRqoeNMKfh+hgnraW9u5Tjs2JHfiiTs6ar2c1O8oRmc="
								"fixed yaml":     "k8lEmHTVfbXAMZkbB0DIrazP6JpzNJMQql4nTywbCSo="
							}
							multi_step: {
								hash:       "D24VQPP2NH2TIOIRHUONPMCGQJ8IQ9KPHRLKKK11LAAJPDHS1FMG===="
								scriptHash: "TKKU7JEF7ORT6L9TSNKD9P5J1GDTFLS2HIE28N6UHD5PJ68NL0P0===="
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
