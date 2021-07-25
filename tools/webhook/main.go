package main

import (
	"io"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	g := gin.Default()

	g.POST("/push", func(ctx *gin.Context) {

		// 基本信息检查
		if ctx.ContentType() != "application/json" ||
			check_ua_valid(ctx.Request.UserAgent()) {
			ctx.AbortWithStatus(http.StatusBadRequest)
		}

		GotoBlogDir()
		RunGitPull()
		RunHugoBuild()

		if _, err := io.WriteString(ctx.Writer, "ok"); err != nil {
			ctx.AbortWithStatus(http.StatusInternalServerError)
		}
	})

	g.Run(cfg.Port())
}

func init() {
	log.SetPrefix("[webhook]")
	LoadConfig()
}
