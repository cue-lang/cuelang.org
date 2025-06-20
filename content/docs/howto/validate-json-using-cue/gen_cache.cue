package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "2S2lXO4Xk583tikOWs5AlR2ojWTVIQvcmu83mDn+Ldk="
								"x.cue":        "sk/m/CzpM6jV0yoQE++UzBHLEl/7Mheuiotg17ox+/E="
								"x.json v2":    "qwcYzIaTkuXzYTbRJK0Xp/6PSGUT3Gu07pP/T8ErODA="
								"fixed x.json": "bQKA13FcYS4sPthV0vK/oGAdFYQK2zJOkm5CK3/kpq4="
							}
							multi_step: {
								hash:       "M96TONO6P7N5BCVERFENPVEUIGTPF8KCIOJ8DI6L6VSFUMS6Q2JG===="
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
