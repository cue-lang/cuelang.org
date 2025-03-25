package site
{
	content: {
		docs: {
			tutorial: {
				"cfgmgmtcamp-2025": {
					page: {
						cache: {
							upload: {
								"docker-compose.yml broken":          "9OGOryfUldV+7G28iOJO3LwfdsQYV/b5RsT9Ik+m3pY="
								schema:                               "f+p0X9BonF5XNzNOTbl1OSZDXVECJX8OXtloz/+7HBg="
								"docker-compose.yaml fixed":          "ARZlL1b4WsdYP5OrMhbtHzku49P9ZOhKfiiqMy4ules="
								"moreschema.cue":                     "K2mlpQpRjDMnY/gnViWJ8nXWs4WZXoqkTnl29QJx6Bc="
								"docker-compose.yaml really fixed":   "n/8Sjbk+1Uz8zLwPFv6OWcx0lQnU0Ck6dax+DAYEm9k="
								"link splotpolicy and splotservice1": "InEPrgDUZWfv40bqvYuXBrvBSLDXwcEwUPhUFHNmQaI="
							}
							multi_step: {
								hash:       "4V9K4HR1OCAG20Q6O6F700SIIMT8OT7AV2ITDUN9KVM3HS7KRQB0===="
								scriptHash: "D400CN0SES1U7PK9SLC4NJT5DJ9RNFL9M51DT6ONBCC5N2KGFOP0===="
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
											# TODO: this is inherently racey. But not a problem in practice...
											# for now. When it does become a problem we can solve this properly
											# using a nc-based wait loop or similar.
											"""
									cmd:      "nohup cue mod registry localhost:55443 >/tmp/cue_mod_registry 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'"
									exitCode: 1
									output: """
											services: field is required but not present:
											    ./schema.cue:4:2

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'"
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
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "cue.example"
											language: {
											\tversion: "v0.12.0"
											}
											deps: {
											\t"github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0": {
											\t\tv:       "v0.0.1"
											\t\tdefault: true
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'"
									exitCode: 1
									output: """
											services.web.volume: field not allowed:
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:8:2
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:8:8
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:18:22
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:19:4
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:19:30
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:272:18
											    .cache/cue/mod/extract/github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0.0.1/schema.cue:475:3
											    ./docker-compose.yaml:6:5
											    ./moreschema.cue:7:14
											    ./schema.cue:3:14
											    ./schema.cue:7:4
											    ./schema.cue:15:13

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod edit --source self"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod rename github.com/cue-examples/splotpolicy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_REGISTRY=github.com/cue-examples=127.0.0.1:55443"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.1"
									exitCode: 0
									output: """
											published github.com/cue-examples/splotpolicy@v0.0.1 to 127.0.0.1:55443/github.com/cue-examples/splotpolicy:v0.0.1

											"""
								}, {
									doc:      ""
									cmd:      "cue import -p splotservice1 -l 'content:' docker-compose.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat docker-compose.cue"
									exitCode: 0
									output: """
											package splotservice1

											content: services: {
											\tweb: {
											\t\timage: "docker.io/library/nginx:latest"
											\t\tports: ["8080:80"]
											\t\tvolumes: [
											\t\t\t"./html:/usr/share/nginx/html",
											\t\t\t"./config/nginx.conf:/etc/nginx/nginx.conf:ro",
											\t\t]
											\t}
											\tdb: image: "docker.io/library/postgres:16.4"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotservice1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "sed -i 's/postgres:16.4/postgres:17/' docker-compose.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotservice1"
									exitCode: 1
									output: """
											content.services.db.image: 3 errors in empty disjunction:
											content.services.db.image: conflicting values "docker.io/library/postgres:16.4" and "docker.io/library/postgres:17":
											    ./docker-compose.cue:12:13
											    ./schema.cue:10:12
											    ./service1.cue:5:10
											content.services.db.image: conflicting values "docker.io/library/postgres:16.5" and "docker.io/library/postgres:17":
											    ./docker-compose.cue:12:13
											    ./schema.cue:11:5
											    ./service1.cue:5:10
											content.services.db.image: conflicting values "docker.io/library/postgres:16.6" and "docker.io/library/postgres:17":
											    ./docker-compose.cue:12:13
											    ./schema.cue:12:5
											    ./service1.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "sed -i 's/postgres:17/postgres:16.4/' docker-compose.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c .:splotservice1"
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
