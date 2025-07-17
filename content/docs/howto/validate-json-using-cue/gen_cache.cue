package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "/k2e3KTDls83F/L04DNI2lz8FJIYpf4cCyVMadsvLzU="
								"x.cue":        "zne7HDS1UuFRT3kBJCwhV+CU85n+jn1cfk4IHZRkQ6U="
								"x.json v2":    "mS6W+Fqy7rZa771fRyGbMKKoFAwhhZfDNm+ktKncgAE="
								"fixed x.json": "VBr/y3E0EmQYVq5RKcYynmawt7fBcHOKuASx9HOFZCk="
							}
							multi_step: {
								hash:       "N4HGIS7BB8KKAB3G6U52AKS4L61KOLN503CE84ESVH0C7EOT5GJG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
