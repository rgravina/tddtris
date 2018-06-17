tests: sort units

ci: bootstrap tests

units:
	@xcodebuild -project TddTetris.xcodeproj -scheme "TddTetris" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=11.4,name=iPhone X" test

bootstrap:
	@carthage bootstrap --platform iOS

sort:
	perl ./bin/sortXcodeProject TddTetris.xcodeproj/project.pbxproj

update:
	@carthage update --platform iOS
