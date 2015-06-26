package main

import (
	"fmt"
	"net"
	"os"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Fprintf(os.Stderr, "Usage: %s hostname", os.Args[0])
		os.Exit(1)
	}

	hostname := os.Args[1]

	address, err := net.ResolveIPAddr("ip", hostname)

	if err != nil {
		fmt.Println("Failed to resolve hostname:", err.Error())
		os.Exit(1)
	}

	fmt.Println("IP address:", address.String())
	os.Exit(0)
}
