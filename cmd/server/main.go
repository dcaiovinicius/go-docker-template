package main

import (
	"log"

	"github.com/gin-gonic/gin"
)

func getHello(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "Hello World!",
	})
}

func main() {
	router := gin.Default()
	router.GET("api/hello", getHello)

	log.Println("Server running on port 8080")

	log.Fatal(router.Run(":8080"))
}