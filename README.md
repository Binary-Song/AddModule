# CMAKE 实用工程生成函数

# 使用方法

## 顶层CMakeLists

使用时，将文件拷贝某个目录，例如./cmake目录

然后确保在调用`AddModule`前调用以下5条语句：

```
cmake_minimum_required(VERSION 3.10)
project(项目名称)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
include(AddModule)
include(CTest)
```

1. `cmake_minimum_required(VERSION 3.10)`设置最低cmake版本3.10或以上
2. `project(YOUR_PROJECT_NAME)`创建cmake工程
3. `list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")`向`CMAKE_MODULE_PATH`中添加本文件所在的文件夹路径，这样下面的`include`就知道往哪里找文件。
4. `include(AddModule)`包括本模块
5. `include(CTest)`启用CTest

以上五条语句在顶层CMakeLists调用，不在顶层调用可能会出现问题。

## AddModule

```
AddModule(
   <header_only|compiled>     
   <module_name  模块名称>     
   [dependencies 模块依赖]    
   [src 源文件]            
   <tests 测试源文件>           
   [test_dependencies 测试依赖] 
)
```

- `header_only/compiled`: 模块是只有头文件还是需要编译，必须指定其一。如果需要编译，必须指定src源文件。

- `module_name  模块名称`: 模块的名称。

- `dependencies 模块依赖`: 模块依赖于哪些目标。

- `src 源文件`: 模块若需要编译则需指定此项，模块的源文件。

- `test 测试源文件`: 单元测试的源文件，每个测试会编译成一个目标。如果变量`TEST_DEFAULT_DEPENDENCY`已设置，则各测试会依赖于它。一般可将`TEST_DEFAULT_DEPENDENCY`设置为`Boost::unit_test_framework`

- `test_dependencies 测试依赖`: 单元测试需要依赖的额外目标。默认情况下，测试依赖于被测试模块和`TEST_DEFAULT_DEPENDENCY`，如果这些还不够，则再在此项里添加。