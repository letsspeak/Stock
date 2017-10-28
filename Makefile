.PHONY: 
	xcode

xcode:
	swift package -Xlinker -L/usr/local/lib generate-xcodeproj

