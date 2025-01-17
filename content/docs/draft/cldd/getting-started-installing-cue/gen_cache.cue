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
									hash:       "6AA1B5IUBLKH1A0HTP7PML1EMPI23K8O5FER18S5INCGJ5EDCPO0===="
									scriptHash: "A3NOJB4HHKJBEF4NG4740EE6PP5I2BJ7CM2KP4QACO8M7CGARS2G===="
									steps: [{
										doc:      ""
										cmd:      "curl -sSLO https://github.com/cue-lang/cue/releases/download/v0.11.1/cue_v0.11.1_linux_amd64.tar.gz"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "rm -rf /usr/local/cue && mkdir -p /usr/local/cue && tar -C /usr/local/cue -xzf cue_v0.11.1_linux_amd64.tar.gz"
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
