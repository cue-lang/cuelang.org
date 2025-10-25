package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-completion": {
						page: {
							cache: {
								multi_step: {
									hash:       "3BHMO3JFEQHTEE0VKF6Q058FOME41N8451F3CPR5BCTF0ASK1KCG===="
									scriptHash: "UN5HSHD46GO0ALT9JHJ3K2HVD83CUCSCHUEIA1B940C7908SOBC0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.3.0.20251025133102-654b5c06c385:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help completion"
										exitCode: 0
										output: """
												Generate completion script

												Usage:
												  cue completion [bash zsh fish powershell] [flags]

												Examples:

												Bash:

												$ source <(cue completion bash)

												# To load completions for each session, execute once:
												Linux:
												  $ cue completion bash > /etc/bash_completion.d/cue
												MacOS:
												  $ cue completion bash > /usr/local/etc/bash_completion.d/cue

												Zsh:

												$ source <(cue completion zsh)

												# To load completions for each session, execute once:
												$ cue completion zsh > "${fpath[1]}/_cue"

												Fish:

												$ cue completion fish | source

												# To load completions for each session, execute once:
												$ cue completion fish > ~/.config/fish/completions/cue.fish


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
