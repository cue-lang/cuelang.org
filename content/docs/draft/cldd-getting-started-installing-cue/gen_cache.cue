package site
{
	content: {
		docs: {
			draft: {
				"cldd-getting-started-installing-cue": {
					page: {
						cache: {
							multi_step: {
								hash:       "5AKIG8NTQC42V7QV6HI9DD87NP4GABQO8J8EN72IJUMS0C2VTCCG===="
								scriptHash: "NHDH06PM1G2K012BGEB33LQV5048HTLMCQFJ8LFH6FAREPCQ77J0===="
								steps: [{
									doc:      ""
									cmd:      "curl -sSLO https://github.com/cue-lang/cue/releases/download/v0.11.1/cue_v0.11.1_linux_amd64.tar.gz"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "curl -sSLO https://github.com/cue-lang/cue/releases/download/v0.11.1/checksums.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "grep linux_amd64 checksums.txt | shasum -a 256 -c"
									exitCode: 0
									output: """
											cue_v0.11.1_linux_amd64.tar.gz: OK

											"""
								}, {
									doc:      ""
									cmd:      "tar xzf cue_v0.11.1_linux_amd64.tar.gz cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p $HOME/bin/"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue $HOME/bin/"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "echo 'export PATH=$HOME/bin:$PATH' >>$HOME/.profile"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											#This isn't a true test of the PATH changes, above, as they're a little fiddly to test inside the preprocessor.
											#ellipsis 1
											"""
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "mkdir -p $HOME/bin"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export PATH=$HOME/bin:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "ln -s $HOME/bin/cue $HOME/bin/cue.exe"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue.exe version"
									exitCode: 0
									output: """
											cue version v0.11.1
											...

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
