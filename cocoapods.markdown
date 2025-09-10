### 1. pod install 和 pod update 的区别？

`pod install` 和 `pod update` 的主要区别在于:

**pod install:**

- 用于**首次安装**或**添加新的 pod** 到项目中
- 根据 Podfile.lock 文件安装指定版本的依赖
- 如果是首次运行,会创建 .xcworkspace 文件
- 不会更新已安装的 pod 到新版本
- 建议日常使用这个命令

**pod update:**

- 用于**更新已安装的 pod** 到新版本
- 会忽略 Podfile.lock,检查所有 pod 的新版本
- 会更新 pod 到符合 Podfile 约束的最新版本
- 会更新 Podfile.lock 文件
- 只在需要更新特定 pod 版本时使用

**最佳实践:**

- 首次安装和日常使用时用 `pod install`
- 需要更新特定 pod 版本时用 `pod update [PODNAME]`
- 将 Podfile.lock 文件提交到版本控制,保证团队使用相同版本
