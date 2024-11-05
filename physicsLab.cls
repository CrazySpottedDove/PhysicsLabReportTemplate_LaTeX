\ProvidesClass{physicsLab}
\LoadClass[a4paper]{ctexart}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{geometry}
\geometry{left=3cm,right=3cm}
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
\NewDocumentCommand{\listbox}{mO{20em}mO{4ex}}{
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
    \begin{center}
    	\listbox{\sanhao\bfseries 实验名称：}{\sanhao \bfseries #1}[8ex]
    	\listbox{\sanhao\bfseries 指导教师：}{\sanhao \bfseries #2}[18ex]
    	\listbox{\sihao\bfseries 班级：}[23.5em]{\sihao \bfseries #3}
    	\listbox{\sihao\bfseries 姓名：}[23.5em]{\sihao\bfseries #4}
    	\listbox{\sihao\bfseries 学号：}[23.5em]{\sihao\bfseries #5}[8ex]
    \end{center}
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
    	\begin{minipage}[t][2ex][t]{4em}
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

\RequirePackage{lab-assistance}

\RequirePackage{graphicx}
\NewDocumentEnvironment{singlefigure}{omO{0.7}}{\begin{figure}[H]\centering\includegraphics[width=#3\textwidth]{#2}\IfNoValueF{#1}{\vspace{-1.2ex}\caption{#1}}}{\end{figure}}
%单张图片，环境内容为注释，均居中
\endinput
