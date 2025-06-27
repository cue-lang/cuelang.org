package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "dpcMfw0fxVI8wxmg4okAsF8iH2ypW/QRjQkhKCtWQJI="
								"x.cue":        "uy6N3cLXjH7Pxm2yeFVeE+DBK61w36jI9oXoK2HVh2Q="
								"x.json v2":    "ktv/uuDB3dwWGI7kg3r+VnvV/WPh+ws3x/yVqrECUaM="
								"fixed x.json": "3XRpoKAG293rD9tMmQ4YScUc64xFx9BHHscPaPRlsg8="
							}
							multi_step: {
								hash:       "HKBQS3AH9LL6D1VH556VPP5M0SIEGPRMBKGC3BFRRDNMMT4N3ML0===="
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
