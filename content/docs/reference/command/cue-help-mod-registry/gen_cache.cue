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
									hash:       "336VQCISKUHNS1SGKEQU5HJSTGQ58GR7RC3U4U76FQ93AQS34JT0===="
									scriptHash: "1JGP7N8GERRLNFBPKHNRJOEFK5UUPFN1QSNG67QUO1C3NP4RODM0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260306143617-9147ea2b06d9:$PATH"
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
