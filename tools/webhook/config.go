package main

import (
	"fmt"
	"log"

	"github.com/BurntSushi/toml"
)

// Config 用于描述配置文件中的变量
type Config struct {
	PortNum int    `toml:"port"`
	WorkDir string `toml:"workdir"`
	UserAgents []string `tome:"useragent"`
}

// Port 将端口号数字加上 ":" 后返回
func (c *Config) Port() string {
	return fmt.Sprintf(":%d", c.PortNum)
}

var cfg Config

// LoadConfig 加载配置文件
func LoadConfig() {
	// 加载配置文件
	if _, err := toml.DecodeFile("./config.toml", &cfg); err != nil {
		log.Fatal(err.Error())
	}
}
