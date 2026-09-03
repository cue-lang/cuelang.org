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
									hash:       "JK0L4040NMCF933QV9E791GHDSHC4DS9FJ6L2KAOT2IR9EF89940===="
									scriptHash: "OOPMOQMS0GEPGBGBSBOGFFH4BB3RPQOM21V90QGSI4P9NHEAP35G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.17.0:$PATH"
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
												  -s, --simplify       simplify output

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
