package main

import (
	"fmt"
	"os"
)

func main() {
	td, _ := os.MkdirTemp("", "")
	fmt.Printf("> %v\n", td)
}
