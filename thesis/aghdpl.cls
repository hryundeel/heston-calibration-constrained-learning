%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% File:     aghdpl.cls           (LaTeX Document class option "aghdpl")
%          
% Author:  Marcin Szpyrka     (mszpyrka@agh.edu.pl)
%          Grzegorz J. Nalepa (gjn@agh.edu.pl)
%          Pawe\l{} K\l{}eczek      (p.l.kleczek@gmail.com)
%          Krzysztof Kluza (kluza@agh.edu.pl)
%          AGH University of Science and Technology, Krak\'ow, POLAND
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*** [aghdpl.cls] ---  (MSz, GJN, PK, KLUZA)  v4.0 <23.06.2019>  ***}       

\newif\ifpdflatex\pdflatexfalse
\NeedsTeXFormat{LaTeX2e} % 
\ProvidesClass{aghdpl} 
\DeclareOption{pdflatex}{\pdflatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} 
\ProcessOptions\LoadClass[a4paper,twoside,openright,12pt]{report} 

\RequirePackage{times}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{tocloft}

\RequirePackage[font=small, labelfont=bf, labelsep=period]{caption}
\RequirePackage{subcaption}
\RequirePackage{siunitx}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage[all,defaultlines=2]{nowidow} 

\let\temponeitem\itemize
\let\temptwoitem\enditemize
\let\temponeenum\enumerate
\let\temptwoenum\endenumerate
\renewenvironment{itemize}{\temponeitem\addtolength{\itemsep}{-0.3\baselineskip}}{\temptwoitem}
\renewenvironment{enumerate}{\temponeenum\addtolength{\itemsep}{-0.3\baselineskip}}{\temptwoenum}

\geometry{lmargin=30mm, rmargin=20mm, tmargin=30mm, bmargin=30mm, foot=10mm, head=10mm}
\definecolor{Green}{rgb}{0.1,0.5,0.1}

\def\shorttitlePL#1   {\gdef\@shorttitlePL{#1}}
\def\shorttitleEN#1   {\gdef\@shorttitleEN{#1}}
\def\shortauthor#1    {\gdef\@shortauthor{#1}}
\def\titlePL#1        {\gdef\@titlePL{#1}}
\def\titleEN#1        {\gdef\@titleEN{#1}}
\def\abstractPL#1    {\gdef\@abstractPL{#1}}
\def\abstractEN#1    {\gdef\@abstractEN{#1}}
\def\facultyEN#1      {\gdef\@facultyEN{#1}}
\def\facultyPL#1      {\gdef\@facultyPL{#1}}
\def\thesistypeEN#1   {\gdef\@thesistypeEN{#1}}
\def\thesistypePL#1   {\gdef\@thesistypePL{#1}}
\def\supervisorEN#1   {\gdef\@supervisorEN{#1}}
\def\supervisorPL#1   {\gdef\@supervisorPL{#1}}
\def\acknowledgements#1   {\gdef\@acknowledgements{#1}}
\def\department#1   {\gdef\@department{#1}}
\def\degreeprogramme#1 {\gdef\@degreeprogramme{#1}}
\def\album#1 {\gdef\@album{#1}}

\linespread{1.5}
\renewcommand{\labelitemi}{--}

\def\thesisheaders{
\fancyfoot[LE,RO]{\small \@shortauthor\quad\textit{\@shorttitlePL}}
}

\def\thesistablePL{
\begin{tabular}{p{45mm}l}
Autor: & {\itshape \@author}\\[-1mm]
Kierunek studi\'{o}w: & {\itshape \@degreeprogramme}\\[-1mm]
Opiekun pracy: & {\itshape \@supervisorPL}\\~&~\\
\end{tabular}
}

\DeclareOption{en}{
\def\thesisheaders{
\fancyfoot[LE,RO]{\small \@shortauthor\quad\textit{\@shorttitleEN}}
}

\def\thesistableEN{
\begin{tabular}{p{45mm}l}
Author: & {\itshape \@author}\\[-1mm]
Degree programme: & {\itshape \@degreeprogramme}\\[-1mm]
Supervisor: & {\itshape \@supervisorEN}\\
\end{tabular}
}
}

\ProcessOptions

