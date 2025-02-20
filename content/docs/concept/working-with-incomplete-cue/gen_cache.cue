package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								cue:  "tX1YFCK2n7BmD4TFPGp/tynJtBD9QNpH22mKM2wGGTk="
								data: "X8cMcBkj60mDBpuMWlwKwrSjs5KJswveFQj6Xe/IAUs="
								go:   "vRJNnFcLaYdngsLZRa8safC1jJxsgdsT/iMzwroTC1U="
							}
							multi_step: {
								hash:       "TO79CTIFPTN7DI2TBGAFCL428IDBVGA1UH0NLV7S6C1STK4O89VG===="
								scriptHash: "PN6Q9NILM79PUCS8M43BMBQ3R6ARPS41AKCPRJRVB6GCLJ5Q1C9G===="
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
									cmd:      "cue eval database.cue"
									exitCode: 0
									output: """
											connectionString: "\\(system)://\\(user):\\(password)@\\(host):\\(port)/\\(database)"
											system:           "postgres"
											host:             "prod.db.example.com"
											user:             "alex"
											port:             "5432"
											database:         "transactions"
											password:         string

											"""
								}, {
									doc:      ""
									cmd:      "cue export database.cue"
									exitCode: 1
									output: """
											password: incomplete value string:
											    ./database.cue:10:11
											connectionString: invalid interpolation: non-concrete value string (type string):
											    ./database.cue:3:19
											    ./database.cue:10:11

											"""
								}, {
									doc:      ""
									cmd:      "cue export database.cue secrets.yaml"
									exitCode: 0
									output: """
											{
											    "connectionString": "postgres://alex:Ch^ngeMeBef0r3GoL!ve@prod.db.example.com:5432/transactions",
											    "system": "postgres",
											    "host": "prod.db.example.com",
											    "user": "alex",
											    "port": "5432",
											    "database": "transactions",
											    "password": "Ch^ngeMeBef0r3GoL!ve"
											}

											"""
								}, {
									doc:      "# Export just the data source name as a text value."
									cmd:      "cue export database.cue secrets.yaml -e connectionString"
									exitCode: 0
									output: """
											"postgres://alex:Ch^ngeMeBef0r3GoL!ve@prod.db.example.com:5432/transactions"

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.12.0"
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
									cmd:      "go run ."
									exitCode: 0
									output: """
											step1: {
											\tconnectionString: "\\(system)://\\(user):\\(password)@\\(host):\\(port)/\\(database)"
											\tsystem:           "postgres"
											\thost:             "prod.db.example.com"
											\tuser:             "alex"
											\tport:             "5432"
											\tdatabase:         "transactions"
											\tpassword:         string
											}
											step2: {
											\tpassword: "Ch^ngeMeBef0r3GoL!ve"
											}
											result: {
											\tconnectionString: "postgres://alex:Ch^ngeMeBef0r3GoL!ve@prod.db.example.com:5432/transactions"
											\tsystem:           "postgres"
											\thost:             "prod.db.example.com"
											\tuser:             "alex"
											\tport:             "5432"
											\tdatabase:         "transactions"
											\tpassword:         "Ch^ngeMeBef0r3GoL!ve"
											}

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
