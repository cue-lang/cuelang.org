package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"drying-up-github-actions-workflows": {
						page: {
							cache: {
								upload: {
									"1": "p++xGDfEnz+eVUnS3qYQgfZl3GqN9eJoFCwDrQAZ7vA="
									"2": "3UM2mictz/x/kuoO9pqpsEha9aABmsY7y70Ij1ZltsU="
								}
								multi_step: {
									hash:       "MABGQ68MDI03A225DUJUJFQHNK1B9GQ3AMIS7HAG36R2F9DBRM5G===="
									scriptHash: "DJ7117DPLV7F11H48AMCJ7P3DNOO8AR6I9K9MEALDCIBBUQPT770===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
												...

												"""
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
										cmd:      "cue export ./ci/github --out yaml"
										exitCode: 0
										output: """
												workflows:
												  go:
												    name: Go
												    "on":
												      pull_request:
												        branches:
												          - main
												    jobs:
												      build:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Set up Go
												            uses: actions/setup-go@v4
												            with:
												              go-version: "1.20"
												          - name: Build
												            run: go build -v ./...
												          - name: Test
												            run: go test -v ./...
												  dotNet:
												    name: .NET
												    "on":
												      pull_request:
												        branches:
												          - main
												    jobs:
												      build:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Setup .NET
												            uses: actions/setup-dotnet@v4
												            with:
												              dotnet-version: 8.0.x
												          - name: Restore dependencies
												            run: dotnet restore
												          - name: Build
												            run: dotnet build --no-restore
												          - name: Test
												            run: dotnet test --no-build --verbosity normal

												"""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github | md5sum"
										exitCode: 0
										output: """
												2d30c3c0c51a277bb7683951015fa3f6  -

												"""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github --out yaml"
										exitCode: 0
										output: """
												workflows:
												  go:
												    name: Go
												    "on":
												      pull_request:
												        branches:
												          - main
												    jobs:
												      build:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Set up Go
												            uses: actions/setup-go@v4
												            with:
												              go-version: "1.20"
												          - name: Build
												            run: go build -v ./...
												          - name: Test
												            run: go test -v ./...
												  dotNet:
												    name: .NET
												    "on":
												      pull_request:
												        branches:
												          - main
												    jobs:
												      build:
												        runs-on: ubuntu-latest
												        steps:
												          - uses: actions/checkout@v4
												          - name: Setup .NET
												            uses: actions/setup-dotnet@v4
												            with:
												              dotnet-version: 8.0.x
												          - name: Restore dependencies
												            run: dotnet restore
												          - name: Build
												            run: dotnet build --no-restore
												          - name: Test
												            run: dotnet test --no-build --verbosity normal

												"""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github | md5sum"
										exitCode: 0
										output: """
												2d30c3c0c51a277bb7683951015fa3f6  -

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
