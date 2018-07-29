DeCat配置使用方法：
1. 使用ant编译生成.jar文件

2. 将需要编译的.decaf文件拷贝到decat文件夹下

3. 在decat文件夹下执行make，就生成了对应的.s汇编文件

4. 生成的.s文件支持在uCore操作系统下运行，相应的系统调用模块已经集成在uCore操作系统的用户库中，只需将生成的.s文件拷贝到uCore操作系统的user-ucore文件夹中，然后编译整个uCore操作系统即可

