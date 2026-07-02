package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-rename": {
						page: {
							cache: {
								multi_step: {
									hash:       "KFUIV4CLQQ7P3NIP52959ABPTDLJKTOB98RB7UOTFV52BTR8CT70===="
									scriptHash: "V5HJ8NSRKS2QLKRA4JF63GVMS62EQSO3PGT2ELI0OUDGH995GNR0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-0.dev.0.20260702073200-7686325819d2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod rename"
										exitCode: 0
										output: """
												Rename changes the name of the current module,
												updating import statements in source files as required.

												Usage:
												  cue mod rename <newModulePath> [flags]

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
