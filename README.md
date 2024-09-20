# PhysicsLabReportTemplate_LaTeX
普通物理实验二的混合实验报告LaTeX模板
## 介绍
对普通物理实验二的混合实验报告Word模板的LaTeX复刻，供希望使用LaTeX写报告的同学使用。
## 使用
将.tex文件与模板放于同一文件夹，指定documentclass为physicsLab即可。

如果需要修改实验上/下午，在.cls文件内找到并修改即可。
## More
* 拥有 https://github.com/CrazySpottedDove/Lab-Assistance.git 内生成代码的依赖。
* 如果是使用TexStudio的windows用户，可将class-physicsLab.cwl文件放置在C:\Users\你的用户名\AppData\Roaming\texstudio\completion\user目录下以启用语法补全
* 提供了单张图片环境\begin{singlefigure}[标题]{imagefile}[大小因数，默认为0.7]，环境内的内容则作为图片的居中注释。