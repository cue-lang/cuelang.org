package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "zz/bEN2W/VejnMKHW8RFWjIcBWgNqNMijXNWkzPE2Yw="
								"x.cue":        "5iSl1WVuVH1CAF59bEhTLZyK1s71RMB0b17wmt/Ahjk="
								"x.json v2":    "HlMzcBVl/cflmhWShpKaRlaePfDPK3KUNEUZ8jUAmFY="
								"fixed x.json": "2DyZSdEUS7kzomJmGB2HC3scHIaicR9tyBppnpk9UIw="
							}
							multi_step: {
								hash:       "KJE18UOICIVJL6KRM33LSEKC8MMUFPJLHD097MFRG5F7FV6TOB1G===="
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
