package main

import (
	"flag"
	"fmt"
	"log"
)

func main() {
	flag.Parse()
	if n := flag.NArg(); n != 1 {
		log.Fatalf("expected 1 arg; got %v", n)
	}
	greeting := flag.Arg(0)
	fmt.Printf("Hello, %s!\n", greeting)
}
