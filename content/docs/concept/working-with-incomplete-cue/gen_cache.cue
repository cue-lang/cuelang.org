package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								cue:  "FS13x/3ES8MP2dED3nNSHvQ5JuE7kGTltJjc5KPkpec="
								data: "ADbgqlO6YCEDTtPHCX4csx/RCetrVZU0BxGA7X23sLs="
								go:   "d5/CuDnD8bbBS2uY/RoRmOYJWcKaOzTZR6p+jieROYU="
							}
							multi_step: {
								hash:       "Q0GH23MFEEVAT1O81VDCUMKVCQOCLJ8FPJKUEQOSFE1I3ETBU840===="
								scriptHash: "D86JL42Q787HA8F910RAEHBV8BA7UM6E48VSHTE68DA3H9102RO0===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-alpha.2.0.20250711132054-9ca9609cf83c"
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
