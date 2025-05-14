package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "2KussEHzc+YK3p+5qnfGmLFYllM48K+5utiy1mBg6OA="
								"initial x.cue":  "pg7adD7xNlvpsPATz6Tq2ZQHHHWVUPodOCPOgxVkF8Y="
								"another person": "6FVPtsVZL/mpUNsOvDB/d8BnDVjq+WEZzPGKX9Xi5oI="
								"fixed yaml":     "c0SYTLxSfahA47CaYuTnLl6bMsmv6WhMyzA3NA5F8Cs="
							}
							multi_step: {
								hash:       "F7UF83HKAFK27RIUS2NDF2MBL9PIBD3Q28QBFDMEDRF38TO85B7G===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
