package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-installing-cue": {
						page: {
							cache: {
								multi_step: {
									hash:       "2OQ827PK036CAJ2EOIJTTJ6CT4LM2IV3QKR97G0KLE2SLCMA1IGG===="
									scriptHash: "98Q3LFSN7L9M1TV01ROANEQ8OAIRRABBE7JI0VVVLA83MHOCA9BG===="
									steps: [{
										doc:      ""
										cmd:      "arch=$(case \"$(uname -m)\" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "curl -sSL -o cue-v0.11.1.tgz https://github.com/cue-lang/cue/releases/download/v0.11.1/cue_v0.11.1_linux_${arch}.tar.gz"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-v0.11.1.tgz"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export PATH=/usr/local/cue:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "which cue | grep \"^/usr/local/cue/cue$\""
										exitCode: 0
										output: """
												/usr/local/cue/cue

												"""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.11.1
												...

												"""
									}, {
										doc:      ""
										cmd:      "arch=$(case \"$(uname -m)\" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "curl -sSL -o cue-v0.11.1.tgz https://github.com/cue-lang/cue/releases/download/v0.11.1/cue_v0.11.1_darwin_${arch}.tar.gz"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export PATH=/usr/local/cue:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
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
}
