package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-publish": {
						page: {
							cache: {
								multi_step: {
									hash:       "T9CU6EGJS2PHSOSR8EOB8HB4D4N63M08O3SPBIQT2LQ386CHHVN0===="
									scriptHash: "KG3EKP8PIO0BKSLEFRS3BLJPA42GR9ORRCVQ5EMEMFL4VJEV3D4G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod publish"
										exitCode: 0
										output: """
												Publish the current module to an OCI registry. It consults
												$CUE_REGISTRY to determine where the module should be published (see
												"cue help environment" for details). Also note that this command does
												no dependency or other checks at the moment.

												When the --dry-run flag is specified, nothing will actually be written
												to a registry, but all other checks will take place.

												The --json flag can be used to find out more information about the upload.

												The --out flag can be used to write the module's contents to a directory
												in OCI Image Layout format. See this link for more details on the format:
												https://github.com/opencontainers/image-spec/blob/8f3820ccf8f65db8744e626df17fe8a64462aece/image-layout.md

												Usage:
												  cue mod publish <version> [flags]

												Flags:
												  -n, --dry-run      only run simulation
												      --json         print verbose information in JSON format (implies --dry-run)
												      --out string   write module contents to specified directory in OCI Image Layout format (implies --dry-run)

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
