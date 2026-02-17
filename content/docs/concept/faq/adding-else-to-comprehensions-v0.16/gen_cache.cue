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
									"1 old":           "yDEC/KgGILUyHQL4B6Ov735G1+2Xk13xdNKhDabfiHk="
									"1 new":           "jcE4ZQQddaljB8T9oU/eRBBYXeIh2a3GVwJsnB0efc8="
									"2 for with else": "zOIsjUvXkYR6mnQbSh8MQoByejWv7+RtUTT4BdpmPxo="
								}
								multi_step: {
									hash:       "MEKOA4TM453ILS7GFPSBPN21521477R10H6EFE1LB5OJHUTJ47R0===="
									scriptHash: "I4QMFRJB2C3MB5AG52SNK51HFHK6TKM1DIF6AL1LMBJQDBO8TGOG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260217153153-40356abd88e5:$PATH"
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
