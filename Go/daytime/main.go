package main

import (
	"fmt"
	"net"
	"os"
	"time"
)

func main() {
	service := "localhost:1200"
	tcpAddress, resolveError := net.ResolveTCPAddr("tcp", service)
	HandleError(resolveError)

	listener, listenerError := net.ListenTCP("tcp", tcpAddress)
	HandleError(listenerError)

	for {
		connection, connectionError := listener.Accept()

		if connectionError != nil {
			continue
		}

		time := time.Now().String()
		connection.Write([]byte(time))
		connection.Close()
	}
}

func HandleError(err error) {
	if err != nil {
		fmt.Fprintf(os.Stderr, "Encountered error: %s", err.Error())
		os.Exit(1)
	}
}
