swift 相关面试题

1. let 和 var 的区别？
    let 和 var 的区别在于：let 用于声明常量，值不可变；var 用于声明变量，值可以改变。
    使用 let 声明的常量在初始化后不能再被赋值，而 var 声明的变量可以多次赋值。

2. struct 和 class 的区别？什么时候用哪个？
    struct 是值类型，class 是引用类型。
    struct 在赋值和传递时会进行值拷贝，而 class 在赋值和传递时会进行引用传递。
    struct 的实例在函数参数传递时也是值拷贝，而 class 的实例在函数参数传递时是引用传递。
    struct 的实例在函数参数传递时也是值拷贝，而 class 的实例在函数参数传递时是引用传递。
    一般来说，如果数据结构主要用于存储数据，且不需要继承、引用语义、需要线程安全、希望在多线程环境下避免数据竞争，推荐使用 struct。比如：点(Point)、矩形(Rect)、区间(Range)等。
    如果需要继承、需要引用语义（多个变量指向同一个实例）、需要在类之间共享状态，推荐使用 class。比如：视图控制器(ViewController)、自定义视图(View)、管理器(Manager)等。
    总结：
    - 优先使用 struct，只有在需要引用语义或继承时才使用 class。

3. struct 是线程安全么？

    struct 本身并不保证线程安全。虽然 struct 是值类型，赋值和传递时会进行值拷贝，但如果多个线程同时访问同一个 struct 实例（比如通过 inout 参数、全局变量、静态变量或引用类型中嵌套 struct），依然可能发生数据竞争和线程安全问题。

    线程安全主要取决于数据的访问方式，而不是类型本身。即使是 struct，如果存在并发写操作，也需要通过加锁（如 DispatchQueue、NSLock 等）或其他同步机制来保证线程安全。

    总结：
    - struct 的值语义有助于减少线程安全问题，但不能完全避免。
    - 只要有并发访问同一个实例的可能，就需要考虑线程安全措施。

4. struct 可以继承么？

    struct 不能继承其他 struct 或 class。也就是说，struct 之间没有继承关系，不能像 class 那样通过继承来扩展功能或重用代码。

    但是，struct 可以遵循（conform）协议（protocol），通过协议扩展功能。这是 Swift 推荐的代码复用和功能扩展方式。

    总结：
    - struct 不能继承，只能遵循协议。
    - 如果需要继承机制，应该使用 class。

    示例：

    ```swift
    protocol Drawable {
        func draw()
    }

    struct Circle: Drawable {
        func draw() {
            print("Draw a circle")
        }
    }
    ```







    
