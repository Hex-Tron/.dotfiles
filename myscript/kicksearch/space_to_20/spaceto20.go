package main
import "fmt"
//import "strings"
import "os"
func main (){
	args := os.Args[1]
	//	check:=" " 
	for _, ch := range args {
		if ch == ' '  {
		fmt.Print("%20")
	} else {
		fmt.Printf("%c", ch)
	}
	}

	fmt.Print("\n")
}

