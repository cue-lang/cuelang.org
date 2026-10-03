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
									hash:       "PHEN6ERFR8NRQ1T0L1GH8GFV8OQ7IOEO5VL9KIJI0S16QU8I3DBG===="
									scriptHash: "LKMPHOSKABP9L8L2C54L61DN2H138FHAPG6GJ95JVJLAEQBA8R30===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
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
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors

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
