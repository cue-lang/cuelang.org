package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-completion": {
						page: {
							cache: {
								multi_step: {
									hash:       "ON2V2NR156CP742FQF87I62FPIMFJRC7EVP8PGQ2VTF2K6E15E7G===="
									scriptHash: "24CKDB0L66AB78OOACSUK4K19KITHQ4P2NSSAMHKN8HC6109PGF0===="
									steps: [{
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
												      --strict       report errors for lossy mappings
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
