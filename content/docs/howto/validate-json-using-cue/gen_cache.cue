package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "IRFNFOp6XOdAGPe4ZhhzLreugj+elDN9oaGLdXxapA4="
								"x.cue":        "DYp9cfg1ARXw44ud/MnXtQt37n8dzuOSN8wpKqL2I0o="
								"x.json v2":    "7taJHwhC8BeDwGvsdNyuSWwiRzoZoW74t4eU5PgpQSg="
								"fixed x.json": "hK6zD4m5JF1K8TVzGzs3IuTr4+FSfM/TWebQHQ+iST4="
							}
							multi_step: {
								hash:       "PA1V5LM8RFDCN8E35VGPVRH4HU64S1M0P8OJGBTU6PJEJ520DD40===="
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
