package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "EUUT+ehinRbZIPp1qzcxXLqBSGZ43HH08/Gb1pPMqro="
								"x.cue":        "betJSWH7k3XepaB4LtTry16ki18lzAGZTXfdZlszBiY="
								"x.json v2":    "qQcvlKo38SgLGPXCbF5QJxyKp5627KGjfZ3xW/8c8hM="
								"fixed x.json": "dPOYPIhhYbdMPjKr6MTdXdT8f4+hJGVdcp9Ln4tXJTw="
							}
							multi_step: {
								hash:       "R3K9FQRQAKCNOOATLDLA6R66UFPP6K2QSVGL2G00UKODK8BE3R2G===="
								scriptHash: "N4K2L5MIBMGPDN4PJC36DQRL6RR46KFT8DK3RM5CL1H3TQBP4U00===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
