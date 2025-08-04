package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8t7Ge9Ku5cX9Ti0PbGvoM6ZONVCHHPl/aNf9Sy1VlK8="
								"x.cue":        "Ph8lW94UyLek6h9InrDTYfCMJshs6wrv1o8MuM8ZiC4="
								"x.json v2":    "v8oX+BZMuNcHAe4/z7z0uMeQ9FNUYa9VS8F5cJA+870="
								"fixed x.json": "5GLgMogmUnWVUQUoLyWagxP2lfPYICGP68FQTPabS8M="
							}
							multi_step: {
								hash:       "61K5T9SL53VQMHKVH5KVJ9KFL4V0PQGF3I68DP3ABHDGB9CBDPM0===="
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
