# SwiftLintDemo
learn how to use swiftLint and fastLane

1. install swiftlint
        first way：
    use homebrew to install swiftlint in Shell
    '''brew search swiftlint'''
    '''brew install swiftlint'''
        second way：
    use cocosPods
    '''pod swiftlint'''

2. add some configutation
first step:
    Integrate SwiftLint into an Xcode scheme to get warnings and errors displayed in the IDE. Just add a new "Run Script Phase" with:

    if which swiftlint >/dev/null; then
        swiftlint
    else
        echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
    fi
    
    second step:
    configure swiftlint by adding a .swiftlint.yml file in project
    
