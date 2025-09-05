package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-edit": {
						page: {
							cache: {
								multi_step: {
									hash:       "O3E3N731VBSU1VUK87102DGAH1SINN8M45HQVTGUJ6CL37CI4LL0===="
									scriptHash: "1L43377GN5C85UVJ1VTNQPBF7PPN4EG4R0FKOO206CC5BBRQ25P0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250905161001-20531e1837bf:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod edit"
										exitCode: 0
										output: """
												Edit provides a command-line interface for editing cue.mod/module.cue.
												It reads only that file; it does not look up information about the modules
												involved.

												The editing flags specify a sequence of editing operations.

												The -require=path@version and -drop-require=path@majorversion flags add
												and drop a requirement on the given module path and version. Note that
												-require overrides any existing requirements on path. These flags are
												mainly for tools that understand the module graph. Users should prefer
												'cue mod get path@version' which makes other cue.mod adjustments as
												needed to satisfy constraints imposed by other modules.

												The --module flag changes the module's path (the module.cue file's module field).
												The --source flag changes the module's declared source.
												The --drop-source flag removes the source field.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod edit [flags]

												Flags:
												      --drop-require string       remove a requirement
												      --drop-source               remove the source field
												      --language-version string   set language.version ('current' means current language version)
												      --module string             set the module path
												      --require string            add a required module@version
												      --source string             set the source field

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
