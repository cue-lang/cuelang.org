package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									removed:                 "Lh0H58R03BC4xDT4rsdXncTDJfVRN4i29FlfuUXSrlg="
									changes:                 "SJw3KojE95QpKiTSqXKZ8x4xqW2br+2v9ZGmA4bcXTs="
									"changes: updated file": "2xbIMmuWblPeHkIiThJNb1z+e7u8Amgu+mAtcBvhspI="
									"references: broken":    "+IMar3qv6krOlOI2lxzCsK24A9tjlAZmV1RzzMmHP90="
									"references: fixed":     "wTiDhBlT+AXdQAVroaMCqDwSh3mK0gkkJy5HgTAaZE0="
								}
								multi_step: {
									hash:       "TD7CQN5NTSL6VC3QVH1OU6DQMKA69L3ICFI5AS47HB7KLRVGI3G0===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
										exitCode: 1
										output: """
												A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:1:4
												B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:2:4

												"""
									}, {
										doc:      ""
										cmd:      "cue fix changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
}
