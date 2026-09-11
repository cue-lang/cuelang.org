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
									hash:       "S9REI474FPKK7G0FN2UNB4945T61LCR9JIVC4RB07P5B0HAF7OM0===="
									scriptHash: "8SB2THATASEDV0QVGQUHPTLMQ3M56G4L11LOAUI5INAVG9D2UTI0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
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


												Experiments

												CUE experiments are features that are not yet part of the stable language but
												are being tested for future inclusion. Some of these may introduce backwards
												incompatible changes for which there is a cue fix. The --exp flag is used to
												change a file or package to use the new, experimental semantics. Experiments
												are enabled on a per-file basis.

												For example, to enable the "explicitopen" experiment for all files in a
												package whose module is on a language version before v0.18.0, which is where
												that experiment became stable, you would run:

												\tcue fix . --exp=explicitopen

												For this to succeed, your current language version must support the experiment.
												If an experiment has not yet been accepted for the current version, an
												@experiment attribute is added in each affected file to mark the transition as
												complete. An experiment which is already stable for that version needs no
												fix, as files use it without an attribute, and asking for one is an error.

												The special value --exp=all enables all experimental features that apply to the
												current version.

												Usage:
												  cue fix [flags] [packages]

												Flags:
												      --exp strings          list of experiments to port
												  -f, --force                rewrite even when there are errors
												      --remove-list-commas   remove commas from multiline list elements (v0.17.0+)

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
