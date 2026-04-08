package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-refactor": {
						page: {
							cache: {
								multi_step: {
									hash:       "NT9Q0CB9JD6EN56PURMLR6PB6UH4KGS6O5E71S4SNNC5RBL6D9Q0===="
									scriptHash: "L685LE4MDS5HPMBKE4IQ684FEP689U4KFMOHMG8TOOJMU4V2MO9G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help refactor"
										exitCode: 0
										output: """
												This command groups together commands relating
												to altering code within the current CUE module.

												Usage:
												  cue refactor <cmd> [arguments] [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
