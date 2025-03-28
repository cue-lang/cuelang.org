package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-buildkite-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "JdF7BMHzIcKxJrsF5FRCLODNbdfcRu0yxZMPoYOqRWk="
								}
								multi_step: {
									hash:       "BTF8D23V77A904QHFQ76UV9PHSBH0OIE2DVUEG8Q2PDHQLAAH7FG===="
									scriptHash: "DOS7TRFP4FJ8HUF32R7GL01RRNCO0UOPJ4R2C9LE6UEIBSGK4EBG===="
									steps: [{
										doc:      "# Registry auth"
										cmd:      "mkdir -p $HOME/.config/cue"
										exitCode: 0
										output:   ""
									}, {
										doc: ""
										cmd: """
												cat <<EOD >$HOME/.config/cue/logins.json
												{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
												EOD
												"""
										exitCode: 0
										output:   ""
									}, {
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.2.0.20250328144635-721ca5db06fc:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' test.cue.works/x1/buildkite@latest pipeline.yml"
										exitCode: 0
										output:   ""
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
