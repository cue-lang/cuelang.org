package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-registry": {
						page: {
							cache: {
								multi_step: {
									hash:       "4SC4RNKUPHKU5O2UJ2LRS5E73BOAD9CHEIMTQ1B9U7O3E19QP8LG===="
									scriptHash: "FETOK38N7T0T1446AHDDCI6S0H7MPB0NM15VHJCADG3G45DCH7JG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod registry"
										exitCode: 0
										output: """
												This command starts an OCI-compliant server that stores all its
												contents in memory. It can serve as a scratch CUE modules registry
												for use in testing.

												For example, start a local registry with:

												\tcue mod registry localhost:8080

												and point CUE_REGISTRY to it to publish a module version:

												\tCUE_REGISTRY=localhost:8080 cue mod publish v0.0.1

												Note: this command might be removed or changed significantly in the future.

												Usage:
												  cue mod registry [listen-address] [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
