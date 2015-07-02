package main

import (
	"fmt"
	"net"
	"os"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Invalid number of arguments")
		os.Exit(1)
	}

	address, err := net.ResolveIPAddr("ip", os.Args[1])
	if err != nil {
		fmt.Println("Could not resolve IP address")
		os.Exit(1)
	}

	connection, connError := net.DialIP("ip:icmp", nil, address)

	if connError != nil {
		fmt.Println("Failed to create connection:", connError.Error())
		os.Exit(1)
	}

	var message [512]byte
	message[0] = 8 // Echo packet
	message[1] = 0
	message[2] = 0 // Checksum
	message[3] = 0 // Checksum
	message[4] = 0
	message[5] = 13 // Identifier
	message[6] = 0
	message[7] = 0
	length := 8

	checksum := computeChecksum(message[0:length])
	message[2] = byte(checksum >> 8)
	message[3] = byte(checksum & 255)

	fmt.Println("Connecting to", connection.RemoteAddr())

	connection.Write(message[0:length])
	fmt.Println("Wrote data")
	connection.Read(message[0:])
	fmt.Println("Read response")

	if message[5] == 13 {
		fmt.Println("identifier matches")
	}
	if message[7] == 37 {
		fmt.Println("Sequence matches")
	}
}

func computeChecksum(message []byte) uint16 {
	sum := 0

	for index := 1; index < len(message)-1; index += 2 {
		sum += int(message[index])*256 + int(message[index+1])
	}

	sum = (sum >> 16) + (sum & 0xffff)
	sum += (sum >> 16)

	var answer uint16 = uint16(^sum)
	return answer
}
