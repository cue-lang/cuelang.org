package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-goreleaser-files": {
						page: {
							cache: {
								upload: {
									broken: "L5nj4IvFxV5p0oz5AKSophSGxYJo3ZIeDbAaCHjHszA="
									fixed:  "32J2zg4ITu+nt2ZPeXTfTIicABh3NDVOodJ65F9Z2Vg="
								}
								multi_step: {
									hash:       "Q7DMCNNHFVSL8NG9N5H0QQIBTPLB3RLCRQQI9U6G8LRLJU3DTUDG===="
									scriptHash: "EUV2UBN6B7R926QK2IPII8B65TOMFU8NN2UM9AJTFG92A61NBS10===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
										exitCode: 1
										output: """
												docker: field not allowed:
												    .goreleaser.yml:7:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
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
