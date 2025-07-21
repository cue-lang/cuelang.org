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
									removed:                 "v7vDgIb+ZkJJ0meDDGE9epe8yAoOGue9ScQrQqRHJsE="
									changes:                 "6pfCa9hXeOSZchI+6Ed1hsP79TjK0LN9oELIjIPl+qY="
									"changes: updated file": "ST/1w1bIXc2Hhl8t7+2g/vAlRt1VoFgvue86zkkIrKI="
									"references: broken":    "7adbbU7nRNgdDpPgkQ9qlngkSSjAGbA6BdX5l4cDmDg="
									"references: fixed":     "9M9v+GdS+fay8sPq7XeZwd6GNqYLv7FvRgH7zmb8kew="
								}
								multi_step: {
									hash:       "HUEDTK7KRHJJRVT2T134R8FJ7UJO940PEIUMGNEQH5P5VD8MBSEG===="
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
