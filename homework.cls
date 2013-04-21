% ib-assignment.cls
% Copyright 2009 Ankur Dave <ankurdave@gmail.com>
% 
% Licensed under the CC-GNU GPL version 2.0 or later.
% See http://creativecommons.org/licenses/GPL/2.0
% 
% See http://ankurdave.com/tex for more document classes.

\ProvidesClass{homework}
\LoadClass[11pt]{article}

% margins
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}

%Strings % Has to be set before makealetter
\AtBeginDocument{
  \@ifpackagewith{babel}{ngerman}{%
	  \newcommand{\groupText}{Gruppe:}
	  \newcommand{\tutorialText}{Tutorium:}
  }{
	  \newcommand{\groupText}{Group:}
	  \newcommand{\tutorialText}{Tutorial:}
  }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% fields that user can set (in addition to title, author, etc)
\makeatletter
	\newcommand{\members}[1]{\def \@members {#1}}
	\newcommand{\institute}[1]{\def \@institute {#1}}
	\newcommand{\subject}[1]{\def \@subject {#1}}
	\newcommand{\semester}[1]{\def \@semester {#1}}
	\newcommand{\tutor}[1]{\def \@tutor {#1}}
	\newcommand{\tutorial}[1]{\def \@tutorial {#1}}
	\newcommand{\groupid}[1]{\def \@groupid {#1}}
	\members{}
	\institute{}
	\subject{}
	\semester{}
	\tutor{}
	\groupid{}
	\tutorial{}
\makeatother

% title
\makeatletter
\def \maketitle {%
	% The goupinformation on the top left.
	{\raggedright
	\begin{minipage}[t]{0.45\textwidth}
		\vspace{0pt}
		\begin{tabular}{@{}lr}
			\@members\\
		\end{tabular}
		\ifx \@groupid \@empty
			\relax
		\else
			\\\groupText{} \@groupid
		\fi	
		\ifx \@tutor \@empty
			\relax
		\else
			\\Tutor: \@tutor
		\fi	
		\ifx \@tutorial \@empty
			\relax
		\else
			\\\tutorialText{} \@tutorial
		\fi	
	\end{minipage}
	% The information about the institute on the top right.
	\begin{minipage}[t]{0.45\textwidth}
		\vspace{0pt}
		\begin{flushright}
			\ifx \@institute \@empty
				\relax
			\else
				\@institute\\
			\fi	
			\ifx \@semester \@empty
				\relax
			\else
				\@semester
			\fi
		\end{flushright}
	\end{minipage}}
	
	\begin{center}
		\Large\textbf{\@subject}\\
		\ifx \@title \@empty
			\relax
		\else
			\@title
		\fi	
	\end{center}
	\rule{\textwidth}{.2pt}
}
\makeatother

\usepackage{titlesec}
\titleformat{\section}{\large\bfseries}{}{0pt}{}

% page headings and numbering
\makeatletter
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\footrulewidth}{\headrulewidth}
	\fancyhf{}
	\fancyhead[L]{%
		\ifx \@groupid \@empty
			\relax
		\else
			\groupText{} \@groupid
		\fi	
	}
	\fancyhead[C]{%
		\@title
	}
	\fancyhead[R]{%
		\ifx \@tutor \@empty
			\relax
		\else
			\@tutor
		\fi	
		\ifx \@tutorial \@empty
			\relax
		\else
			, \@tutorial
		\fi	
	}
	\fancyfoot[C]{\thepage}

	\thispagestyle{empty} % No header on the title page.
\makeatother