\newcommand{\titlepages}{%
\newpage \titlepage 
\begin{center}
%\vspace*{1.5cm}
\includegraphics[scale=0.5]{agh}
\vspace*{2mm}

{\sffamily{\normalsize{\bfseries{\scshape Akademia G\'{o}rniczo-Hutnicza im. Stanis\l{}awa Staszica w Krakowie}}}

\vspace*{3mm}

{\small\bfseries \MakeUppercase{\@facultyPL}}}
\vspace*{6mm}

{\small{\MakeUppercase{\@department}}}
\vspace*{3mm}

{\sffamily\large \@thesistypePL}
\vspace*{10mm}

{\sffamily\large\itshape \@titleEN}
\vspace*{2mm}

{\sffamily\large\itshape \@titlePL}
\vspace{\fill}
\end{center}

\noindent
{\sffamily
\thesistablePL
}

\vspace*{17mm}

\centerline{\small\sffamily Krak\'{o}w, \@date}

\clearpage 

\newpage \titlepage 
\begin{center}
%\vspace*{1.5cm}
\includegraphics[scale=0.5]{agh}
\vspace*{2mm}

{\sffamily{\normalsize{\bfseries{\scshape AGH University of Krakow}}}


\vspace*{3mm}

{\small\bfseries \MakeUppercase{\@facultyEN}}}
\vspace*{6mm}

{\small{\MakeUppercase{\@department}}}
\vspace*{3mm}

{\sffamily\large \@thesistypeEN}
\vspace*{10mm}

{\sffamily\large\itshape \@titleEN}
\vspace*{2mm}

% {\sffamily\large\itshape \@titlePL}
\vspace{\fill}
\end{center}

\noindent
{\sffamily
\thesistableEN
}

\vspace*{17mm}

\centerline{\small\sffamily Krakow, \@date}

\clearpage 

\thispagestyle{empty} 

% {\normalsize\itshape ~ 
% }

\clearpage \titlepage

\clearpage \titlepage

\setcounter{page}{3}

\vfill

\centerline{SUMMARY}

\vspace{5mm}

\@abstractEN

\vspace{30mm}

\centerline{STRESZCZENIE}

\vspace{5mm}

\@abstractPL

\vfill

\vfill

\newpage

~\\

\newpage

\clearpage

\vspace*{12cm} \vfill
\begin{flushright} 
\begin{minipage}[!h]{11cm}
{\large\itshape \@acknowledgements}
\vspace{20mm}
\end{minipage}
\end{flushright}

\clearpage
\thispagestyle{empty}
\vspace*{15cm} \vfill
\clearpage

\setcounter{page}{7}

}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\fancyhf{}
\fancyhead{}
%\fancyhead[L]{\slshape{\small \rightmark}}
\fancyhead[RE,LO]{\slshape{\small \rightmark}}
%\fancyhead[R]{\bfseries \thepage}
\fancyhead[RO,LE]{\bfseries \thepage}

\thesisheaders

\frenchspacing
\sloppy 
\flushbottom


%---------------------------------------------------------------------------
% Ustawienia parametr\'ow tytu\l{}\'ow rozdzia\l{}\'ow, podrozdzia\l{}\'ow, itd.
%---------------------------------------------------------------------------

\titleformat{\chapter}[block]
{\bfseries\LARGE}{\filright \LARGE\thechapter. }{0ex}{}
%odst\k{e}py: lewy, g\'ora, d\'o\l{}
\titlespacing{\chapter}{0pt}{17mm}{19mm}
\titleformat{\section}[block]
{\bfseries\Large}{\filright \Large\thesection. }{0ex}{}
\titlespacing{\section}{7mm}{8mm plus 0mm minus 1mm}{4mm plus 0mm minus 1mm}
\titleformat{\subsection}[block]
{\bfseries\large}{\filright \large\thesubsection. }{0ex}{}
\titlespacing{\subsection}{7mm}{6mm}{2.5mm}
\titleformat{\subsubsection}[block]
{\bfseries\normalsize}{\filright \normalsize\thesubsubsection. }{0ex}{}
\titlespacing{\subsubsection}{7mm}{3mm}{1.5mm}


%---------------------------------------------------------------------------
% Ustawienia parametr\'ow generowania spisu tre\'sci i spisu rysunk\'ow
%---------------------------------------------------------------------------

\renewcommand{\cfttoctitlefont}{\bfseries\Large}
\renewcommand{\cftbeforetoctitleskip}{20mm}
\renewcommand{\cftaftertoctitleskip}{19mm}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\setlength{\cftparskip}{2pt}
\setlength{\cftbeforechapskip}{0mm}
\renewcommand{\cftchappagefont}{\normalsize}


%---------------------------------------------------------------------------
% Ustawienia wy\'swietlania liczb (zgodne z polskimi zwyczajami typograficznymi)
%---------------------------------------------------------------------------

\sisetup{
	output-decimal-marker = {,},
	%	round-mode=places,
	%	round-precision=4,
	group-separator={~},
}

%---------------------------------------------------------------------------
% Ustawienia wy\'swietlania URL-i
%---------------------------------------------------------------------------

% Zmiana kroju czcionki URL-i z czcionki o sta\l{}ej szeroko\'sci na szeryfow\k{a} z kursyw\k{a}.
\renewcommand\UrlFont{\rmfamily\itshape}


%---------------------------------------------------------------------------
% Ustawienia podpis\'ow pod ilustracjami
%---------------------------------------------------------------------------

\captionsetup[subfigure]{labelfont=md}
\captionsetup{%
	% U\.zyj okr\k{a}g\l{}ych nawias\'ow wok\'o\l{} odwo\l{}a\'n do "podilustracji".
	subrefformat=parens,
	% Margines z obu stron podpisu.
	margin=2cm,
	% W przypadku podpis\'ow mieszcz\k{a}cych si\k{e} w jednej linii nie stosuj justowania, tylko wy\'srodkuj ca\l{}y podpis.
	singlelinecheck=on,
}


%---------------------------------------------------------------------------
% \'srodowisko do tworzenia opis\'ow symboli u\.zytych w r\'ownaniu.
%---------------------------------------------------------------------------

\SetLabelAlign{parright}{\parbox[t]{\labelwidth}{\raggedleft#1}}
\setlist[description]{style=multiline, topsep=10pt, align=parright}

% Odst\k{e}p po obu stronach p\'o\l{}pauzy.
\newlength{\descriptiondashgap}
\setlength{\descriptiondashgap}{0.5em}

% Element na li\'scie symboli matematycznych u\.zytych w r\'ownaniu (symbol wyr\'ownany do prawej, oddzielony p\'o\l{}pauz\k{a} od definicji)
\renewcommand*\descriptionlabel[1]{\hspace \labelsep \normalfont \bfseries #1 \mdseries\hspace{\descriptiondashgap}--\hspace{\descriptiondashgap}}

% Odleg\l{}o\'s\'c p\'o\l{}pauzy od lewego marginesu.
\newlength{\eqwheremargin}
\setlength{\eqwheremargin}{2cm}

\newenvironment{eqwhere}[1][]
{%
\setlength{\eqwheremargin}{#1}%
\begin{description}[leftmargin=\eqwheremargin, itemsep=0cm, labelsep=0cm]
}
{\end{description}}
