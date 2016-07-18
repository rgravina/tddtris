tests: sort units

ci: bootstrap tests

units:
	@xcodebuild -project TddTetris.xcodeproj -scheme "TddTetris" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=9.3,name=iPhone 6" test

bootstrap:
	@carthage bootstrap --platform iOS

sort:
	perl ./bin/sortXcodeProject TddTetris.xcodeproj/project.pbxproj

update:
	@carthage update --platform iOS
