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
									hash:       "R06N8BVT9JTJ75A7OJDV5G8LDFI46310HM9LQ5OT1SCN34HU5QA0===="
									scriptHash: "CTH17VHUCLU3U4TNJUNV3QJDSBQHF4G83S9TNOHDCHTK2U3MHJ7G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260314205741-820e1530e9ff:$PATH"
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
