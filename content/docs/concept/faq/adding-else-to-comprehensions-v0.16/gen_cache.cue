package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"adding-else-to-comprehensions-v0.16": {
						page: {
							cache: {
								upload: {
									"1 old":           "RgGv/BLn3hN0bgcFdI8XuRibT/vzKXrtF8HrdDUWtWk="
									"1 new":           "vzcq7enzSh4QYgt5fAyvuVgPrHlBkDhZVo/dN9zzbJU="
									"2 for with else": "+Nsx0onITzItESCjU7RZg+BBk5VG/qdFgyxIsCjJTUY="
								}
								multi_step: {
									hash:       "1M24VCAOVHR87M3MR1AJ2IG4K8BHPD1766QQGGECKAU5TPNTMISG===="
									scriptHash: "GOF5T07PCCFN52O6H4UJMHCR0NUHMSNA8MMGF285E9FQDRU001D0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export if-without-else.cue"
										exitCode: 0
										output: """
												{
												    "foo": true,
												    "bar": true,
												    "out": "condition met"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export if-with-else.cue"
										exitCode: 0
										output: """
												{
												    "foo": true,
												    "bar": true,
												    "out": "condition met"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export for-with-else.cue"
										exitCode: 0
										output: """
												{
												    "inputs": [
												        "foo.txt",
												        "bar.xml",
												        "baz.toml"
												    ],
												    "cueInputs": {
												        "cueInputs": {
												            "fallback.cue": -1
												        },
												        "fallback.cue": -1
												    }
												}

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
