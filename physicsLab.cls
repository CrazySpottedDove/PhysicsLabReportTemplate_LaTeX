\ProvidesClass{physicsLab}
\LoadClass[a4paper]{ctexart}
\RequirePackage{amsmath}
\RequirePackage{tabularray}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\pagestyle{plain}
\newcommand{\fakebold}[1]{%
	\pdfliteral direct {2 Tr 0.4 w}% 启用描边模式，并设定描边宽度为 0.4
	#1% 打印文字
	\pdfliteral direct {0 Tr 0 w}% 恢复正常模式
}
\setCJKmainfont{simsun.ttc}[AutoFakeBold] 
\newcommand{\xiaochu}{\fontsize{36pt}{44pt}\selectfont}
% 小初字体大小
\newcommand{\sanhao}{\fontsize{16pt}{19pt}\selectfont}
% 三号字体大小
\newcommand{\sihao}{\fontsize{14pt}{17pt}\selectfont}
% 四号字体大小
\newcommand{\xiaosi}{\fontsize{12pt}{14pt}\selectfont}
\providecommand{\Romannumeral}[1]{\uppercase\expandafter{\romannumeral #1}}
%支持大写罗马字母显示
\NewDocumentCommand{\listbox}{mO{23em}mO{4ex}}{
    \mbox{#1}%
    \begin{minipage}[t][2ex][t]{#2}
        \centering
        \hspace{0pt}#3\\[-15pt]
        \rule{\linewidth}{1.2pt}
    \end{minipage}%
    \\[#4]}
\newcommand{\maketitlepage}[9]{
	\setcounter{page}{0}
    \newpage
    \begin{center}
        \xiaochu
        \textbf{普通物理学实验\Romannumeral{2}}\\
        \textbf{电子实验报告}\\[7.6ex]
    \end{center}
    \listbox{\sanhao\bfseries 实验名称：}{\sanhao \bfseries #1}[8ex]
    \listbox{\sanhao\bfseries 指导教师：}{\sanhao \bfseries #2}[18ex]
    \listbox{\sihao\bfseries 班级：}[26.5em]{\sihao \bfseries #3}
    \listbox{\sihao\bfseries 姓名：}[26.5em]{\sihao\bfseries #4}
    \listbox{\sihao\bfseries 学号：}[26.5em]{\sihao\bfseries #5}[8ex]
    \begin{center}
    	\sihao \bfseries 实验日期：%
    	\begin{minipage}[t][2ex][t]{2.5em}
    		\centering
    		\hspace{0pt}#6\\[-16pt]
    		\rule{\linewidth}{1.2pt}
    	\end{minipage}%
    	年%
    	\begin{minipage}[t][2ex][t]{2.5em}
    		\centering
    		\hspace{0pt}#7\\[-16pt]
    		\rule{\linewidth}{1.2pt}
    	\end{minipage}%
    	月%
    	\begin{minipage}[t][2ex][t]{2.5em}
    		\centering
    		\hspace{0pt}#8\\[-16pt]
    		\rule{\linewidth}{1.2pt}
    	\end{minipage}%
    	日\qquad 
    	星期%
    	\begin{minipage}[t][2ex][t]{2em}
    		\centering
    		\hspace{0pt}#9\\[-16pt]
    		\rule{\linewidth}{1.2pt}
    	\end{minipage}%
    	下午
    \end{center}
    \vspace{4ex}
    \begin{center}
    	\sihao 浙江大学物理实验教学中心
    \end{center}
    \clearpage
}
\titleformat{\section}[hang]{\sanhao\bfseries\raggedright}{\chinese{section}、}{1em}{}
\titleformat{\subsection}[hang]{\sihao\bfseries\raggedright}{\thesubsection}{1em}{}
\xiaosi
\usepackage{bm}
\usepackage{float}
\usepackage{tabularray}
\usepackage{calc}
\usepackage{etoolbox}
\NewDocumentCommand{\framed}{omo}{%
	\framebox[\widthof{#2}+4em]{
		\begin{minipage}{\widthof{#2}+2em}
			\quad\\[2ex]
			\centering #2
			\IfNoValueF{#1}{\caption{#1}\IfNoValueF{#3}{\em #3}}
		\end{minipage}
	}
}
\usepackage{tikz}
\usetikzlibrary{calc}
\usepackage{pgfplots}
\usepackage{ifthen}
\newcommand{\xlabel}{}
\newcommand{\xmin}{}
\newcommand{\xmax}{}
\newcommand{\ylabel}{}
\newcommand{\ymin}{}
\newcommand{\ymax}{}
\newboolean{xfield}
\newboolean{yfield}
\setboolean{xfield}{false}
\setboolean{yfield}{false}
\NewDocumentCommand{\xstyle}{moo}{
	\renewcommand{\xlabel}{#1}
	\IfNoValueF{#2}{
		\setboolean{xfield}{true}
		\renewcommand{\xmin}{#2}
		\renewcommand{\xmax}{#3}
	}
}
\NewDocumentCommand{\ystyle}{moo}{
	\renewcommand{\ylabel}{#1}
	\IfNoValueF{#2}{
		\setboolean{yfield}{true}
		\renewcommand{\ymin}{#2}
		\renewcommand{\ymax}{#3}
	}
}
\newcounter{markstyle}
\NewDocumentEnvironment{plot}{mos}{
	#1%
	\begin{tikzpicture}
		\setcounter{markstyle}{0}
		\ifbool{xfield}{
			\ifbool{yfield}{
				\begin{axis}[xlabel={\xlabel},ylabel={\ylabel},xmin=\xmin,xmax=\xmax,ymin=\ymin,ymax=\ymax,\IfNoValueF{#2}{#2,} legend pos= outer north east,grid= major,\IfBooleanT{#3}{axis equal,}]
				}{
					\begin{axis}[xlabel={\xlabel},ylabel={\ylabel},xmin=\xmin,xmax=\xmax,\IfNoValueF{#2}{#2,} legend pos= outer north east,grid= major,\IfBooleanT{#3}{axis equal,}]
					}
				}{
					\ifbool{yfield}{
						\begin{axis}[xlabel={\xlabel},ylabel={\ylabel},ymin=\ymin,ymax=\ymax,\IfNoValueF{#2}{#2,} legend pos= outer north east,grid= major,\IfBooleanT{#3}{axis equal,}]
						}{
							\begin{axis}[xlabel={\xlabel},ylabel={\ylabel},\IfNoValueF{#2}{#2,} legend pos= outer north east,grid= major,\IfBooleanT{#3}{axis equal,}]
							}
						}
					}{
				\end{axis}\end{tikzpicture}\setboolean{xfield}{false}\setboolean{yfield}{false}
			}
			
			\NewDocumentCommand{\datapoint}{O{}mo}{
				\ifcase\value{markstyle}
				\addplot[mark=*,solid,black,#1] coordinates {#2 };
				\IfNoValueF{#3}{\addlegendentry{#3 }}\stepcounter{markstyle}
				\or
				\addplot[mark=square*,dashed,green,#1] coordinates {#2 };
				\IfNoValueF{#3}{\addlegendentry{#3 }}\stepcounter{markstyle}
				\or
				\addplot[mark=diamond*,dotted,red,#1] coordinates {#2 };
				\IfNoValueF{#3}{\addlegendentry{#3 }}\stepcounter{markstyle}
				\or
				\addplot[mark=triangle*,blue,#1] coordinates {#2 };
				\IfNoValueF{#3}{\addlegendentry{#3 }}\stepcounter{markstyle}
				\or
				\addplot[mark=cross,yellow,#1] coordinates {#2 };
				\IfNoValueF{#3}{\addlegendentry{#3 }}\stepcounter{markstyle}
				\fi
			}
\endinput
