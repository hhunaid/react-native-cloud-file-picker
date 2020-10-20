require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-cloud-file-picker"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  A file picker to pick files from cloud storage providers e.g. DropBox
                   DESC
  s.homepage     = "https://github.com/hhunaid/react-native-cloud-file-picker"
  s.license      = "MIT"
  s.authors      = { "Hunaid Hassan" => "hhunaid@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/hhunaid/react-native-cloud-file-picker.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true
  s.swift_version = '5'
  s.resources = ['ios/resources/DBChooser.bundle']

  s.dependency "React"
end

