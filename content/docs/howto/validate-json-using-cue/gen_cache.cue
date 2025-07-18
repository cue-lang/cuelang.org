package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "IKeFtphUnRqJe94fO9kk18QlS7DHcrirNCasnF9Ic8I="
								"x.cue":        "rojZiO+re/t3vewnPZta4weNRgnK6ASrM4tEGPlBhIQ="
								"x.json v2":    "s6IEvlzl3zLdLUw3FRVEs07iJpdklUSOsLW0RdP4FUU="
								"fixed x.json": "4XLv5eXIlObakcRliq36TIzO9Q/XDJp7HmeBWD97IIo="
							}
							multi_step: {
								hash:       "2EKR5NO7M93T40QFEK5JISIQKLLLTKH76HCVE3BIEFN1RVVKV3TG===="
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
