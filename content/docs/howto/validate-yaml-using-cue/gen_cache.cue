package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "xSks2js+YjFbxEwty6shTVEKL4apaUVqnwt6lP/r90w="
								"initial x.cue":  "YYTZQrZQgfn6BnIXWl7V8dmIoZLTDuVd5Dgijwq0wyI="
								"another person": "s62e5AXPnBUqiq8C0jjGxyerUQ59/jjDZ4ZXHiF6KmU="
								"fixed yaml":     "/sVv444CgNwI5j+wFDk19beTRAGjoGdzKLru0Zadg6w="
							}
							multi_step: {
								hash:       "EOF9L4RLCDSMI15CVBE9NG2LHG75HL0ASH4CUMKUI7S6EVBDN85G===="
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
