package main

import (
	"fmt"
	"time"
)

func firstPing(c chan<- string) {
	for i := 0; ; i++ {
		c <- "ping 1"
		time.Sleep(time.Second * 1)
	}
}

func secondPing(c chan<- string) {
	for i := 0; ; i++ {
		c <- "ping 2"
		time.Sleep(time.Second * 2)
	}
}

func readPings(a <-chan string, b <-chan string) {
	for {
		select {
		case msg1 := <-a:
			fmt.Println(msg1)
		case msg2 := <-b:
			fmt.Println(msg2)
		}
	}
}

func main() {
	firstChannel := make(chan string)
	secondChannel := make(chan string)

	go firstPing(firstChannel)
	go secondPing(secondChannel)
	go readPings(firstChannel, secondChannel)

	var input string
	fmt.Scanln(&input)
}
