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
									hash:       "A5IQFPOGSDH8304UMKCSCPB788K4MGQ4EON7JU24U0C5NA3J6TR0===="
									scriptHash: "OEI7JUQVPVVUPS6SNA9HFJQPECC2GB2NKPN55H09H4AP4UEED6Q0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.2:$PATH"
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
