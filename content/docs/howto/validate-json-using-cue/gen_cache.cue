package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "SKKrpNYb4LGrw3m/vrZIKtN/+r/gNbs/KO46KpdIo48="
								"x.cue":        "y3etbGhYlaDlh/HtqVJX7Vdz+ZBpqqMLk4uZzQOTogU="
								"x.json v2":    "MQVGl3TAExW4Rj5fO8z8T4PhzMx4fwR6ytVAseul+3k="
								"fixed x.json": "xaQi5hW6Z2F+8DOmKuPJD4dXd+rmJKAZ3+3U1A3rGEQ="
							}
							multi_step: {
								hash:       "V5L4MA0O3T71M1BBJLR8FVN03PDQB2MCMM5K6KHJBTB6L40TDG90===="
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
