package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "f9rX54vKQ4cqDX9DnABJYCuBsP4V+N2ajRQA2buwfvU="
								"initial x.cue":  "6A9OhjMXbBSbS4wEKiIoUhUt+MMVryUTAZA58da10uo="
								"another person": "KQXLjHUvR8czSXMGx5p/EdXqXm9IkGJJKYsjptvQjGQ="
								"fixed yaml":     "SeZ07+ubn9/CD+UeSyf/4R4XyzypMNUqzxf+XHtTIcM="
							}
							multi_step: {
								hash:       "BB4BQTFTTURHE3VQJ4MKHIQLC9AHK4AMSETTO0J726IDO8N193BG===="
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
