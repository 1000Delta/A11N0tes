package main

import (
	"log"
	"os"
	"os/exec"
)

const (
	hugoBuildCmd = "docker run --rm -v $(pwd):/src -p 1313:1313 klakegg/hugo build"
)

// GotoBlogDir 切换到博客目录
func GotoBlogDir() {
	if err := os.Chdir(cfg.WorkDir); err != nil {
		log.Printf("GotoBlogDir: %s", err.Error())
	}
}

// RunGitPull 运行 git pull 命令
func RunGitPull() {
	cmd := exec.Command("git", "pull")
	if err := cmd.Run(); err != nil {
		log.Printf("RunGitPull: %s", err.Error())
		return
	}
}

// RunHugoBuild 运行编译文件命令
func RunHugoBuild() {
	if path, err := exec.LookPath("docker"); err != nil {
		log.Printf("RunHugoBuild: lookpath error: %s", path+"  "+err.Error())
		return
	}
	cmd := exec.Command("/bin/sh", "-c", hugoBuildCmd)
	if err := cmd.Start(); err != nil {
		log.Printf("RunHugoBuild: start error: %s", err.Error())
		return
	}
	if err := cmd.Wait(); err != nil {
		log.Printf("RunHugoBuild: wait error: %s", err.Error())
		return
	}
}
