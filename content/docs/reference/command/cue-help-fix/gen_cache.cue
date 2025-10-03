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
									hash:       "L9SOUQ06R3GRLO3UVK0FDKBKK5KD9E9AS0QT405AFTOS3M8R4QQ0===="
									scriptHash: "LR1JSKIM3JJFVE8N0TN46AUKNHBMQRH92H92SLBE3N2EFGEIUOP0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.1.0.20251003162346-5c15642ab78c:$PATH"
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

												For example, to enable the "explicitopen" experiment for all files in a package,
												you would run:

												\tcue fix . --exp=explicitopen

												For this to succeed, your current language version must support the experiment.
												If an experiment has not yet been accepted for the current version, an
												@experiment attribute is added in each affected file to mark the transition as
												complete.

												The special value --exp=all enables all experimental features that apply to the
												current version.

												Usage:
												  cue fix [packages] [flags]

												Flags:
												      --exp strings   list of experiments to port
												  -f, --force         rewrite even when there are errors

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
