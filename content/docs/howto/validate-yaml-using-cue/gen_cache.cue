package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "os5wWaoE0XupAYVJGTccCdstFYoMwDJXgUCqR4QzCfQ="
								"initial x.cue":  "MRzYcT76hdulxRfFawJjh+9FoTtSN1kgQch1iyVIIyc="
								"another person": "wy0/gaNvrov4aypAidg5+RR89HEwiunyN+JjStGdMXM="
								"fixed yaml":     "fEJJ1pZID9b11zqUImj/u6AzozK5qyCaoVels0y6vPA="
							}
							multi_step: {
								"72JRR25TEH2BTQNN84CV3M8UCA08FB7IG0BLMU14CV6NHDF92PU0====": [{
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
