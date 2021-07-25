package main

// check_ua_valid 用于检查 webhook
func check_ua_valid(userAgent string) bool {
	for _, ua := range cfg.UserAgents {
		if ua == userAgent {
			return true
		}
	}

	return false
}
