package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"upgrading-from-evalv2-to-evalv3": {
						page: {
							cache: {
								upload: {
									"main.go":                 "Yf5XwuJ03ZQtskT11uZgJ0NYk9Uqy6DXXD8N4/K8zxo="
									"HIDDEN: required output": "NEJnw6CcAQFrJ2cqgk9I0rfn0atAYci81NyP3Fn0XBA="
								}
								multi_step: {
									hash:       "B9O4MLDCHU1MBFA6OAKISG6I60RJTJ0UCGMDVHL244GD4GRMJSN0===="
									scriptHash: "R3592TOIRF8E83T86OPE9JL2LO00QI4FB0FQN7VAHQG7A25EKNIG===="
									steps: [{
										doc:      ""
										cmd:      "export GOMODCACHE=/caches/gomodcache"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export GOCACHE=/caches/gobuild"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go mod init evalv3.example"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go mod tidy"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      ""
										cmd:      "go run main.go >output.got.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff output.want.txt output.got.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.15.0-0.dev.0.20250822143201-1eff22f3f91f
												...

												"""
									}, {
										doc:      ""
										cmd:      "go vet ./..."
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "staticcheck ./..."
										exitCode: 0
										output: """
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
