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
									hash:       "B6TR68KSV862023GIGL312PDT34G2MP70D3GH8EJOKDOI720DSDG===="
									scriptHash: "4EQ0G0BFPD3L5RGNNTPHTGCSHBBMQTHKSVDOSQR8JHR4K0TLRIDG===="
									steps: [{
										doc:      ""
										cmd:      "arch=$(case \"$(uname -m)\" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "curl -sSL -o cue-v0.11.2.tgz https://github.com/cue-lang/cue/releases/download/v0.11.2/cue_v0.11.2_linux_${arch}.tar.gz"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-v0.11.2.tgz"
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
												cue version v0.11.2
												...

												"""
									}, {
										doc:      ""
										cmd:      "arch=$(case \"$(uname -m)\" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "curl -sSL -o cue-v0.11.2.tgz https://github.com/cue-lang/cue/releases/download/v0.11.2/cue_v0.11.2_darwin_${arch}.tar.gz"
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
												cue version v0.11.2
												...

												"""
									}, {
										doc:      ""
										cmd:      "arch=$(case \"$(uname -m)\" in x86_64) echo amd64 ;; aarch64 | arm64) echo arm64 ;; esac)"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "curl -sSL -o cue-v0.11.2.tgz https://github.com/cue-lang/cue/releases/download/v0.11.2/cue_v0.11.2_linux_${arch}.tar.gz"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue-v0.11.2.tgz"
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
												cue version v0.11.2
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
