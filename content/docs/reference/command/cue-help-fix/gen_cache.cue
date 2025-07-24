package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-fix": {
						page: {
							cache: {
								multi_step: {
									hash:       "8HH14LGKESCVVVTR2EV1Q45VB18T7KC4HGQLUO56V3FVGFK0D25G===="
									scriptHash: "8MALUHVMCUH9N1DKDA69T5OU5JF8N5IG59VV75SD4G3V5MT8N94G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-rc.1.0.20250724155554-6d101321cb41:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help fix"
										exitCode: 0
										output: """
												Fix finds CUE programs that use old syntax and old APIs and rewrites them to use newer ones.
												After you update to a new CUE release, fix helps make the necessary changes
												to your program.

												Without any packages, fix applies to all files within a module.

												Usage:
												  cue fix [packages] [flags]

												Flags:
												  -f, --force   rewrite even when there are errors

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
