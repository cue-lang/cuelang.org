package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-gitlab-cicd-files": {
						page: {
							cache: {
								upload: {
									pipeline: "QvkWCZg7hvG/6b79eCaQIfXz3rXGp0IUZxCABIMNLkU="
								}
								multi_step: {
									hash:       "FB6B4S7E7KCGH4KT80CHOSEVFAQE6JFMFV8QKA89FE91O8GA1PB0===="
									scriptHash: "C57AQ3R1164DVAROK5AF61HJKF35KFSTFPHCN556QT5E487GH4A0===="
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/gitlab/gitlabci@latest pipeline.yml -d '#Pipeline'"
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
