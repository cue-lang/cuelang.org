package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-the-central-registry": {
					page: {
						cache: {
							upload: {
								"initial config.cue": "ZkLOj2WPNrYqMl5fZFLm9UbPtLm0bdAB3ThrlVVscNU="
							}
							multi_step: {
								"068D472NMQI8B2R7DPL7P9QD24OMKK9J24VMMLIEV7L4FSVSA4P0====": [{
									doc:      ""
									cmd:      "export PATH=\"/cues/prerelease:$PATH\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p $HOME/.config/cue"
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOD >$HOME/.config/cue/logins.json
											{"registries":{"registry.cue.works":{"access_token":"${USER_AUTHN_CUE_NEW_USER}","token_type":"Bearer"}}}
											EOD
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "env"
									exitCode: 0
									output: """
											USER_UID=1000
											HOSTNAME=a5d4b7eba5cc
											USER_AUTHN_CUE_NEW_USER=devicev1_Rlw99wrbFWrw_8ApY2cXLw
											CUE_TEST_LOGINS={
											\t"registries": {
											\t\t"registry.cue.works": {
											\t\t\t"access_token": "devicev1_Rlw99wrbFWrw_8ApY2cXLw",
											\t\t\t"token_type": "Bearer"
											\t\t}
											\t}
											}
											PWD=/home/runner
											USER_GID=1000
											HOME=/home/runner
											GOLANG_VERSION=1.22.1
											TERM=dumb
											CUELANG_CUE_LATEST=v0.8.0
											CUELANG_CUE_PRERELEASE=v0.9.0-alpha.1
											SHLVL=1
											GOTOOLCHAIN=local
											NO_COLOR=true
											LC_ALL=C.UTF-8
											CUELANG_CUE_TIP=v0.9.0-alpha.1
											PATH=/cues/prerelease:/cues/latest:/go/bin:/usr/local/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
											OLDPWD=/
											GOPATH=/go
											_=/usr/bin/env

											"""
								}, {
									doc:      ""
									cmd:      "cat $HOME/.config/cue/logins.json"
									exitCode: 0
									output: """
											{"registries":{"registry.cue.works":{"access_token":"devicev1_Rlw99wrbFWrw_8ApY2cXLw","token_type":"Bearer"}}}

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "export CUE_EXPERIMENT=modules"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init glacial-tech.example/frostyapp@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "glacial-tech.example/frostyapp@v0"
											language: {
											\tversion: "v0.9.0-alpha.1"
											}
											deps: {
											\t"github.com/cue-labs/examples/frostyconfig@v0": {
											\t\tv: "v0.0.1"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											config:
											  appName: alpha
											  port: 80
											  features:
											    logging: true

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
