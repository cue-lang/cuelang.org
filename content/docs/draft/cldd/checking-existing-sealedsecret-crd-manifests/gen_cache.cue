package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-sealedsecret-crd-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "hfWd3XB8eIBG0HkaS5gy0ohKbZEZhw+/rsdBh8PQVBc="
								}
								multi_step: {
									hash:       "SKM95PL12TKB4B1OP3C0GQFKN09E0VH6UGEO0QEM8SJCIPDNKOMG===="
									scriptHash: "ESJCHTPM3AU7LUCGRMASOAPO6L7V9MR7DPOQ9S91QOS69Q8UV3CG===="
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
										doc:      ""
										cmd:      "cue vet -c -d '#SealedSecret' cue.dev/x/crd/bitnami.com/sealed-secrets/v1alpha1@latest manifest.yaml"
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
