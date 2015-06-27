package main

import (
	"fmt"
	"net"
	"os"
)

func main() {
	service := ":1201"
	tcpAddress, addressError := net.ResolveTCPAddr("tcp", service)
	handleError(addressError)

	listener, listenerError := net.ListenTCP("tcp", tcpAddress)
	handleError(listenerError)

	for {
		connection, connectionError := listener.Accept()

		if connectionError != nil {
			continue
		}

		go handleConnection(connection)
	}
}

func handleConnection(connection net.Conn) {
	defer connection.Close()

	var buffer [512]byte

	for {
		n, err := connection.Read(buffer[0:])
		if err != nil {
			return
		}

		fmt.Println(string(buffer[0:]))
		_, writeError := connection.Write(buffer[0:n])

		if writeError != nil {
			return
		}
	}
}

func handleError(err error) {
	if err != nil {
		os.Exit(1)
	}
}
