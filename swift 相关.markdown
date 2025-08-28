## Swift 相关面试题

### 1. let 和 var 的区别？

let 和 var 的区别在于：

- `let` 用于声明**常量**，值不可变；
- `var` 用于声明**变量**，值可以改变。

使用 `let` 声明的常量在初始化后不能再被赋值，而 `var` 声明的变量可以多次赋值。

---


### 2. struct 和 class 的区别？什么时候用哪个？

- `struct` 是**值类型**，`class` 是**引用类型**。
- `struct` 在赋值和传递时会进行**值拷贝**，而 `class` 在赋值和传递时会进行**引用传递**。
- `struct` 的实例在函数参数传递时也是值拷贝，而 `class` 的实例在函数参数传递时是引用传递。

**使用建议：**

- 如果数据结构主要用于存储数据，且不需要继承、引用语义、需要线程安全、希望在多线程环境下避免数据竞争，推荐使用 `struct`。  
  例如：点（Point）、矩形（Rect）、区间（Range）等。
- 如果需要继承、需要引用语义（多个变量指向同一个实例）、需要在类之间共享状态，推荐使用 `class`。  
  例如：视图控制器（ViewController）、自定义视图（View）、管理器（Manager）等。

**总结：**

- 优先使用 `struct`，只有在需要引用语义或继承时才使用 `class`。

---

### 3. struct 是线程安全么？

`struct` 本身**并不保证线程安全**。虽然 `struct` 是值类型，赋值和传递时会进行值拷贝，但如果多个线程同时访问同一个 `struct` 实例（比如通过 inout 参数、全局变量、静态变量或引用类型中嵌套 struct），依然可能发生数据竞争和线程安全问题。

线程安全主要取决于**数据的访问方式**，而不是类型本身。即使是 `struct`，如果存在并发写操作，也需要通过加锁（如 `DispatchQueue`、`NSLock` 等）或其他同步机制来保证线程安全。

**总结：**

- `struct` 的值语义有助于减少线程安全问题，但不能完全避免。
- 只要有并发访问同一个实例的可能，就需要考虑线程安全措施。

---

### 4. struct 可以继承么？

`struct` **不能继承**其他 `struct` 或 `class`。也就是说，`struct` 之间没有继承关系，不能像 `class` 那样通过继承来扩展功能或重用代码。

但是，`struct` 可以**遵循（conform）协议（protocol）**，通过协议扩展功能。这是 Swift 推荐的代码复用和功能扩展方式。

**总结：**

- `struct` 不能继承，只能遵循协议。
- 如果需要继承机制，应该使用 `class`。

### 5. Swift 中 的Optional 的实现与用法？

Swift 中的 Optional（可选类型）用于表示“有值”或“没有值”的情况。它的底层实现其实是一个枚举：

```swift
enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
```

```swift
var maybeInt: Int? = 10
maybeInt = nil
```

### 6. @escaping 与 非 @escaping 闭包的区别？

- 非 escaping 闭包在函数返回前调用；escaping 闭包可能存储到外部（例如网络回调、属性）后在函数返回后执行，需加 @escaping。
- escaping 闭包会捕获 self，更可能造成引用循环。

### 7. Swift 的错误处理（throws）与 Objective-C 的 NSError 方式差异？

- Swift 使用 throws、try、catch，是语言级别的错误处理。
- Objective-C 使用 NSError * 传出错误，需要通过指针参数。Swift 可桥接 NSError。

### 8. Swift 中如何实现多态？

- Swift 中没有多态的概念，因为 Swift 是静态语言，编译时就知道每个对象的类型。
- Swift 通过协议（protocol）和泛型（generic）来实现多态。
- 协议可以定义方法和属性，泛型可以实现类型安全的多态。

### 9. Any、AnyObject、Any? 的区别？

- Any 可以表示任何类型，包括函数类型。
- AnyObject 可以表示任何类类型。
- Any? 可以表示任何类型，包括 nil。

### 10. KVO、NotificationCenter、Delegate 三者的区别？何时用？

- Delegate：一对一、强契约（protocol），常用于组件回调（UITableViewDelegate）。
- NotificationCenter：广播、一对多，解耦但无返回值或结果流。
- KVO：观察属性变化，常用于 ObjC 兼容或 Cocoa 框架内部，Swift 原生支持受限。

选择依据：是否一对一、是否需要解耦、是否需要返回值。

### 11. 如何排查内存泄漏？常用工具/方法？

- 使用 Instruments 工具：
  - Allocations：检测内存分配和释放情况。
  - Leaks：检测内存泄漏。
  - Zombie Objects：检测僵尸对象。
  - Time Profiler：检测性能瓶颈。

- 使用 Xcode 的 Debug View Hierarchy 工具：
  - 检查视图层级，找到内存泄漏的根源。查看未释放的对象与引用链，查找 retain cycle。代码上注意 weak/unowned、闭包捕获列表、取消通知观察者等。

- 使用 Xcode 的 Debug Memory Graph 工具：
  - 检查内存使用情况，找到内存泄漏的根源。

### 12. Swift 并发（async/await）与 GCD 的区别，如何使用 Task？

Swift Concurrency（async/await、Task、Actor）是语言级并发模型，提供更清晰的异步控制流和结构化并发。Task { await foo() } 在新的并发任务中运行。和 GCD 相比，语义更清晰，错误/取消更好管理。示例：
```swift
Task {
  let data = try await fetchData()
  await MainActor.run { updateUI(data) }
}
```

### 13. @MainActor、@actor/actor 的用途？

- @MainActor：标记在函数或方法上，表示该函数或方法必须在主线程执行。
- @actor：标记在类上，表示该类是 actor 类型。
- actor：表示该类是 actor 类型。

@MainActor 标注某方法/类型必须在主线程执行（对 UI 友好）。actor 是保护其内部状态免受并发数据竞争的引用类型。用于并发安全。

### 14. 解释 map、flatMap、compactMap 在 Swift 中的区别?

- map：对元素逐一映射，结果数组长度不变（可能包含 nil）。
- compactMap：映射并移除 nil 值（常用于 optional 转换）。
- flatMap（数组版本）：先映射再扁平化嵌套数组；在 Optional 上的 flatMap 与 compactMap 行为相似（旧 API 区别）。



