package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "H+Eeu2hPpD1ILflMg8/wUFGrzp9snvKhiswDk1kjvdQ="
								"initial x.cue":  "pkV8U2KKl3YI/cz6QDcUEHYrbZI1MNMcE36AOr/egeM="
								"another person": "m6D6he6LZA7C9KNVgsxzCgzcK1vgTHdNcRfGanBATjA="
								"fixed yaml":     "t3qYEEN7xON8ZP1itY6Z3nfPCfBzLpODbfzbzlHn+Wg="
							}
							multi_step: {
								hash:       "7887P2SVE9FLQ5IEHFFE8263QK0C9N0R71O1287I8CT0PK6NFBMG===="
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
