package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "SI+pd/4JVE8mEaCVDVQyUECENImHM3ar22jq9aDBXdI="
								"x.cue":        "vijJDwqAPWxF36xGap/QLcLhk8W0Y+PQUV9pLJhY2ZA="
								"x.json v2":    "87P1WnwxP5fPd+uJUndVdsFM+HEdP8AbHdxrjyznrwQ="
								"fixed x.json": "I9D1xIMVtbkEioAZG+sEojr9UYETmVf8WSBSh+8mNts="
							}
							multi_step: {
								hash:       "52S0IDF60I2DHAQ6I2AD351QG0E5R1QDKPJF8KJIDEAQC3G70E30===="
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
											    ./x.cue:7:21
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
