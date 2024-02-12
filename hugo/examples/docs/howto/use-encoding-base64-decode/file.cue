package example

import "encoding/base64"

// encoded contains some Base64-encoded data
encoded: "c29tZSBCYXNlNjQtZW5jb2RlZCBkYXRh"

// decoded contains the string interpolation of
// the byte array returned by base64.Decode
decoded: "\(base64.Decode(null, encoded))"
