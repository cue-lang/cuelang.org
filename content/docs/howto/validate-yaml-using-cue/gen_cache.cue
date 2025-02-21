package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "YgWJliKXI47uEI65M75XrtiJo/COGkj+Zj90Ty7ULZY="
								"initial x.cue":  "KkH6/LwvvdUY0+la+p6AX1CKAfhcDOlYlZD4G4v5v9I="
								"another person": "9PjkiuGf07Q1dZWkIIoZY0q6JGH38Hebt1zTmQgFuhI="
								"fixed yaml":     "PzZQZtkY1fLTxattk1Hb13bNaXE6TLIaUAomrp4BjR0="
							}
							multi_step: {
								hash:       "VBJ8QBF049H6I461KPPGQ6KFEFLQ390T89F29L5G15227282QJ60===="
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
