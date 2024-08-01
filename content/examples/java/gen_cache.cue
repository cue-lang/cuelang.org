package site
{
	content: {
		examples: {
			java: {
				page: {
					cache: {
						upload: {
							"HIDDEN: configure Maven download cache": "t4Yz0dMXCbVupdFBrZb7nVChiyYXPdRsMm28CtnZB6k="
							"compile CUE":                            "MOb+a0chdy34Ae6y2WsjKLJ096o/L12QuljnhKv5np8="
						}
						multi_step: {
							hash:       "D1AHD75NMT10I1E96QPRQ97LIB2U2OV5RI8PIF6V176IC5UKFH50===="
							scriptHash: "NKUR1J593KABPKSA67VCJP2EV61NAEGGV3RGUTMRD8HQ8I21H4A0===="
							steps: [{
								doc:      ""
								cmd:      "CUE_JAR=/usr/local/share/java/*"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "javac -cp \"$CUE_JAR\" Compile.java"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "java -cp \".:$CUE_JAR\" --enable-native-access=ALL-UNNAMED Compile"
								exitCode: 0
								output: """
										x equals xx: false
										y equals yy: true
										v equals w: true
										x.a equals x.b.a: true

										"""
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
								doc: """
										#ellipsis 0
										# Some colourised Maven output appears to be unavoidable,
										# even with -B, hence ellipsis=0
										"""
								cmd:      "mvn package"
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
