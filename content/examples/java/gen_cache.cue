package site
{
	content: {
		examples: {
			java: {
				page: {
					cache: {
						upload: {
							"compile CUE": "DSWxnpzTaJzFm+sgxsJ48MTMYVDHCb72Q1TlTKXCGXk="
						}
						multi_step: {
							hash:       "UUN01IHJ0KJ1USN99G5N55DL4G06AD25LD34OH8F9OFLO07J3KC0===="
							scriptHash: "U6URCM10UJ953KJNVG9BRSVRP2ER8GRP3CF3QIOPA83QDJN8TADG===="
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
								doc:      ""
								cmd:      "mvn --color=never package"
								exitCode: 0
								output: """
										\u001b[0m\u001b[0m[INFO] Scanning for projects...
										[WARNING] 
										[WARNING] Some problems were encountered while building the effective model for org.cuelang:CUE:jar:0.0-devel
										[WARNING] 'dependencies.dependency.version' for org.jetbrains:annotations:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 25, column 22
										[WARNING] 'dependencies.dependency.version' for org.junit.jupiter:junit-jupiter:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 31, column 22
										[WARNING] 
										[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
										[WARNING] 
										[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
										[WARNING] 
										[INFO] 
										[INFO] --------------------------< org.cuelang:CUE >---------------------------
										[INFO] Building CUE 0.0-devel
										[INFO]   from pom.xml
										[INFO] --------------------------------[ jar ]---------------------------------
										[INFO] 
										[INFO] --- resources:3.3.1:resources (default-resources) @ CUE ---
										[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
										[INFO] skip non existing resourceDirectory /home/runner/cue-api-java/src/main/resources
										[INFO] 
										[INFO] --- compiler:3.10.1:compile (default-compile) @ CUE ---
										[INFO] Changes detected - recompiling the module!
										[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
										[INFO] Compiling 14 source files to /home/runner/cue-api-java/target/classes
										[INFO] 
										[INFO] --- resources:3.3.1:testResources (default-testResources) @ CUE ---
										[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
										[INFO] skip non existing resourceDirectory /home/runner/cue-api-java/src/test/resources
										[INFO] 
										[INFO] --- compiler:3.10.1:testCompile (default-testCompile) @ CUE ---
										[INFO] Changes detected - recompiling the module!
										[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
										[INFO] Compiling 3 source files to /home/runner/cue-api-java/target/test-classes
										[INFO] 
										[INFO] --- surefire:3.0.0-M5:test (default-test) @ CUE ---
										[INFO] 
										[INFO] -------------------------------------------------------
										[INFO]  T E S T S
										[INFO] -------------------------------------------------------
										[INFO] Running org.cuelang.cue.AttributeTest
										[INFO] Tests run: 6, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.478 s - in org.cuelang.cue.AttributeTest
										[INFO] Running org.cuelang.cue.CueContextTest
										[INFO] Tests run: 17, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.222 s - in org.cuelang.cue.CueContextTest
										[INFO] Running org.cuelang.cue.ValueTest
										[INFO] Tests run: 32, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.266 s - in org.cuelang.cue.ValueTest
										[INFO] 
										[INFO] Results:
										[INFO] 
										[INFO] Tests run: 55, Failures: 0, Errors: 0, Skipped: 0
										[INFO] 
										[INFO] 
										[INFO] --- jar:3.4.1:jar (default-jar) @ CUE ---
										[INFO] Building jar: /home/runner/cue-api-java/target/CUE-0.0-devel.jar
										[INFO] ------------------------------------------------------------------------
										[INFO] BUILD SUCCESS
										[INFO] ------------------------------------------------------------------------
										[INFO] Total time:  9.139 s
										[INFO] Finished at: 2024-08-01T16:37:18Z
										[INFO] ------------------------------------------------------------------------
										\u001b[0m\u001b[0m
										"""
							}, {
								doc:      ""
								cmd:      ":"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "ls -l target/*.jar /usr/local/share/java/*.jar"
								exitCode: 0
								output: """
										-rw-r--r-- 1 root root 97700 Aug  1 09:26 /usr/local/share/java/CUE.jar
										-rw-rw-rw- 1 root root 97700 Aug  1 16:37 target/CUE-0.0-devel.jar

										"""
							}, {
								doc:      ""
								cmd:      "md5sum target/*.jar /usr/local/share/java/*.jar"
								exitCode: 0
								output: """
										b4d1c2fd54a0a6de4b52e7543b1f2be2  target/CUE-0.0-devel.jar
										6f7a7422f1ef9274a419ef65ecfe1cc1  /usr/local/share/java/CUE.jar

										"""
							}]
						}
					}
				}
			}
		}
	}
}
