package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kubernetes-cue": {
						page: {
							cache: {
								upload: {
									"1":  "6OPEG8Y3f9U43LyaAAyaicIZM4raebAija7zmaZ3r1U="
									yaml: "L28rhBBxRbb74yWWCeQsaiIVcm8ZkLxnDx621UjnXe0="
								}
								multi_step: {
									hash:       "4R9F6GG0SPBVA8R1OPRARKNQLT4G6MM91FHAPS351NJQS0M2HGCG===="
									scriptHash: "MVNENDB3PEJF0N1UMAP40L0UM45UJ8IH8QKFVFJUB271A5A5VR7G===="
									steps: [{
										doc:      ""
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
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv manifest.yml .manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff manifest.yml .manifest.yml"
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
