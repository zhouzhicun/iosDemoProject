###1.描述文件
#####描述文件主要由三部分组成：   
1. 文件夹描述(folder节点)，具体定义如下:
		
		folder|文件夹名 
2. 类描述(class节点)，具体定义如下：

		class|基类名|类名
		
3. 属性描述，具体定义如下:
		
		属性类型|属性名
	
#####注意: 
* 本脚本的目的主要是为了减轻view定义的工作量。因此为了兼顾配置简单化，属性描述中只能添加UI控件属性。
* 文件夹描述定义了一个文件夹，脚本会在类描述文件所有当前目录下创建该文件夹，并使得后续的类描述生成的.h.m文件都在该文件夹，直到下一个文件夹描述。
* 由于生成出来的.h.m文件，无法做到文件内容格式对齐，因此只能手工打开文件(双击默认xcode打开)
然后ctrl+a全选-->右击-->Structure-->Re-Indent


例如:

	folder|aaa
	
	class|UIView|loginView
	UILabel|nameLabel
	UILabel|textLabel
	UILabel|ageLabel
	UIImageView|imageView
	UIButton|loginButton
	
	class|UIView|RegisterView
	UILabel|nameLabel
	UILabel|textLabel
	UILabel|ageLabel
	UIImageView|imageView
	UIButton|loginButton
	
	class|XNLBaseViewModel|LoginViewModel
	
	class|UIViewController|LoginViewController






###2.如何使用脚本
1. 新创建一个文件夹，然后在该文件夹下面创建一个描述文件，文件名随意，然后写上类描述等。
2. 打开控制台，python start.py
3. 根据输出提示，把描述文件拖到控制台即可，然后回车。脚本就会在描述文件所在当前目录创建对应的子目录以及生成对应的.h.m文件到各个子目录。




###3. 脚本源码
1. ClassInfo.py:    
定义了OC类信息对应的py类。
类包括三要素：类的类型，基类， 属性数组。     
类的类型分为四种: cell, view, viewController, viewModel。
2. CodeTemplate.py:    
负责解析代码模板文件CodeTemplate.txt
3. CodeTemplate.txt:
代码模板，每一个模板由begin开头，end结束。
4. GenerateFile.py:
负责生成类文件(包括头文件，实现文件)
5. GenerateMethod.py:
负责生成对应的方法(包括UI方法，setter方法)
6. start.py:
入口脚本，负责解析类描述文件，并创建对应的OC类文件。



###4 总结
灵活使用该脚本以及[code Snippets](https://github.com/zhouzhiqun/code_Snippets)
，开发效率可以提高不少。

