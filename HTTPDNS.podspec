Pod::Spec.new do |s|

  s.name         = "HTTPDNS"
  s.version      = "0.4.0"
  s.summary      = "Use HTTP to resolve domain ( DNSPod AliYun )"

  s.description  = <<-DESC
                    HTTPDNS 库 Objective-C 实现。
                    支持 DNSPod、DNSPod 企业版、AliYunDNS 等（方便扩展）
                   DESC

  s.homepage     = "https://github.com/yourtion/HTTPDNS-OC"
  s.license      = "MIT"
  s.author       = { "Yourtion" => "yourtion@gmail.com" }
  s.source       = { :git => "https://github.com/yourtion/HTTPDNS-OC.git", :tag => s.version  }
  s.source_files = "HTTPDNS"
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  
  s.frameworks  = "Foundation"
  s.requires_arc = true

end
