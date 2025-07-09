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
									removed:                 "hqI8E4MnLxSGSIHpSvVFf5i6utAEtHhJ9XErxvj8xlA="
									changes:                 "P+F7xH6kgnAM+98WNXrkXrMAsCpUyvkcNkX5W+xP7BA="
									"changes: updated file": "iyL3mkec05mjbL43vgJHQPDLy7eMCewPCC2qwfR7FpY="
									"references: broken":    "ySniXfohep3hNP1yZEZRAT1alWL1whRE0uXUdVDaAEo="
									"references: fixed":     "wlirJMDNDAXFhEaLLOlT6ozLy6zEMNVAuQLDYk5/2tI="
								}
								multi_step: {
									hash:       "RLIB0BP31ACKFASI5ITRLVJHH2IPSPSF8P2B5BJMKKI3QG5RL1RG===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
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
										cmd:      "cue vet -c references.cue"
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
