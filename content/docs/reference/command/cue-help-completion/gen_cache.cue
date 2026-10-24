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
									hash:       "0BC02V91GEMGRPT0QMSGLNIBUSROG6FLNOR4QRT5AEC3BPU4PLT0===="
									scriptHash: "NBHI8HALLG43H1FKH56HPMDRV7BRJMDBCJL5NN30BHD4ADSPT7A0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
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
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
