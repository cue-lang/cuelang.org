package site
{
	content: {
		docs: {
			tutorial: {
				"cue-java-api": {
					page: {
						cache: {
							upload: {
								"compile CUE":      "1UFUBvtg852r0RAhvniYoElXxp1pwqZBg+6W4uOw6Ak="
								"convert CUE/Java": "LPpqkP4PBK3J77IX3qM0hY62SuFnrqSnhH1RzEnVa2Q="
								"CUE errors":       "0ZCFxcIW9OIa7TMJBzuD6l2pgBS44YodSUq5BQLOx+o="
								"validate CUE":     "WaqN+Fp7eGWKl6Kijzrpkf5xFdS1fAQxQ2h31F+6I/w="
							}
							multi_step: {
								hash:       "AORDOH9GDFRBKCKJBLOIEHFEPE5Q3Q8B426DBAGBO0E6S3CMCBG0===="
								scriptHash: "61PD6VDBJM3HU0H1EQR62D62I7L1N1941EI6EALAD1SV40DJJS9G===="
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
									cmd:      "export MAVEN_ARGS=\"-B\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export TERM=\"dumb\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.3 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "go env CGO_ENABLED"
									exitCode: 0
									output: """
											1

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cc -v 2>&1 | sed -n '/ version /p'"
									exitCode: 0
									output: """
											gcc version 12.2.0 (Debian 12.2.0-14) 
											...

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "java --version"
									exitCode: 0
									output: """
											openjdk 22.0.1 2024-04-16
											...

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "mvn -v"
									exitCode: 0
									output: """
											\u001b[1mApache Maven 3.8.7\u001b[m
											...

											"""
								}, {
									doc:      ""
									cmd:      "git -v"
									exitCode: 0
									output: """
											git version 2.39.2

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git clone https://github.com/cue-lang/libcue.git"
									exitCode: 0
									output: """
											Cloning into 'libcue'...
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd libcue"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go build -o libcue.so -buildmode=c-shared"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "export LD_LIBRARY_PATH=$(readlink -f .)"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $HOME"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git clone https://github.com/cue-lang/cue-api-java.git"
									exitCode: 0
									output: """
											Cloning into 'cue-api-java'...
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd cue-api-java"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "ls target/*.jar"
									exitCode: 0
									output: """
											target/CUE-0.0-devel.jar

											"""
								}, {
									doc:      ""
									cmd:      "cd $HOME"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "CUE_JAR=$(ls cue-api-java/target/CUE-*.jar)"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "javac -cp $CUE_JAR Compile.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Compile"
									exitCode: 0
									output: """
											x equals xx: false
											y equals yy: true
											v equals w: true
											x.a equals x.b.a: true

											"""
								}, {
									doc:      ""
									cmd:      "javac -cp $CUE_JAR Convert.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Convert"
									exitCode: 0
									output: """
											n1 equals n2: true
											aBool is false
											aLong is 42
											aDouble is 1.2345
											aString is hello
											aSlice is [1, 2, 3, 4, 5]
											aStruct is {"x":{"y":{"a":true,"b":42}}}

											"""
								}, {
									doc:      ""
									cmd:      "javac -cp $CUE_JAR WithErrors.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED WithErrors"
									exitCode: 0
									output: """
											expected '}', found 'EOF'
											field not found: x
											cannot use value 123 (type int) as string
											cue: marshal error: x: cannot convert incomplete value "bool" to JSON
											ok
											conflicting values 2 and 1

											"""
								}, {
									doc:      ""
									cmd:      "javac -cp $CUE_JAR Validate.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Validate"
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
