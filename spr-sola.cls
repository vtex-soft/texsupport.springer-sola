%% based on old style solarphysics.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spr-sola}[2023/08/16 v2.00,
    Springer base document class for "Solar Physics" journal]
\newcommand\@ptsize{1}
\newcommand\@pttensize{1}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

%% indent enumerate from margin by 1em
\newif\if@margspec
\DeclareOption{margspec}{\@margspectrue}

%% do not print \idline at the bottom
\newif\if@noid
\DeclareOption{noid}{\@noidtrue}

\newif\if@numreferences
\DeclareOption{namedreferences}{\@numreferencesfalse}
\DeclareOption{numreferences}{\@numreferencestrue}

%% load natbib
\newif\if@loadnatbib  \@loadnatbibtrue
\DeclareOption{natbib}{\@loadnatbibtrue}
\DeclareOption{nonatbib}{\@loadnatbibfalse}

\newif\if@optionalrh
\DeclareOption{optionalrh}{\@optionalrhtrue}

%% puts a link on a year citation (hyperref must be loaded)
\newif\if@linksfromyear\@linksfromyeartrue
\DeclareOption{linksfromyear}{\@linksfromyeartrue}
\DeclareOption{nolinksfromyear}{\@linksfromyearfalse}

%% show bibitem labels in square brackets at the end of bibitem
\newif\if@showbiblabel 
\DeclareOption{showbiblabels}{\@showbiblabeltrue}

%% makes enumerated list with roman numerals and a single right-bracket
\newif\if@solaromanenum 
\DeclareOption{solaromanenum}{\@solaromanenumtrue}

%% load hyperref
\newif\if@loadhyperref
\DeclareOption{hyperref}{\@loadhyperreftrue}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

\ExecuteOptions{twoside,draft}

\ProcessOptions % including options for modules

% A4 paper
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}
\setlength\textheight{198mm}
\setlength\textwidth{347\p@}

\setlength\parindent{12\p@}
\setlength\headheight{12\p@}
\setlength\headsep{14\p@}
\setlength\topskip{10\p@}
\setlength\footskip{17\p@}
\setlength\maxdepth{\z@}
\setlength\topmargin       {12mm}
\advance\topmargin by-7pt

\setlength\oddsidemargin   {16.5mm}% gutter margin
\setlength\evensidemargin  {16.5mm}% outer

\setlength\marginparwidth{0pt}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\@lowpenalty 51
\@medpenalty 151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty -\@lowpenalty
\@itempenalty -\@lowpenalty
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

\setlength\tabbingsep{\labelsep}
\clubpenalty=10000
\widowpenalty=10000

\newcount\@cla
\newcount\@clb
\hyphenation{equiv-a-lent equiv-a-lent-ly sat-is-fy sat-is-fies
             sat-is-fied}
\def\today{\ifcase\month\or January\or February\or March\or April\or
   May\or June\or July\or August\or September\or October\or November\or
   December\fi \space\number\day, \number\year}
\def\TODAY{\number\day/\ifcase\month\or 01\or 02\or 03\or 04\or 05\or
    06\or 07\or 08\or 09\or 10\or 11\or 12\fi/\number\year}
\def\timenow{%
  \@tempcnta=\time \divide\@tempcnta by 60 \number\@tempcnta:\multiply
  \@tempcnta by 60 \@tempcntb=\time \advance\@tempcntb by -\@tempcnta
  \ifnum\@tempcntb <10 0\number\@tempcntb\else\number\@tempcntb\fi}

%% this size is just to keep old style "1em" size
\def\innernormalsize{\@setfontsize\innernormalsize\@xipt{13}}
\innernormalsize

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\setlength{\leftmargini}{2em}
\setlength{\leftmarginii}{2.2em}
\setlength{\leftmarginiii}{1.87em}
\setlength{\leftmarginiv}{1.7em}
\setlength{\leftmarginv}{1em}
\setlength{\leftmarginvi}{1em}
\setlength{\labelsep}{.4em}
\setlength{\labelwidth}{\leftmargini}
\addtolength{\labelwidth}{-\labelsep}

\renewcommand\normalsize{%
   \@setfontsize\normalsize{10}{12pt plus .3pt minus .3pt}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus2\p@
   \abovedisplayshortskip 6\p@ \@plus2\p@
   \belowdisplayshortskip 6\p@ \@plus2\p@
   \belowdisplayskip \abovedisplayskip}
\normalsize

\newcommand\small{%
   \@setfontsize\small\@ixpt{11\p@ plus .2\p@ minus .2\p@}%
   \abovedisplayskip 7.5\p@ \@plus4\p@ \@minus1\p@
   \belowdisplayskip \abovedisplayskip
   \abovedisplayshortskip \abovedisplayskip
   \belowdisplayshortskip \abovedisplayskip}

\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.25\p@ plus .1pt minus .1pt}%%
   \abovedisplayskip 6\p@ \@plus4\p@ \@minus1\p@
   \belowdisplayskip \abovedisplayskip
   \abovedisplayshortskip \abovedisplayskip
   \belowdisplayshortskip \abovedisplayskip}

\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount  {11.5\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\bigskipamount  {23\p@ \@plus 6\p@ \@minus 3\p@}

%% from `omscmsy.fd'
\DeclareFontShape{OMS}{cmsy}{m}{n}{%
      <5><6><7><8><9-10>gen*cmsy%
      <10->cmsy10%
      }{}
\DeclareFontShape{OMS}{cmsy}{b}{n}{%
      <-6> cmbsy5 <6-8> cmbsy7 <8-> cmbsy10%
      }{}

% FOOTNOTES
\setlength\footnotesep   {10\p@}% 
\setlength{\skip\footins}{18\p@ \@plus 4\p@ \@minus 2\p@}
\skip\@mpfootins = \skip\footins
%
\def\footnoterule{\kern-3\p@ \hrule \@width 108\p@ \kern 2.6\p@} % the \hrule is .4pt high
\newcommand\@makefntext[1]{\@makefnmark #1}
\def\@makefnmark{\@textsuperscript{\normalfont\@thefnmark}}%


\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand\little{\@setfontsize\little\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\setlength\hoffset{-1in}
\setlength\voffset{0pt}

\setlength\marginparsep{10pt}
\setlength\marginparpush{5\p@}
\setlength\columnsep{10pt}
\setlength\columnseprule{0pt}
\setlength\fboxsep{3pt}
\setlength\fboxrule{.4pt}
\newdimen\id@boxheight

\AtBeginDocument{\setup@paper@size}
\def\setup@paper@size{
  \setlength\@tempdima{\paperwidth}%
  \addtolength\@tempdima{-\textwidth}%
  \divide\@tempdima by 2
  \setlength\@tempdimb\marginparwidth
  \addtolength\@tempdimb\marginparsep
  \addtolength\@tempdimb{2pc}%
  \ifdim \@tempdima <\@tempdimb
     \@settopoint\@tempdimb
     \GenericError{Pointsize}{Pointsize Error: Marginpars disabled}{}{You made
      your \string\textwidth\space (\the\textwidth) and
      \string\marginparwidth (\the\marginparwidth) too wide.\MessageBreak
      The allowed value for margin space: (\the\@tempdima). Needed value:
      (\the\@tempdimb).\MessageBreak
      This is not enough,
      so I will set \string\marginparwidth\space  to 0pt.\MessageBreak
      Let's hope that fixes it.
     }%
     \marginparwidth \z@
     \marginparsep \z@
  \fi
  \ifdim \@tempdima <2pc
     \@tempdimb=\paperwidth
     \advance\@tempdimb by -4pc
     \@settopoint\@tempdimb
     \GenericError{Pointsize}{Pointsize Error: Invalid sizes given}{}{You
     made your \string\textwidth\space (\the\textwidth)
     wider than the available total\MessageBreak
     (Which is: \the\@tempdimb). Please press X and try again.
     }%
  \fi
  \oddsidemargin \@tempdima
  \evensidemargin \@tempdima
  \setlength\@tempdima{\paperheight}
  \addtolength\@tempdima{-\footskip}
  \addtolength\@tempdima{-\headheight}
  \addtolength\@tempdima{-\headsep}
  \setlength\@tempdimb{\@tempdima}
  \addtolength\@tempdima{-\textheight}
  \divide\@tempdima by 2
  \ifdim \@tempdima <2pc
  \advance\@tempdimb by -4pc
  \@settopoint\@tempdimb
     \GenericError{Pointsize}{Pointsize Error: Invalid sizes given}{}{You
     made your \string\textheight\space (\the\textheight)
     more than the available total.\MessageBreak
     (Which is: \the\@tempdimb). Please press X and try again.
     }%
  \fi
  \setlength\topmargin{0pt}
  \setlength\id@boxheight{\@tempdima}
  \advance\id@boxheight by -2pc
}

\def\@listI{%
  \leftmargin \leftmargini
  \topsep  9\p@ \@plus 3\p@ \@minus 5\p@
  \partopsep 3\p@ \@plus 1\p@ \@minus 2\p@
  \itemsep 4.5\p@ \@plus 2\p@ \@minus 1\p@
  \parsep 4.5\p@ \@plus 2\p@ \@minus 1\p@ }
\def\@listii{%
  \leftmargin \leftmarginii
  \labelwidth \leftmarginii
  \advance\labelwidth by -\labelsep
  \topsep 4.5\p@ \@plus 2\p@ \@minus 1\p@
  \parsep 2\p@ \@plus 1\p@ \@minus 1\p@
  \itemsep \parsep}
\def\@listiii{%
  \leftmargin \leftmarginiii
  \labelwidth \leftmarginiii
  \advance\labelwidth by -\labelsep
  \topsep 2\p@ \@plus 1\p@ \@minus 1\p@
  \parsep \z@
  \partopsep 1\p@ \@plus 0\p@ \@minus 1\p@
  \itemsep \topsep}
\def\@listiv{%
  \setlength{\leftmargin}{\leftmarginiv}%
  \setlength{\labelwidth}{\leftmarginiv}%
  \addtolength{\labelwidth}{-\labelsep}}
\def\@listv{%
  \setlength{\leftmargin}{\leftmarginv}%
  \setlength{\labelwidth}{\leftmarginv}%
  \addtolength{\labelwidth}{-\labelsep}}
\def\@listvi{%
  \setlength{\leftmargin}{\leftmarginvi}%
  \setlength{\labelwidth}{\leftmarginvi}%
  \addtolength{\labelwidth}{-\labelsep}}
\let\@listi\@listI
\@listi

\setlength\floatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}

\def\labelenumi{\arabic{enumi}.}        % 1.
\def\theenumi{\arabic{enumi}}           % 1
\def\labelenumii{\alph{enumii})}        % a)
\def\theenumii{\alph{enumii}}           % a
\def\p@enumii{\theenumi}                % 1a
\def\labelenumiii{\it\roman{enumiii})}  % \it i)
\def\theenumiii{\roman{enumiii}}        % i
\def\p@enumiii{\theenumi(\theenumii)}   % 1(a)\it i)
\def\labelenumiv{\Alph{enumiv})}        % A)
\def\theenumiv{\Alph{enumiv}}           % A
\def\p@enumiv{\p@enumiii\theenumiii}    % 1(a)\it i)A

\def\labelitemi  {\textbullet}
\def\labelitemii {\textendash}
\def\labelitemiii{\textasteriskcentered} 
\def\labelitemiv {{\footnotesize +}}

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\newenvironment{description}{%
  \list{}{%
    \labelwidth\z@
    \itemindent -\leftmargin
    \let\makelabel\descriptionlabel
    }}{\endlist}
% \newskip\topsepm@th
\def\kapitemargs{%
\itemsep \z@%
\parsep \z@%
\leftmargini\z@%
\itemindent\z@%
}
\def\kapenumargs{%
   \topsep        \smallskipamount
   \partopsep     \z@ \@plus 1pt
   \itemsep       \z@ \@plus \z@
   \parsep        \z@ \@plus 1pt
   \if@margspec \else \leftmargini   \z@ \fi
   \if@margspec \else \leftmarginii  1em \fi
   \if@margspec \else \leftmarginiii 1em \fi
   \if@margspec \else \leftmarginiv  1em \fi
   \if@margspec
     \leftmargin\csname leftmargin\romannumeral\@enumdepth\endcsname
     \labelwidth\leftmargin
     \advance\labelwidth-\labelsep
   \fi
   \rightmargin   \z@
   \listparindent \z@
   \itemindent    \z@
  }

\renewcommand{\@mklab}[1]{#1\hfil} % for custom list env-s only
  
  
\def\@@enum@label#1{\hss \llap{#1}} % may stick out into l. margin
\def\@@item@label#1{\hss #1\hfil}

\def\enumerate{\@ifnextchar[%
    {\kap@enumerate}%
    {\if@margspec \kap@enumerate[]\else \kap@enumerate[0]\fi }}

    
    
\def\kap@enumerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
       \advance\@enumdepth \@ne
       \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
       \list{\csname label\@enumctr\endcsname}{%
         % \topsepm@th \topsep
         \kapenumargs
         \usecounter{\@enumctr}%
         \settowidth\labelwidth{#1.}%
         \setlength{\@tempdima}{\labelwidth}%
         \addtolength{\@tempdima}{\labelsep}%
         \if@margspec
           \ifdim \@tempdima > \leftmargin
             \setlength{\leftmargin}{\@tempdima}%
           \fi
         \else
             \setlength{\leftmargin}{\@tempdima}%
         \fi
         \let\makelabel\@@enum@label}%
     \fi
   }
\let\endenumerate\endlist

\if@solaromanenum
  \def\theenumi  {\@roman\c@enumi}
  \def\labelenumi  {\theenumi)}
\fi

\def\itemize{\@ifnextchar[{\kap@itemize}{\kap@itemize[]}}
\def\kap@itemize[#1]{\def\klu@arg{#1}%
    \ifnum \@itemdepth >3 \@toodeep
    \else
      \advance\@itemdepth \@ne
      \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
      \ifx \klu@arg\empty
        \list {\csname\@itemitem\endcsname}{%
        % \topsepm@th \topsep
        \kapitemargs
          \let\makelabel\@@item@label}%
      \else
        \list {\klu@arg }{%
          \kapitemargs
          \let\makelabel\@@item@label
          }%
      \fi
    \fi
    }
\let\enditemize\endlist
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@
      \itemindent -1.5em
      \listparindent \itemindent
      \rightmargin\leftmargin
      \advance\leftmargin 1.5em
  }\item[]}
\let\endverse\endlist

\def\quotation{\quoteskip
  \list{}{%
     \listparindent 1.5em
     \topsep .5ex plus 2pt minus 1pt
     \itemindent\listparindent
     \parsep 0pt plus 1pt
     }\item[]
  \hskip-\listparindent}
\def\endquotation{\endlist\quoteskip}

\def\quote{\quoteskip\list{}{%
  \leftmargin 1.5em
  \topsep .5ex plus 2pt minus 1pt
  }\item[]}
\def\endquote{\endlist\quoteskip}
\def\quoteskip{}

\newenvironment{notes}{\sectioncmd*{\notesname}\footnotesize
                    \begin{enumerate}}{\end{enumerate}%
                      \par \vskip 6pt \@plus 12pt \@minus 2pt}
\def\notesname{Notes}
\newcommand{\offprintsaddress}{Address for Offprints}
\newenvironment{thenomenclature}{\section*{Nomenclature}
    \parbox[t]{.48\textwidth}\bgroup\parindent 0pt
    \footnotesize \begin{tabular}{p{2pc}p{11pc}}}{%
              \end{tabular}\egroup}
\newcommand{\splitnomen}{\end{tabular}\egroup~\parbox[t]{.48\textwidth}%
    \bgroup\parindent 0pt \footnotesize \begin{tabular}{p{2pc}p{11pc}}}
\newcommand{\nmc}[1]{\parbox[t]{11pc}{\raggedright #1}}
\def\verbatim@font{\normalsize\tt}
\def\acknowledgementsname{Acknowledgements}%
\def\acknowledgements{\section*{\acknowledgementsname}%
  \message{\acknowledgementsname}}
\def\endacknowledgements{\par \bigskip}
\gdef\title#1{\title@{#1}}
\gdef\author#1{\author@{#1}}
\gdef\date#1{\date@{#1}}
\gdef\nodagger@{%
  \def\@fnsymbol##1{\ensuremath{\ifcase##1\or *\or \ddagger\or
  \mathsection\or \mathparagraph\or \|\or **
  \or \ddagger\ddagger \else\@ctrerr\fi}}}

\def\opening{\frontmatter}  
\def\endopening{\endfrontmatter}  
  
\def\frontmatter{%
  \let\title=\title@
  \let\author=\author@
  \let\date=\date@
  \let\arttype=\arttype@
  \let\subtitle=\subtitle@
  \let\dedication=\dedication@
  \let\translation=\translation@
  \let\received=\received@
  \let\accepted=\accepted@
  \let\revised=\revised@
  \let\institute=\institute@
  \hsize\textwidth
  \let\nodagger\nodagger@
  }
\gdef\maketitle{\endopening}
\def\endfrontmatter{%
  \ifx\listfiles\@notprerr \maketitle@@ \else
  \AtBeginDocument{\maketitle@@}\fi
  \gdef\title##1{\opening@only\title}
  \gdef\subtitle##1{\opening@only\subtitle}
  \gdef\orf##1{\opening@only\orf}
  \gdef\dedication##1{\opening@only\dedication}
  \gdef\translation##1{\opening@only\translation}
  \gdef\received##1{\opening@only\received}
  \gdef\revised##1{\opening@only\revised}
  \gdef\author##1{\opening@only\author}
  \gdef\institute##1{\opening@only\institute}
  \gdef\date##1{\opening@only\date}%
  \gdef\arttype##1{\opening@only\arttype}
  \gdef\nodagger{\opening@only\nodagger}
  }
\def\opening@only#1{\PackageWarning{spr-sola}{\string#1\space
                effective only inside frontmatter environment.}}
\def\authorsize{\normalsize \raggedright}
\def\authorcase#1{#1}
\def\authorindent{0pt}
\def\afterallauthorsskip{1em\relax}
\def\afterauthorskip{0pt}
\def\institutesize{\footnotesize\it}
\def\institutecase#1{#1}
\def\instituteindent{0pt}
\def\institutesep{.4\baselineskip}
\def\authorand{and}
\newtoks\@temptokenb
\long\def\append@item#1\to#2{%
  \@temptokena={\@k@p{#1}}%
  \@temptokenb=\expandafter{#2}%
  \xdef#2{\the\@temptokenb\the\@temptokena}}
\def\get@left#1\to#2{\expandafter\g@l#1\g@l#1#2}
\long\def\g@l\@k@p#1#2\g@l#3#4{\def#4{#1}\def#3{#2}}
\def\@authors{}%
\def\@allauthors{}%
\def\@institutes{}%
\def\@instituteauthors{}%
\def\@curauths{}
\def\@curinst{}
\def\author@#1{\append@item#1\to\@authors
  \append@item#1\to\@allauthors }
\def\institute@#1{\append@item#1\to\@institutes
  \expandafter\append@item\expandafter{\@authors}\to\@instituteauthors
  \gdef\@authors{}}
\newif\ifthanks
\newcount\cnt@authors
  
\def\@formatinstitute{{\institutesize \institutecase{\@curinst}\par}}
\newcount\cnt@institutes
\def\@authorsandinstitutes{\begingroup
  \authorsize
  \cnt@authors=0
  \def\@k@p##1{\advance\cnt@authors by 1}\@allauthors
  \cnt@institutes=0
  \def\@k@p##1{\advance\cnt@institutes by 1}\@institutes\relax
  \ifnum\cnt@institutes=0
    \let\@curauths\@allauthors
    \parindent=\authorindent
    \hangindent=\authorindent
    \@formatauthors
  \fi
  \loop\ifnum\cnt@institutes>0
    \get@left\@instituteauthors\to\@curauths
    \parindent=\authorindent
    \hangindent=\authorindent
    \@formatauthors
    \get@left\@institutes\to\@curinst
    \parindent=\instituteindent
    \hangindent=\instituteindent
    \@formatinstitute
    \ifnum\cnt@institutes>1 \vskip \institutesep\relax \fi
    \advance\cnt@institutes by -1
  \repeat
  \vskip \afterallauthorsskip
  \gdef\@authors{}%
  \gdef\@allauthors{}%
  \gdef\@institutes{}%
  \gdef\@instituteauthors{}%
  \gdef\@curauths{}%
  \gdef\@curinst{}%
\endgroup}
\def\titleflushstyle{}
\def\titlefont{\Large\rm}
\def\titlecase#1{#1}
\def\titleindent{0pt}
\def\aftertitleskip{1.8pc }
\def\presubtitleskip{-1.4pc }
\def\aftersubtitleskip{1pc }
\def\subtitlefont{\large\it}
\def\subtitleflushstyle{}
\def\title@#1{\gdef\@title{%
    \@formattitle{#1}\par \vskip \aftertitleskip }}
\def\@title{}
\def\@formattitle#1{\begingroup
  \def\thanks##1{\global\thankstrue}%
  \setbox\@tempboxa\vbox{#1}\endgroup
  \begingroup
    \titleflushstyle
    \ifthanks
      \def\fn##1\thanks##2{\ititle@{##1}{\,\thanks{##2}}}%
      \expandafter\fn#1
    \else
      \def\fn##1{\ititle@{##1}{}}\expandafter\fn\expandafter{#1}%
    \fi
  \endgroup\global\thanksfalse }
\def\titlebaselinefactor{1.05}
\def\ititle@#1#2{\begingroup
    \parindent \titleindent
    \hangindent \titleindent
    \hyphenpenalty10000
    {\titlefont\titlecase{#1}#2%
    \baselineskip=\titlebaselinefactor\baselineskip
    \par}
    \endgroup}
\def\@subtitle{}
\def\subtitle@#1{\gdef\@subtitle{\vskip \presubtitleskip
    \@formatsubtitle{#1}\par \vskip \aftersubtitleskip }}
\def\@formatsubtitle#1{\begingroup
  \def\thanks##1{\global\thankstrue}\setbox0\vbox{#1}\endgroup
  \begingroup \subtitleflushstyle
    \ifthanks
  \def\fn##1\thanks##2{\subtitle@thanks{##1}{##2}}\expandafter\fn#1
    \else
      \def\fn##1{\subtitle@@{##1}}\expandafter\fn\expandafter{#1}\fi
  \endgroup
  \par\global\thanksfalse}
\def\subtitle@thanks#1#2{\isubtitle@{#1}\thanks{#2}\par
    \ignorespaces}
\def\subtitle@@#1{\isubtitle@{#1}\par\ignorespaces}
\def\isubtitle@#1{{\subtitlefont #1}}

\def\afterdateskip{.7\baselineskip}
\def\datesize{\footnotesize}
\def\@date{{\datesize Received: \@received ;
    Accepted\@accepted}\vskip \afterdateskip
    \gdef\@received{\ldots\ldots}%
    \gdef\@accepted{\ldots\ldots}}
\def\date@#1{\gdef\@date{{\datesize #1\par}\vskip \afterdateskip
    \gdef\@received{\ldots\ldots}%
    \gdef\@accepted{\ldots\ldots}}}
\def\@received{\ldots\ldots}
\def\@accepted{: \ldots\ldots}
\def\revised@#1{\gdef\@accepted{ in revised form: #1}}
\def\received@#1{\gdef\@received{#1}}
\def\accepted@#1{\gdef\@accepted{ in final form: #1}}

\def\artsize{\normalsize\it}
\def\afterartskip{1.5pc}
\def\beforeartskip{0pc}
\def\@arttype{}
\def\arttype@#1{\gdef\@arttype{\vskip\beforeartskip\noindent
      {\artsize #1\vskip\afterartskip}}}
\def\@dedication{}
\def\dedicationsize{\normalsize\it\raggedright}
\def\prededicationskip{18pt}
\def\afterdedicationskip{18pt}
\def\dedication@#1{\gdef\@dedication{%
     \unskip\vskip \prededicationskip
     {\dedicationsize #1\par}%
     \vskip \afterdedicationskip}}
\def\@translation{}
\def\translationsize{\normalsize\it\raggedright}
\def\pretranslationskip{18pt}
\def\aftertranslationskip{18pt}
\def\translation@#1{\gdef\@translation{%
     \unskip\vskip \pretranslationskip
     {\translationsize #1\par}%
     \vskip \aftertranslationskip}}
\providecommand{\abstractname}{Abstract}
\providecommand{\keywordsname}{Keywords}
\providecommand{\abbreviationsname}{Abbreviations}
\providecommand{\nomenclaturename}{Nomenclature}
\def\abstractsize{\footnotesize}
\def\abstractnamefont{\bf}
\def\abstractdot{.~}
\def\keynamefont{\bf}
\def\nomennamefont{\bf}
\def\abbrevnamefont{\bf}
\def\classnamefont{\bf}
\def\afterabstractskip{.7\baselineskip\relax}
\def\preabstractskip{0pt\relax}
\newbox\@abstractbox
\def\@abstract{}
\def\@keywords{}
\long\def\keywords#1{%
    \gdef\@keywords{\message{\keywordsname}%
        {\abstractsize\noindent{\keynamefont
      \keywordsname:~}#1\par \vskip.7\baselineskip}}}
\def\@abbreviations{}
\def\abbrev#1#2{#1 -- #2}
\long\def\abbreviations#1{%
     \gdef\@abbreviations{\message{\abbreviationsname}%
        {\abstractsize\noindent{\abbrevnamefont \abbreviationsname:~}%
        #1\par \vskip.7\baselineskip}}}
\def\@nomenclature{}
\def\nomen#1#2{#1 -- #2}
\long\def\nomenclature#1{%
     \gdef\@nomenclature{\message{\nomenclaturename}%
       {\abstractsize\noindent{\nomennamefont
       \nomenclaturename:\par}\noindent #1\par \vskip.7\baselineskip}}}
\def\@classification{}
\long\def\classification#1#2{%
     \gdef\@classification{\message{Classification}%
       {\abstractsize\noindent{\classnamefont #1: }%
       #2\par \vskip.7\baselineskip}}}
\def\motto{\@ifnextchar[{\prosemotto}{\poemmotto}}
\newbox\mottobox
\def\@motto{}
\long\def\poemmotto{\global\setbox\mottobox\vbox \bgroup
        \noindent
         \hbox to\hsize\bgroup\begingroup
            \hfill\vbox\bgroup\hsize =15pc
            \footnotesize \raggedright \noindent
            \parskip=3pt}
\long\def\prosemotto[#1]{\global\setbox\mottobox\vbox \bgroup
            \noindent
         \hbox to\hsize\bgroup \begingroup
            \hfill\vbox\bgroup\hsize =15pc
            \raggedright \footnotesize \noindent
            \parskip=3pt}
\def\endmotto{\par \egroup \endgroup \egroup
    \vspace{1\baselineskip}\egroup
    \gdef\@motto{\par\message{Motto}\box\mottobox \gdef\@motto{}}}
\def\openingflushstyle{}
\def\maketitle@@{%
  \begingroup
     \setcounter{footnote}{0}%
     \def\thefootnote{\fnsymbol{footnote}}%
     \newpage\global\@topnum\z@
     \thispagestyle{opening}%
     {\openingflushstyle \parindent 0pt \@maketitle}%
     \markboth{\@runningauthor}{\@runningtitle}%
     \@thanks
   \endgroup
   \setcounter{footnote}{0}%
   \let\@maketitle\relax
   \gdef\@thanks{}%
   \gdef\@title{}%
   \let\thanks\relax }
\def\runningtitle#1{\gdef\@runningtitle{#1}}
\gdef\@runningtitle{}
\def\runningauthor#1{\gdef\@runningauthor{#1}}
\gdef\@runningauthor{}
\long\def\journaldata#1#2\dataend{%
  \edef\@tempa{@#1}\ifx \@tempa\@currjournal #2\fi}
\def\CLsize{\footnotesize}
\def\@journal{}
\def\@currjournal{}
\def\journalcode#1{%
  \edef\@currjournal{@#1}%
  }

\newif\if@speccright \@speccrightfalse
\AtBeginDocument{\gdef\@speccrightcheck{%
   \if@speccright
   \footnotetext[4]{\@spectextone{} \@speccright{} \@spectexttwo}%
   \fi }}
\def\@spectextone{The}
\newcommand\spectextone[1]{\gdef\@spectextone{#1}}
\def\@spectexttwo{right to retain a non-exclusive, royalty free
                 licence in and to any copyright is acknowledged.}
\newcommand\spectexttwo[1]{\gdef\@spectexttwo{#1}}
\newcommand\copyrightowner{\@ifstar{\crightA}{\crightB}}
\newcommand\crightA[1]{\gdef\@speccright{#1}\global\@speccrighttrue}
\newcommand\crightB[1]{\gdef\@copyrightowner{#1}\global\@speccrightfalse}
\def\@speccright{}
\def\@copyrightowner{Springer Science + Business Media}
\newcommand\country[1]{\gdef\@country{#1}}
\def\@country{the USA}
\newcommand\volume[1]{\gdef\@volume{#1}}
\def\@volume{00}
\newcommand\pubyear[1]{\gdef\@pubyear{#1}}
\def\@pubyear{\number\year}
\newif\iflastpagegiven   \lastpagegivenfalse
\newcommand\firstpage[1]{%
  \gdef\@firstpage{#1}%
  \ifnum\@firstpage>\c@page
    \setcounter{page}{#1}%
    \PackageWarning{spr-sola}{Increasing pagenumber to \@firstpage}%
  \else \ifnum\@firstpage<\c@page
    \PackageWarning{spr-sola}{Firstpage lower than pagenumber}\fi\fi
    \xdef\@firstpage{\the\c@page}%
    }
\def\@firstpage{1}
\def\pagenumbering#1{%
    \global\c@page \@ne
    \gdef\thepage{\csname @#1\endcsname \c@page}%
    \gdef\thefirstpage{%
            \csname @#1\endcsname \@firstpage}%
    \gdef\thelastpage{%
            \csname @#1\endcsname \@lastpage}%
    }
\pagenumbering{arabic}
\newcommand\lastpage[1]{\xdef\@lastpage{#1}%
  \global\lastpagegiventrue}
\def\@lastpage{0}
\def\setlastpage{\iflastpagegiven\else
    \edef\@tempa{@lastpage@}%
    \expandafter
    \ifx \csname \@tempa \endcsname \relax
        \gdef\@lastpage{0}%
    \else
        \xdef\@lastpage{\@nameuse{@lastpage@}}%
    \fi
    \fi }
\def\writelastpage{%
    \iflastpagegiven \else
    \immediate\write\@auxout%
    {\string\global\string\@namedef{@lastpage@}{\the\c@page}}%
    \fi
    }
\def\thepagerange{%
  \ifnum\@lastpage =0 {\ \bf PLEASE RUN AGAIN} \else
  \ifnum\@lastpage = \@firstpage \ \thefirstpage\else
  \ \thefirstpage--\thelastpage \fi\fi}

\gdef\markboth#1#2{{\let\protect=\noexpand
    \xdef\myleftmark{\Uppercase{#1}}%
    \xdef\myrightmark{\Uppercase{#2}}}}
\let\imarkboth\markboth
\def\myleftmark{}
\def\myrightmark{}
\def\@markfont{\rm\scriptsize}
\def\@pgnumfont{\rm\normalsize}

\def\ps@empty{%
  \def\@oddfoot{\idline\hfil }%
  \let\@evenfoot\@oddfoot
  \def\@evenhead{}%
  \def\@oddhead{}%
  \let\@mkboth\@gobbletwo
  \def\chaptermark##1{}%
  \def\sectionmark##1{}%
  \def\subsectionmark##1{}}

\newcounter{article}
\let\ilabel=\label
\let\iref=\ref
\let\ipageref=\pageref

\AtBeginDocument{\setlastpage}
\AtEndDocument{\writelastpage}

\parskip 0pt
\hyphenpenalty 200
\doublehyphendemerits 640000  % corresponds to badness 800
\finalhyphendemerits  1000000  % corresponds to badness 1000
\arraycolsep 3pt
\tabcolsep 6pt
\arrayrulewidth .4pt
\doublerulesep 2pt

%%%%%%%%% tabular, table, figure
\def\@rcline[#1-#2]{%
  \noalign{%
       \global\@cla #1\relax
       \global\advance\@cla\m@ne
       \ifnum\@cla >0
         \global\let\@tabklu@tmpa\@rclinea
       \else
         \global\let\@tabklu@tmpa\@rclineb
       \fi
       \global\@clb #2\relax
       \global\advance\@clb-\@cla }%
    \@tabklu@tmpa
    \noalign{\vskip-\arrayrulewidth}%
  }%
\def\@rclinea{%
    \multispan\@cla&\multispan\@clb
    \hbox to 3pt{\hfil }%
    \unskip
    \leaders\hrule \@height \arrayrulewidth\hfill
    \cr}%
\def\@rclineb{%
   \multispan\@clb
   \hbox to 3pt{\hfil }%
   \unskip
   \leaders\hrule \@height \arrayrulewidth\hfill
   \cr}%
\def\@lcline[#1-#2]{%
  \noalign{%
     \global\@cla #1\relax
     \global\advance\@cla\m@ne
     \ifnum\@cla >0
        \global\let\@tabklu@tmpa\@lclinea
     \else
        \global\let\@tabklu@tmpa\@lclineb
     \fi
     \global\@clb #2\relax
     \global\advance\@clb-\@cla
  }\@tabklu@tmpa
  \noalign{\vskip-\arrayrulewidth}%
}%
\def\@lclinea{%
     \multispan\@cla&\multispan\@clb
     \unskip
     \leaders\hrule \@height \arrayrulewidth\hfill
     \hbox to 3pt{\hfil }\cr}%
\def\@lclineb{%
     \multispan\@clb
     \unskip
     \leaders\hrule \@height \arrayrulewidth\hfill
     \hbox to 3pt{\hfil }\cr}%
\def\@lrcline[#1-#2]{%
   \noalign{%
     \global\@cla #1\relax
     \global\advance\@cla\m@ne
     \ifnum\@cla>0
        \global \let\@tabklu@tmpa\@lrclinea
     \else
        \global \let\@tabklu@tmpa\@lrclineb
     \fi
     \global \@clb #2\relax
     \global \advance\@clb-\@cla
     }%
     \@tabklu@tmpa
     \noalign{\vskip -\arrayrulewidth}%
  }%
\def\@lrclinea{%
     \multispan\@cla&\multispan\@clb
     \hbox to 3pt{\hfil }%
     \unskip\leaders\hrule \@height \arrayrulewidth\hfill
     \hbox to 3pt{\hfil }%
     \cr}%
\def\@lrclineb{%
     \multispan\@clb
     \hbox to 3pt{\hfil }%
     \unskip\leaders\hrule \@height \arrayrulewidth\hfill
     \hbox to 3pt{\hfil }%
     \cr}%
\newlength\stretchtabsep
\setlength\stretchtabsep{0pt plus 1fil}

\def\sola@tabular{%
    \let\savehline\hline
    \def\tabular{\begingroup
       \def\hline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}%
       \def\rcline####1{\@rcline[####1]}%
       \def\lcline####1{\@lcline[####1]}%
       \def\lrcline####1{\@lrcline[####1]}%
       \let\rlcline=\lrcline
        \setbox\strutbox\hbox{\vrule height.8\baselineskip
                depth.4\baselineskip width\z@}%
        \setbox0=\hbox\bgroup\def\@halignto{}\@tabular}%
    \def\endtabular{\crcr\egroup\egroup $\egroup
      \egroup \tabwidth{\wd0}\unhbox0 \endgroup}%
    \let\klu@intarray\array
    \let\klu@intendarray\endarray
    \def\array{\begingroup \let\hline\savehline \klu@intarray }
    \def\endarray{\klu@intendarray \endgroup}
    \@ifundefined{newcolumntype}{% array.sty not loaded
        \@namedef{tabular*}##1{%
           \begingroup
           \let\savehline\hline
           \def\hline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}%
           \def\rcline####1{\@rcline[####1]}%
           \def\lcline####1{\@lcline[####1]}%
           \def\lrcline####1{\@lrcline[####1]}%
           \let\rlcline=\lrcline
             \setbox\strutbox\hbox{\vrule height.8\baselineskip
                    depth.4\baselineskip width\z@}%
              \setbox0=\hbox\bgroup\def\@halignto{to ##1}%
                \def\@tabacol{\edef\@preamble{\@preamble
                    \tabskip \stretchtabsep \hskip \tabcolsep}}\@tabular}%
    }{% array.sty loaded:
        \@namedef{tabular*}##1{%
           \begingroup
           \let\savehline\hline
           \def\hline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}%
           \def\rcline####1{\@rcline[####1]}%
           \def\lcline####1{\@lcline[####1]}%
           \def\lrcline####1{\@lrcline[####1]}%
           \let\rlcline=\lrcline
             \setbox\strutbox\hbox{\vrule height.8\baselineskip
                    depth.4\baselineskip width\z@}%
              \setbox0=\hbox\bgroup
              \gdef\@halignto{to ##1}%
                \@tabular}%
    } % end array.sty loaded
    \@namedef{endtabular*}{\endtabular}
    \def\TABULAR{%
         \let\savehline\hline %compatibility
         \let\rcline\cline \let\lcline\cline
         \let\lrcline\cline \let\rlcline\cline
         \setbox0=\hbox\bgroup\def\@halignto{}\@tabular}%
    \def\endTABULAR{\crcr\egroup\egroup $\egroup
      \egroup \tabwidth{\wd0}\unhbox0 }%
    \@namedef{TABULAR*}##1{%
         \let\savehline\hline %compatibility
         \let\rcline\cline \let\lcline\cline
         \let\lrcline\cline \let\rlcline\cline
         \setbox0=\hbox\bgroup\def\@halignto{to ##1}\@tabular}%
    \@namedef{endTABULAR*}{\endtabular}%
} 
\AtBeginDocument{\sola@tabular}


\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand{\topfraction}{.85}
\renewcommand{\textfraction}{.01}
\renewcommand{\bottomfraction}{.4}
\renewcommand{\floatpagefraction}{.84}
\renewcommand{\dblfloatpagefraction}{.84}
\renewcommand{\dbltopfraction}{.7}
\def\figtabdot{.}
\def\tablename{Table}%
\def\figurename{Figure}%
\def\algorithmname{Algorithm}%

\skip\@mpfootins = \skip\footins
\renewcommand \theequation {\@arabic\c@equation}
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newdimen\maxfloatwidth
\newbox\figtabbox
\newdimen\floatindent
\newdimen\@tabskip
\gdef\cap@type{0}
\newdimen\captionskip
\setlength\captionskip{6pt}
\newdimen\@tabwidth
\setlength\@tabwidth{\textwidth}
\def\tabwidth#1{\global\setlength\@tabwidth{#1}}
\def\@getmaxwidth{\maxfloatwidth=\hsize
    \if@kaprotate \maxfloatwidth=\textheight \fi }
\def\@floatcorrect{\if@kaprotate\else
  \advance\maxfloatwidth -\floatindent \fi }
\def\hbox@to@floatwidth#1{\leavevmode
        \hbox to \@tabwidth{#1}}
\def\@getindent{%
   \ifnum\cap@type=2 \else
        \@tabwidth=\if@kaprotate \textheight \else \hsize \fi
        \if@figindent\advance \@tabwidth -\floatindent \fi\fi
   \ifnum\cap@type=1
     \if@figindent \@tabskip\floatindent
       \else \@centeredfloat \fi
   \else \ifnum\cap@type=2
            \if@tabindent \@tabskip\floatindent
               \else \@centeredfloat  \fi
            \ifdim \@tabwidth > \maxfloatwidth
                \@tabskip 0pt
                \floatindent 0pt
            \fi
         \else
            \@centeredfloat
         \fi
   \fi
}
\def\@centeredfloat{%
     \floatindent\maxfloatwidth
     \advance\floatindent by -\@tabwidth
     \divide\floatindent by 2
     \@tabskip\floatindent
     \if@kaprotate
       \@tabskip\hsize
       \advance\@tabskip by -\ht\figtabbox
       \advance\@tabskip by -\dp\figtabbox
       \divide\@tabskip by 2
     \fi
}
\newif\if@centeredfigcaption
\newif\if@centeredtabcaption
\@centeredtabcaptiontrue
\@centeredfigcaptiontrue
\def\indentedtabcaptions{\global\@centeredtabcaptionfalse }
\def\indentedfigcaptions{\global\@centeredfigcaptionfalse }
\def\indentedcaptions{\global\@centeredtabcaptionfalse
    \global\@centeredfigcaptionfalse}
\newdimen\captionindent
\setlength\captionindent{0pt}
\newtoks\@floatcaption
\def\tabcapspace{.5em}
\def\tabcapfont{\footnotesize }
\long\def\@maketabcaption#1#2{\global\@floatcaption={#2}%
   \message{\tablename\space\thetable \if@kaprotate
     \space(rotated) \fi}}
\def\@klu@caption{%
  \setbox1=\hbox{\tabcapfont\fnum@table\hskip\tabcapspace
    \the\@floatcaption}%
  \noindent
  \ifdim\wd1 >\@tabwidth
     {\if@centeredtabcaption\centering\else \hskip \captionindent\fi
     \parbox[b]{\@tabwidth}{\tabcapfont\unhbox1}}%
  \else
     \hbox to \@tabwidth{%
       \if@centeredtabcaption \hfil \else \hskip \captionindent\fi
       \tabcapfont\fnum@table
       \hskip\tabcapspace{\tabcapfont\the\@floatcaption}\hfil }%
  \fi
  \if@kaprotate \else \par \vskip -\baselineskip \fi
  \par
}
\def\@klu@figcaption{%
  \setbox1=\hbox{\figcapfont\fnum@figure\hskip\tabcapspace
            \the\@floatcaption}%
  \noindent
  \ifdim\wd1 >\@tabwidth
     {\if@centeredfigcaption\centering\else \hskip \captionindent\fi
     \parbox{\@tabwidth}{\figcapfont\unhbox1}}%
  \else
     \hbox to \@tabwidth{%
       \if@centeredfigcaption \hfil\else \hskip \captionindent\fi
       \tabcapfont\fnum@figure
       \hskip\tabcapspace{\figcapfont\the\@floatcaption}\hfil}%
  \fi
  \par
}
\def\splitcaptions{\splittabcaptions\splitfigcaptions}
\def\splittabcaptions{
  \def\@klu@caption{%
    \setbox1=\hbox{\tabcapfont\the\@floatcaption}%
    \noindent
    \ifdim\wd1 >\@tabwidth
     \hbox to \@tabwidth{\if@centeredtabcaption\hss\else
       \hskip\captionindent\fi
     \tabcapfont\fnum@table\hss}\vskip \tabcapspace
       \vskip 6pt
     {\if@centeredtabcaption\centering\fi
       \hskip \captionindent
          \parbox{\@tabwidth}{\tabcapfont\unhbox1}}%
   \else
     \hbox to \@tabwidth{%
       \if@centeredtabcaption \hfil\else \hskip\captionindent\fi
       \tabcapfont\fnum@table\strut\hfil }\vskip \tabcapspace
      \hbox to \@tabwidth{%
       \if@centeredtabcaption \hfil\else \hskip\captionindent \fi
       \tabcapfont\the\@floatcaption \hfil }%
       \if@kaprotate \else \par \vskip -\baselineskip \fi
   \fi
   \par
}}
\def\splitfigcaptions{\def\@klu@figcaption{%
    \setbox1=\hbox{\figcapfont\the\@floatcaption}%
    \noindent
    \ifdim\wd1 >\@tabwidth
     \hbox to \@tabwidth{\if@centeredfigcaption\hfil\else
       \hskip\captionindent\fi
            \figcapfont\fnum@figure\hfil}\vskip \tabcapspace
       \vskip 6pt
     {\if@centeredfigcaption\centering\fi \hskip \captionindent
            \parbox{\@tabwidth}{\figcapfont\unhbox1}}%
   \else
     \hbox to \@tabwidth{%
       \if@centeredfigcaption \hfil\else \hskip\captionindent\fi
       \figcapfont\fnum@figure\strut\hfil }\vskip \tabcapspace
      \hbox to \@tabwidth{%
       \if@centeredfigcaption \hfil\else \hskip\captionindent\fi
       \figcapfont\the\@floatcaption \hfil }%
   \fi
   \par
}}%

%%%%%%%%%%%%%%%%% default caption
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\@ifundefined{thetable}{\newcounter{table}}{}
\def\thetable{\arabic{table}}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable\figtabdot}
\newif\if@tabindent \@tabindentfalse
\def\tableindent#1{%
   \global\floatindent= #1\global\@tabindenttrue }
\def\tabfont{\footnotesize}
\def\@tabnotes{}
\newcounter{tabnote}
\def\tabnotemark{\ensuremath{^{\thetabnote}}}
\def\thetabnote{\arabic{tabnote}}
\def\tabnotesep{\par}
\def\tabnote#1{\stepcounter{tabnote}%
    \rlap{\tabnotemark }%
    \begingroup
    \let\tabnotesep\relax
    \xdef\@tabnotes{\@tabnotes\tabnotesep \tabnotemark #1\par}%
    \endgroup }
\long\def\tabnotes#1{\gdef\@tabnotes{{\tabfont\noindent #1\par}}}
\def\@setnotrotatedtabbox{%
  \setbox4=\hbox to \maxfloatwidth{\vbox{\hsize=\maxfloatwidth
     \@klu@caption
     \vskip\captionskip \leavevmode
     \unvbox\figtabbox\par
     \noindent\parbox{\@tabwidth}{\tabfont\@tabnotes}\par}}%
      \if@fixedfloat\calc@fixedspace4\fi
  \noindent\kern \floatindent\box4
 }
\def\@setrotatedtabbox{\begingroup \hfuzz=\vsize
     \setbox2\hbox to \textheight{\hfil
        \vbox to \hsize{\hsize=\vsize
         \vfil
         \hbox{\hbox@to@floatwidth{\vbox{\@klu@caption }}}
         \vskip\captionskip
         \hbox{\hbox@to@floatwidth{\box\figtabbox\hss}}%
         \hbox{\hbox@to@floatwidth{\parbox{\@tabwidth}{\tabfont\@tabnotes}\hfil }}%
         \vss
    }\hss}\rotl{2}\endgroup
}
\def\table{\let\@makecaption\@maketabcaption
    \global\@floatcaption={}%
    \gdef\@tabnotes{}\setcounter{tabnote}{0}\gdef\cap@type{2}%
    \@ifnextchar[{\t@blewithoptions}{\t@blewithoptions[tbp]}}
\def\t@blewithoptions[#1]{%
    \if H#1\@fixedtable \else \@float{table}[#1]\fi
    \@getmaxwidth \if@tabindent \@floatcorrect \fi
    \setbox\figtabbox\vbox\bgroup\tabfont
    \if@kaprotate\hfuzz=\vsize\fi }%
\def\endtable{\egroup \@getindent
  \gdef\cap@type{0}\noindent
  \hfuzz=\floatindent
    \if@kaprotate \@setrotatedtabbox
    \else \@setnotrotatedtabbox \fi
  \if@fixedfloat \vskip\intextsep \@fixedfloatfalse
  \else \end@float \fi
  \hfuzz =0.1pt }%
\@namedef{table*}{\let\@makecaption\@maketabcaption
    \global\@floatcaption={}%
    \gdef\@tabnotes{}\setcounter{tabnote}{0}\gdef\cap@type{2}%
    \@ifnextchar[{\dt@blewithoptions}{\dt@blewithoptions[tbp]}}
\def\dt@blewithoptions[#1]{%
    \if H#1\@fixedtable
    \else \@dblfloat{table}[#1]\fi
    \@getmaxwidth \if@tabindent \@floatcorrect \fi
    \setbox\figtabbox\vbox\bgroup\tabfont
    \if@kaprotate \hfuzz=\vsize \fi }%
\@namedef{endtable*}{\egroup  \@getindent
    \gdef\cap@type{0}\noindent
    \hfuzz=\floatindent
    \if@kaprotate \@setrotatedtabbox
    \else \@setnotrotatedtabbox \fi
    \if@fixedfloat  \vskip\intextsep \@fixedfloatfalse
    \else \end@dblfloat \fi
    \hfuzz=0.1pt }%
\newif\if@fixedfloat
\def\@fixedtable{\vskip\intextsep \@fixedfloattrue
    \def\caption{\@ifnextchar[{\f@xedcap{table}}%
      {\f@xedcap{table}[]}}}
\def\@fixedfigure{\vskip\intextsep \@fixedfloattrue
    \def\caption{\@ifnextchar[{\f@xedcap{figure}}%
      {\f@xedcap{figure}[]}}}
\def\f@xedcap#1[#2]#3{\refstepcounter{#1}\def\@tempa{#2}%
  \ifx\@tempa\empty
  \else \addcontentsline{\csname ext@#1\endcsname}{#1}{#2}\fi
    \message{#1\space\csname the#1\endcsname \space (fixed)}%
    \global\@floatcaption={#3}}
\def\calc@fixedspace#1{%
       \@tempdima=\pagegoal
       \@tempdimb=\dp#1
       \advance\@tempdimb \ht#1
       \advance\@tempdima -\pagetotal
       \advance\@tempdima -2\intextsep
         \wlog{pageleft= \the\@tempdima,
           size= \the\@tempdimb }%
       \ifdim\@tempdima>\@tempdimb \else \newpage \fi}
\@ifundefined{thefigure}{\newcounter{figure}}{}
\def\thefigure{\arabic{figure}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure\figtabdot}
\newif\if@figindent   \@figindentfalse
\def\figindent#1{%
  \global\floatindent #1
  \global\@figindenttrue }
\def\figcapfont{\footnotesize}
\long\def\@makefigcaption#1#2{%
  \message{\figurename\space\thefigure
      \if@kaprotate \space (rotated)\fi }%
  \global\@floatcaption={#2}}

\def\figure{%
   \gdef\cap@type{1}%
   \let\@makecaption\@makefigcaption
   \global\@floatcaption={}%
   \@ifnextchar[{\f@gurewithoptions}{\f@gurewithoptions[tbp]}}%
\def\f@gurewithoptions[#1]{%
  \let\saved@centerline\centerline
  \if H#1\@fixedfigure \else \@float{figure}[#1]\fi
    \@getmaxwidth \if@figindent \@floatcorrect
        \def\centerline##1{##1}\fi
  \setbox\figtabbox\vbox\bgroup }%
\def\endfigure{\egroup
       \@getindent \gdef\cap@type{0}%
       \hfuzz=\floatindent
       \if@kaprotate \@setrotatedfigbox \pagebreak
       \else \@setnotrotatedfigbox \fi
       \let\centerline\saved@centerline
       \if@fixedfloat \vskip\intextsep \@fixedfloatfalse
       \else \end@float \fi
       \hfuzz=0.1pt }%
\@namedef{figure*}{%
    \def\cap@type{1}%
    \let\@makecaption\@makefigcaption
    \global\@floatcaption={}%
    \@ifnextchar[{\df@gurewithoptions}{\df@gurewithoptions[ttp]}}
\def\df@gurewithoptions[#1]{%
  \let\saved@centerline\centerline
  \if H#1 \@fixedfigure \else \@dblfloat{figure}[#1]\fi
    \@getmaxwidth \if@figindent \@floatcorrect
        \def\centerline##1{##1}\fi
     \setbox\figtabbox\vbox\bgroup }%
\@namedef{endfigure*}{\egroup
        \@getindent \gdef\cap@type{0}%
        \hfuzz=\floatindent
        \if@kaprotate \@setrotatedfigbox
        \else \@setnotrotatedfigbox \fi
         \let\centerline\saved@centerline
        \if@fixedfloat \vskip\intextsep \@fixedfloatfalse
        \else \end@dblfloat \fi
        \hfuzz=0.1pt }%
\def\@setnotrotatedfigbox{%
  \setbox4=\hbox to \maxfloatwidth{\vbox{\hsize=\maxfloatwidth
     \unvbox\figtabbox
     \vskip\captionskip
     \@klu@figcaption }}%
      \if@fixedfloat\calc@fixedspace4 \fi
  \noindent\kern \floatindent\box4
}
\def\@setrotatedfigbox{%
     \setbox2\vbox to \hsize{\hsize=\textheight
         \leavevmode
         \vrule width \textheight height 0pt depth 0pt\par
         \vskip \@tabskip
         \hbox to \textheight{\hss\box\figtabbox\hss}%
         \vskip\captionskip
         \hbox to \textheight{\vbox{\@klu@figcaption }}
         \vss
    }\rotl{2}}%
\newcounter{algorithm}
\def\thealgorithm{\arabic{algorithm}}
\def\fps@algorithm{tbp}
\def\ftype@algorithm{4}
\def\ext@algorithm{lof}
\long\def\@makealgocaption#1#2{%
     \hbox to \hsize{\parbox[t]{\hsize}{{\vskip 1ex \tabcapfont
     #1\figtabdot~~#2}}}}
\def\fnum@algorithm{\algorithmname\space \thealgorithm}
\def\algorithm{\let\@makecaption\@makealgocaption
                \@float{algorithm}\footnotesize\obeyspaces\obeylines}
\let\endalgorithm\end@float
\def\subtable{\@ifnextchar[{\@subtable}{\@subtable[alph]}}
\def\@subtable[#1]{\refstepcounter{table}%
  \def\@testoption{arabic}\def\@testparam{#1}%
  \begingroup
  \edef\old@table{\the\c@table}%
  \edef\old@thetable{\thetable}%
  \setcounter{table}{0}%
  \ifx\@testoption\@testparam
     \def\thetable{\old@thetable.\csname #1\endcsname{table}}%
  \else
     \def\thetable{\old@thetable\csname #1\endcsname{table}}%
  \fi}
\def\endsubtable{\setcounter{table}{\old@table}%
  \endgroup \global\@ignoretrue}
\def\subfigure{\@ifnextchar[{\@subfigure}{\@subfigure[alph]}}
\def\@subfigure[#1]{\refstepcounter{figure}%
  \def\@testoption{arabic}\def\@testparam{#1}%
  \begingroup
  \edef\old@figure{\the\c@figure}%
  \edef\old@thefigure{\thefigure}%
  \setcounter{figure}{0}%
  \ifx\@testoption\@testparam
     \def\thefigure{\old@thefigure.\csname #1\endcsname{figure}}%
   \else
     \def\thefigure{\old@thefigure\csname #1\endcsname{figure}}%
   \fi}
\def\endsubfigure{\setcounter{figure}{\old@figure}%
  \endgroup \global\@ignoretrue}

\newif\if@kaprotate \@kaprotatefalse
\def\kaprotate{\global\@kaprotatetrue}
\def\endkaprotate{\global\@kaprotatefalse}

\newdimen\rotdimen
\def\rotstart#1{\special{ps: gsave currentpoint currentpoint translate
    #1 neg exch neg exch translate}}
\def\rotfinish{\special{ps: currentpoint grestore moveto}}
\def\rotl#1{\rotdimen=\ht#1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to\wd#1{\vskip \wd#1
    \rotstart{270 rotate}\box #1\vss}\hss}\rotfinish}
\def\rotr#1{\rotdimen=\ht #1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to \wd#1{\vskip \wd#1
    \rotstart{90 rotate}\box #1\vss}\hss}\rotfinish}
    
\indentedcaptions    

\newcommand{\redot}{.}
\newcommand{\releft}{}
\newcommand{\reright}{}

\newenvironment{thebibliography}[1]{%
  \sectioncmd*{\refname}\imarkboth{\bibname}{\bibname}%
  \footnotesize
  \message{\refname}
  \if@numreferences\else\gdef\citeauthoryear##1##2{}\fi
  \def\bibwidthlabel{\releft#1\reright}%
  \list{\kapbib@counter}{\kapbib@list}
  \let\makelabel\@biblabel
  \def\newblock{\hskip .11em plus .33em minus .07em}%
  \sloppy
  \clubpenalty10000
  \widowpenalty10000
  \sfcode`\.=1000\relax
  }{\endlist}
\AtBeginDocument{%
  \def\refname{References}%
  \def\bibname{References}}

\def\numreferences{%
  \typeout{Springer -- Numbered references}%
  \def\kapbib@counter{\arabic{enumiv}}%
  \def\labelsepwidth{1em}%
  \def\kapbib@list{%
    \setlength{\labelsep}{\labelsepwidth}%
    \settowidth{\labelwidth}{\@biblabel{\bibwidthlabel}}%
    \setlength{\leftmargin}{\labelwidth}%
    \addtolength{\leftmargin}{\labelsep}%
    \setlength{\itemindent}{0pt}%
    \setlength{\itemsep}{0pt}%
    \setlength{\parsep}{0pt}%
    \usecounter{enumiv}%
    \let\makelabel\kap@biblabel}%
  \def\@biblabel##1{\hfill\releft##1\redot\reright}%
  \def\citeauthoryear##1##2{}%
}
  
\def\namedreferences{%
  \typeout{Springer -- Named references}%
  \def\labelsepwidth{1em}%
  \def\kapbib@counter{\relax }%
  \def\kapbib@list{%
    \setlength{\labelsep}{0em}%
    \setlength{\labelwidth}{0pt}%
    \setlength{\itemindent}{-\bibhang}%
    \setlength{\itemsep}{0pt}%
    \setlength{\parsep}{0pt}%
    \usecounter{enumiv}%
    \setlength{\leftmargin}{\bibhang}%
    }%
}

\newlength{\bibhang}
\setlength{\bibhang}{14pt}

\if@numreferences
    \numreferences
\else
    \namedreferences
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%


%  sectioning
\def\nohyphen{\pretolerance=\@M \tolerance=\@M \hyphenpenalty=\@M \exhyphenpenalty=\@M}

\newcommand\section{\@startsection {section}{1}{\z@}%
                         {-\bigskipamount}%
                         {\medskipamount}%
                         {\fontsize{11}{12.5}\bfseries\mathversion{bold}\raggedright\nohyphen}}
\newcommand\subsection{\@startsection {subsection}{2}{\z@}%
                               {-\medskipamount}%
                               {\medskipamount}%
                               {\fontsize{10}{12.5}\bfseries\mathversion{bold}\raggedright\nohyphen}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                               {-\medskipamount}%
                               {\medskipamount}%
                               {\fontsize{10}{12.5}\itshape\raggedright}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                               {\medskipamount}%
                               {-10pt}%
                               {\bfseries\mathversion{bold}}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                               {0.1pt}%
                               {-1em}%
                               {\itshape}}

% Format for the counter:
\def\section@numbersep{.}
\def\subsection@numbersep{.}
\def\subsubsection@numbersep{.}
\def\paragraph@numbersep{.}
\def\subparagraph@numbersep{.}

% Format for the counter:
\def\@seccntformat#1{{\csname #1@prefix\endcsname\csname the#1\endcsname\csname#1@numbersep\endcsname\enspace}}


\newcounter{section}
\renewcommand{\thesection}{\arabic{section}}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph}{\theparagraph.\arabic{subparagraph}}
\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{10000}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{4}
\def\tableofcontents{\sectioncmd *{\contentsname}%
  \imarkboth{\contentsname}{\contentsname}%
  \message{\contentsname}%
  \@starttoc{toc}\newpage}
\def\listoffigures{\sectioncmd *{\listfigurename}\imarkboth
  {\listfigurename}{\listfigurename}%
  \message{\listfigurename}%
  \@starttoc{lof}}
\def\listoftables{\sectioncmd *{\listtablename}\imarkboth
  {\listtablename}{\listtablename}%
  \message{\listtablename}%
  \@starttoc{lot}}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\let\l@table\l@figure
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\def\appendixname{Appendix}%
\newcommand{\appendix}{\par
    \section*{Appendix}%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \renewcommand{\thesection}{\Alph{section}}%
    \message{\appendixname}%
    }


\AtBeginDocument{\let\sectioncmd\section}
\AtBeginDocument{\let\imarkboth\@gobbletwo}

\def\afterdateskip{.7\baselineskip}
\def\@date{\vskip \afterdateskip } % no default dates

\def\Uppercase#1{#1}

%%%%%%%
\pagenumbering{arabic}
\frenchspacing

% Title
%   skip20pt
%   fontsize 13/15; bfseries; marginright 10mm

\def\raggedrightmargin#1{%
  \let\\\@centercr\@rightskip #1 plus 1fil  \rightskip\@rightskip
  \leftskip\z@skip
  \parindent\z@\nohyphen}

\def\titleflushstyle{\raggedrightmargin{10mm}}
\def\openingflushstyle{\vglue-\topskip\hrule \@height 1\p@ \vskip40\p@}
\def\titlefont{\fontsize{13}{15}\selectfont\bfseries\mathversion{bold}}

% ORCID
\let\@orcid\relax
\def\orcid@base{http://orcid.org/}
\protected\def\orcid#1{\gdef\@orcid{#1}}
\IfFileExists{orcid.eps}
    {\def\orcid@pic{\includegraphics{orcid}}}
    {\def\orcid@pic{\raise2\p@\hb@xt@9bp{\hss{\small\textbullet\textbullet}\hss}}}
\def\output@orcid{\lower2\p@\hbox{\href{\orcid@base \@orcid}{\orcid@pic}}}

% Author
\let\saved@author@\author@
\def\author@{\@ifnextchar[{\@author@}{\@author@[]}}
\def\@author@[#1]#2{\saved@author@{[#1]{#2}}}

\RequirePackage{keyval}
\let\CheckedBox\relax
\RequirePackage{marvosym}
\let\@@Letter\Letter
\def\@@@Letter{\lower.32\p@\hbox{\fontsize{13}{13}\selectfont\@@Letter}\hskip-1.3\p@}

\def\authorsize{\normalsize\bfseries\raggedrightmargin{42mm}\let\sep=\authorsep}
\protected\def\authorsep{~{\mathversion{bold}\ensuremath{\cdot}}\ }
  
\newcounter{affref}
\def\theaffref{\arabic{affref}}
%% format footnote mark in author block
\def\addressref@fmt#1{\textsuperscript{\addressref@sep #1}}
%% format footnote label in addresses list 
\def\addresslbl@fmt#1{\textsuperscript{#1}}


\newif\if@authorcorref
\define@key{author}{corref}[true]{\@authorcorreftrue}%
\define@key{author}{email}{\def\@author@email{#1}}%
\define@key{author}{addressref}{\def\@author@addressref{#1}}

\def\email@prefix{e-mail:~}
\def\surname#1{#1}%
\def\inits#1{}%
\def\fnm#1{#1}%
\def\lnm#1{#1}%
\def\snm#1{#1}%
\let\sep\relax

\def\afterauthorskip{10pt}

\def\@formatauthors{\begingroup
  \authorsize
  \leavevmode
  \gdef\surname##1{##1}%
  \gdef\email##1{ \hbox{(\email@prefix{\lowercase{##1}})}}%
  \cnt@authors=0
  \def\@k@p##1{\advance\cnt@authors by 1}\@curauths
  \def\@k@p##1{\advance\cnt@authors by -1
    \ifnum\cnt@authors>1
      \@fmt@author ##1\sep
    \fi
    \ifnum\cnt@authors=1                               % before \fi's !!
      \@fmt@author ##1\sep
    \fi
    \ifnum\cnt@authors<1
      \@fmt@author ##1\par
    \fi
    }\@curauths
   \vskip \afterauthorskip
  \@date
  \@copyright
  \printaddresses
  \endgroup}

\newtoks\corref@authors@list
\newtoks\email@authors@list
\def\fmt@author@and@email#1#2{#1\\{\href{mailto:#2}{\lowercase{#2}}}}
\def\add@xtok#1#2{\begingroup\xdef\@act{\global\noexpand#1{\the#1#2}}\@act\endgroup}
\def\fmt@addressref@list{%
  \ifx\addrespresented\relax
  \else
    \@for\@id:=\@author@addressref\do{%
      \@ifundefined{affref@\@id}%
        {%
          \stepcounter{affref}%
          \expandafter\xdef\csname affref@\@id\endcsname{\theaffref}%
        }%
        {}%
      \addressref@fmt{\csname affref@\@id\endcsname}%
      \def\addressref@sep{,}%
      }%
  \fi
  }

\let\do@item\@gobbletwo
\newcommand\@fmt@author[2][]{%
  \bgroup
    \let\inits\relax
    \let\fnm\relax
    \let\@orcid\relax
    \let\@author@email\@empty
    \let\@author@addressref\@empty
    \let\addressref@sep\@empty
    \setkeys{author}{#1}%
    \ifx\@author@email\@empty
    \else
      \if@authorcorref
        \add@xtok\corref@authors@list{\noexpand\do@item{\noexpand\@@@Letter}{\noexpand\fmt@author@and@email{\unexpanded{#2}}{\unexpanded\expandafter{\@author@email}}}}%
      \else
        \add@xtok\email@authors@list{\noexpand\do@item{}{\noexpand\fmt@author@and@email{\unexpanded{#2}}{\unexpanded\expandafter{\@author@email}}}}%
      \fi
    \fi
    \def\inits##1{\ignorespaces}%
    \def\fnm##1{##1\ignorespaces}%
    \noindent #2\fmt@addressref@list
    \ifx\@orcid\relax
    \else
      \output@orcid
    \fi
  \egroup
  }

\def\fmt@address#1{#1}
\def\make@address@mark#1{%
  \@ifundefined{#1}{??}{\csname #1\endcsname}%
  }
\define@key{address}{id}{\def\@address@id{#1}}%
\let\addrespresented\relax
\newtoks\adresses@list
\newcommand\address[2][]{%
  \bgroup
    \global\let\addrespresented\@empty
    \let\@address@id\@empty
    \setkeys{address}{#1}%
    \ifx\@address@id\@empty
      \def\item@mark{}%
    \else
      \def\item@mark{\noexpand\make@address@mark{affref@\@address@id}}%
    \fi
    \add@xtok\adresses@list{\noexpand\do@item{\item@mark}{\noexpand\fmt@address{\unexpanded{#2}}}}%
  \egroup
  \ignorespaces
  }
  
%%%% castead
\def\casteadlistsetup#1{#1}
\def\castaddresseslistsetup#1{#1}

\def\@affil@makefntext#1{%
% \showthe\labelwidth
  \leftskip=\labelwidth
  \footnote@skip #1}

\def\@casteadlistsetup{%
  \labelwidth=15pt
  \def\footnote@skip{\addvspace{8pt}\gdef\footnote@skip{}}
  \let\@footnotetext\orig@@footnotetext
  \let\@makefntext\@affil@makefntext
  }

\def\@casteadlisthook{%
  \def\makelabel##1{\hbox to \z@{\hss\hbox to \labelwidth{##1\hfil}}}%
  }
  
\def\castead{%
  \bgroup
    \let\orcid\@gobble
    \let\make@trivlist\@firstofone
    %% do nothing if lists are empty
    \expandafter\def\expandafter\@temp\expandafter{\the\corref@authors@list}%
    \ifx\@temp\@empty
      \expandafter\def\expandafter\@temp\expandafter{\the\email@authors@list}%
      \ifx\@temp\@empty
        \let\make@trivlist\@gobble
      \fi
    \fi
    \def\fnm##1{\ignorespaces}%
    \def\inits##1{##1\ignorespaces}%
    \make@trivlist{%
      \csname castead@skip\endcsname
      \let\do@item\affil@footnote
      \@casteadlisthook
      \@casteadlistsetup
      \the\corref@authors@list
      \the\email@authors@list
      \global\email@authors@list={}%
      \global\corref@authors@list={}%
      }%
  \egroup
  }

%%%% castaddresses
\def\castaddresses@skip{\addvspace{8\p@}}
\def\@castaddresseslistsetup{%
  \let\@footnotetext\orig@@footnotetext
  \let\@makefntext\@affil@makefntext
  \setlength\footnotesep   {15\p@}% 
  \def\footnote@skip{\castaddresses@skip\gdef\footnote@skip{}}
  }

\def\@castaddresseslisthook{%
  \def\makelabel##1{\hbox to \z@{\hss\hbox to \labelwidth{\addresslbl@fmt{##1}\hfil}}}%
  }

\def\footnote@skip{}
\def\affil@footnote#1#2{%
  \vskip 0pt 
  \def\@tmp@arg{#1}%
  \ifx\@tmp@arg\empty
    \footnotetext{#2}%
  \else
    \footnotetext{\makelabel{#1}#2}%
  \fi
}  
  
\def\castaddresses{%
  \bgroup
    \let\make@list\@firstofone
    %% do nothing if lists are empty
    \expandafter\def\expandafter\@temp\expandafter{\the\adresses@list}%
    \ifx\@temp\@empty
      \let\make@list\@gobble
    \fi
    \make@list{%
        \let\do@item\affil@footnote
        \def\footnote@skip{\vskip10\z@ \gdef\footnote@skip{}}
        \@castaddresseslisthook
        \@castaddresseslistsetup
        \the\adresses@list
      }
  \egroup
  }

\def\footnoterule@width@secondpage{18mm}
\def\footnoterule@height@secondpage{0.2mm}

%%%% printaddresses
\global\let\orig@footnoterule\footnoterule
\def\fminsert@size{\footnotesize\normalfont\raggedrightmargin{5mm}}
\def\footnoterule@width{108\p@}

\long\def\printaddresses{%
  \bgroup
    \fminsert@size
    \setlength\smallskipamount{5\p@}%
    \setlength\medskipamount{10\p@}%
    \castead
    \castaddresses
  \egroup
  }
  

% Institute
\def\institutesize{\footnotesize\normalfont}
\def\@formatinstitute{\insert\footins{\institutesize
    \institutecase{\@curinst}\par}}
%


% Figure
\def\fnum@figure{{\bfseries\figurename~\thefigure.\/}}

% Table 
\renewcommand\thetable{\@arabic\c@table}
\def\fnum@table{{\bfseries\tablename~\thetable.\/}}

% Acknowledgements
\def\@acknowledgement{\paragraph*{\acknowledgementsname}%
  \message{\acknowledgementsname}}
\def\acknowledgment{\def\acknowledgementsname{Acknowledgment}\@acknowledgement}
\def\acknowledgement{\def\acknowledgementsname{Acknowledgement}\@acknowledgement}
\def\acknowledgments{\def\acknowledgementsname{Acknowledgments}\@acknowledgement}
\def\acknowledgements{\def\acknowledgementsname{Acknowledgements}\@acknowledgement}
\newenvironment{ack}[1][Acknowledgement]{\footnotesize\paragraph*{#1}}{}
\newenvironment{acks}[1][Acknowledgements]{\footnotesize\paragraph*{#1}}{}


\def\@jname{Solar Physics}
\def\@doi{\@doihead \@thedoi}
\def\@doihead{DOI:\space}
\def\@thedoi{10.1007/\textbullet\textbullet\textbullet\textbullet\textbullet
  -\textbullet\textbullet\textbullet
  -\textbullet\textbullet\textbullet
  -\textbullet\textbullet\textbullet\textbullet
  -\textbullet}
%
\def\ps@opening{%
  \def\@oddhead{\parbox[t]{\textwidth}{\footnotesize\@jname\\\@doi}}%
  \let\@evenhead\@oddhead
  \def\@oddfoot{\idline\hfill}%
  \def\@evenfoot{\hfill\@gobble\idline}}
%

\def\ps@headings{%
  \def\@oddfoot{\idline\hfil }%
  \let\@evenfoot\@oddfoot
  \def\@evenhead{\rh@rule\hbox{}\@gobble{\rlap{\footnotesize\thepage}}\hfil
    \@markfont\mymyleftmark}%
  \def\@oddhead{\rh@rule\@markfont\mymyrightmark\hfill\@gobble{\llap{\footnotesize\thepage}}}%
}
\def\rh@rule{\leavevmode\lower6pt\hbox to0pt{\vrule height1pt width\textwidth\hss}}
\pagestyle{headings}

\def\@coprtyear{\textbullet\textbullet\textbullet\textbullet} 
\def\@volume{0}
\def\@@firstpage{\textbullet}
\def\@@lastpage{\textbullet}
\if@optionalrh
  \def\mymyleftmark{\@runningauthor}%
  \def\mymyrightmark{\@runningtitle}%
\else
  \def\mymyleftmark{\@jname\@gobble{\ (\@coprtyear)
      \@volume:\@firstpage--\@lastpage}}
  \let\mymyrightmark\mymyleftmark
\fi

%%%%% spec environment
\let\org@begin\begin
\let\org@end\end
\def\begin#1{%
  \@ifundefined{pseudo@#1}%
    {\org@begin{#1}}{\csname pseudo@#1\endcsname[0]\relax}%
  }
\def\end#1{%
  \@ifundefined{pseudo@#1}%
    {\org@end{#1}}{\csname pseudo@#1\endcsname[1]\relax}%
  }
\newcount\pseudo@@env@@cnt
\def\newpseudoenvironment#1#2#3{%
  \expandafter\gdef\csname pseudo@#1\endcsname[##1]{\relax
     \ifcase##1\relax
       \global\advance\pseudo@@env@@cnt\@ne
       \def\@@next@@{#2}%
     \or
       \global\advance\pseudo@@env@@cnt\m@ne
       \def\@@next@@{#3}%
     \else
       \let\@@next@@\relax
     \fi
     \@@next@@
     }%
  }
\AtEndDocument{%
  \ifnum\pseudo@@env@@cnt=\z@
  \else
    \dbl@error{Unbalanced pseudo environments}%
  \fi
  }

\let\start@tex@env\relax
\let\end@tex@env\relax
\long\def\add@env@toks#1#2#3\end#4{%
  \def\check@param@a{#1}\def\check@param@b{#4}%
  \ifx\check@param@a\check@param@b
    \def\@next@{\let\end@tex@env\relax
      \global#2\expandafter{\the#2#3\end@tex@env}%
      \csname end@add@env@#1@hook\endcsname
      }%
  \else
    \def\@next@{\global#2\expandafter{\the#2#3\end{#4}}\add@env@toks{#1}{#2}}%
  \fi
  \@next@
  }
\def\read@opt@args#1#2[#3]{\let\start@tex@env\relax\global#2\expandafter{\the#2\start@tex@env{#1}[#3]}\add@env@toks{#1}{#2}}
\def\get@opt@args#1#2{\@ifnextchar[{\read@opt@args{#1}{#2}}{\let\start@tex@env\relax\global#2\expandafter{\the#2\start@tex@env{#1}[]}\add@env@toks{#1}{#2}}}
\def\get@env@toks#1#2{%
  \expandafter\def\csname pseudo@#1\endcsname[##1]\relax{%
    \ifcase##1\relax
      \def\@next@{\get@opt@args{#1}{#2}}%
    \else
      \def\@next@{}%
    \fi
    \@next@
    }%
  }

% Abstract
\let\abstractnamefont\bfseries
\def\abstractsize{\normalsize\normalfont}
\def\abstractdot{~}

\newtoks\document@abstract 
\get@env@toks{abstract}{\document@abstract}

\gdef\@abstract{%
  \unskip
  \vskip\preabstractskip
  \noindent
  \abstractsize \noindent
  {\abstractnamefont\abstractname\abstractdot}%
  \bgroup
    \long\def\start@tex@env##1[##2]##3\end@tex@env{##3}%
    \the\document@abstract
  \egroup
  \vskip\afterabstractskip 
  }

% Springer Copyright
\def\sprcopyright{\gdef\@copyright{\copyright@size\copyright@text\vskip2\baselineskip}}
\def\copyright@text{\textcopyright\ The author(s) \textbullet\textbullet\textbullet\textbullet}
\let\copyright@size\footnotesize
\sprcopyright

\def\@maketitle{%
   \@arttype \@title \@subtitle \@authorsandinstitutes 
   \@abstract 
   \@keywords \@abbreviations \@classification
   \@nomenclature \@translation \@dedication \@motto}

\AtBeginDocument{\@ifundefined{urlstyle}{}{\urlstyle{rm}}}

\DeclareMathAlphabet      {\mathbfit}{OML}{cmm}{b}{it}

\def\TODAY@JWL{\number\day\space\ifcase\month\or January\or February\or March\or
 April\or
   May\or June\or July\or August\or September\or October\or November\or
   December\fi \space\number\year}
\def\idline{\if@noid\else
    \rlap{\smash{\vtop to \id@boxheight{%
     \vfil\hbox to\textwidth{%
     \hfil\footnotesize\tt
     SOLA\csname SOLAID\endcsname: \jobname.tex; \TODAY@JWL;~\timenow;~p.~\thepage}}}}%
   \fi}

\let\orig@@footnotetext\@footnotetext
%% default options for hyperref
\if@loadhyperref
  \usepackage[pdfborder={0 0 0 },colorlinks,linkcolor=black,citecolor=black,urlcolor=blue,breaklinks]{hyperref}
\else
  \let\href\@secondoftwo
  \let\url\@firstofone
\fi

\if@loadnatbib
  \let\bibhang\relax
  \let\citeauthoryear\relax
  \RequirePackage{natbib}
  \@ifundefined{newblock}{\def\newblock{\hskip .11em plus .33em minus .07em}}{}
  \@ifundefined{@listctr}{\newcounter{start}\setcounter{start}{0}\def\@listctr{start}}{}
  \let\bibfont\footnotesize
  \gdef\NAT@bibsetup#1{\kapbib@list}
%\else
%   \newlength{\bibhang}
\fi

\def\citefix{%
  \def\NAT@citex%
  [##1][##2]##3{%
  \NAT@sort@cites{##3}%
  \let\@citea\@empty
  \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
    \@for\@citeb:=\NAT@cite@list\do
    {\edef\@citeb{\expandafter\@firstofone\@citeb}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb\@extra@b@citeb}{\@citea%
       {\reset@font\bfseries ?}\NAT@citeundefined
                 \PackageWarning{natbib}%
       {Citation `\@citeb' on page \thepage \space undefined}\def\NAT@date{}}%
     {\let\NAT@last@nm=\NAT@nm\let\NAT@last@yr=\NAT@year
     \NAT@parse{\@citeb}%
      \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
        \let\NAT@name=\NAT@all@names
        \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
      \fi
     \ifNAT@full\let\NAT@nm\NAT@all@names\else
       \let\NAT@nm\NAT@name\fi
     \ifNAT@swa\ifcase\NAT@ctype
       \if\relax\NAT@date\relax
         \@citea\NAT@nmfmt{\NAT@nm}%
         \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@date\hyper@natlinkend
       \else
         \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
            \ifx\NAT@last@yr\NAT@year
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@exlab
              \hyper@natlinkend
            \else\unskip\
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@date
              \hyper@natlinkend
            \fi
         \else
           \@citea\NAT@nmfmt{\NAT@nm}%
           \NAT@aysep\ 
           \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
           \NAT@date\hyper@natlinkend
         \fi
       \fi
     \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@nmfmt{\NAT@nm}\hyper@natlinkend
     \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@date\hyper@natlinkend
     \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@alias\hyper@natlinkend
     \fi \def\@citea{\NAT@sep\ }%
     \else\ifcase\NAT@ctype
        \if\relax\NAT@date\relax
          \@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
          \NAT@nmfmt{\NAT@nm}\hyper@natlinkend
        \else
        \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
            \ifx\NAT@last@yr\NAT@year
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@exlab
              \hyper@natlinkend
            \else\unskip\
              \hyper@natlinkstart{\@citeb\@extra@b@citeb}\NAT@date
              \hyper@natlinkend
            \fi
         \else
           \@citea\NAT@nmfmt{\NAT@nm}%
           \ \NAT@@open\if*##1*\else##1\ \fi
           \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
           \NAT@date\hyper@natlinkend\fi
        \fi
       \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@nmfmt{\NAT@nm}\hyper@natlinkend
       \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@date\hyper@natlinkend
       \or\@citea\hyper@natlinkstart{\@citeb\@extra@b@citeb}%
         \NAT@alias\hyper@natlinkend
       \fi \if\relax\NAT@date\relax\def\@citea{\NAT@sep\ }%
           \else\def\@citea{\NAT@@close\NAT@sep\ }\fi
     \fi
     }}\ifNAT@swa\else\if*##2*\else\NAT@cmt##2\fi
     \if\relax\NAT@date\relax\else\NAT@@close\fi\fi}{##1}{##2}}
     \let\@citex\NAT@citex
}


\if@linksfromyear
  \if@loadnatbib 
   \citefix
  \else
      \def\cite@@label{unknown}%
      \let\save@document\document
      \def\document{
            \@ifpackageloaded{hyperref}{%
        \gdef\cite@year@hook##1{\hyper@@link[cite]{}{cite.\cite@@label\@extra@b@citeb}{##1}}%
        \gdef\cite@author@hook##1{\hyper@@link[cite]{}{cite.\cite@@label\@extra@b@citeb}{##1}}%
        \gdef\bibcite##1##2{%
          \@newl@bel{b}{##1\@extra@binfo}{%
                 \def\cite@@label{##1}%
                 ##2%
             }%
        }%
    }%
    {}%
       \save@document
      }
  
  \fi
\fi

\if@showbiblabel
  \if@loadnatbib 
    \let\saved@NAT@parse\NAT@parse
    \def\NAT@parse#1{%
      \gdef\current@biblabel{#1}%
      \saved@NAT@parse{#1}%
      }
  \else
    \let\saved@lbibitem\@lbibitem
    \def\@lbibitem[#1]#2{%
      \gdef\current@biblabel{#2}%
      \saved@lbibitem[#1]{#2}%
      }
    \let\saved@bibitem\@bibitem
    \def\@bibitem#1{%
      \gdef\current@biblabel{#1}%
      \saved@lbibitem{#1}%
      }
  \fi    
\fi
  
\def\endbibitem{%
  \@ifundefined{current@biblabel}{}{\texttt{[\expandafter\detokenize\expandafter{\current@biblabel}]}}}

\if@loadhyperref
\else
  \def\label#1{\ilabel{\thearticle #1}}%
  \def\ref#1{\iref{\thearticle #1}}%
  \def\pageref#1{\ipageref{\thearticle #1}}%
\fi

\newenvironment{article}{}{}

   
\newcounter{heading}
\def\theheading{\@arabic\c@heading}
\def\headingmark#1{}
\def\toclevel@heading{1}
\def\fmt@bookmark@heading#1{#1}
\def\smart@par{\ifhmode\par\fi}   
\def\heading@size{\bfseries}
\def\heading@afterskip{-0.5em}
\newcommand\heading{\@startsection{heading}{1}{\z@}%
                                   {\medskipamount}%
                                   {\heading@afterskip}%
                                   {\heading@size}}


\newcounter{subheading}
\@addtoreset{subheading}{heading}
\def\thesubheading{\theheading.\@arabic\c@subheading}
\def\subheadingmark#1{}
\def\toclevel@subheading{1}
\def\fmt@bookmark@subheading#1{#1}
\def\subsection@font{\fontsize{10}{12.5}\bfseries\mathversion{bold}\raggedright\nohyphen}   
\newcommand\subheading{\@startsection{subheading}{2}{\z@}%
                                   {\medskipamount}%
                                   {\heading@afterskip}%
                                   {\heading@size}}

 
\let\conflict@heading\heading
\newenvironment{@conflict}[1][\conflictname]{\smart@par\footnotesize\conflict@heading*{#1}}{\par}

\def\ethicsname{Declarations}%
\newenvironment{ethics}[1][\ethicsname]{%
    % 1st level in bookmarks and toc though subsection in style
    \renewcommand\heading{\@startsection {heading}{1}{\z@}%
                              {-\medskipamount}%
                              {\medskipamount}%
                              {\subsection@font\raggedright\nohyphen}}%
    \let\conflict@heading\subheading
    \let\conflict\@conflict
    \let\endconflict\end@conflict
    \smart@par\footnotesize\heading*{#1}%
    }%
    {\par}

\def\conflictname{Conflict of interest}
\newenvironment{conflict}[1][\conflictname]{\begin{@conflict}[#1]}{\end{@conflict}}

\def\authorcontributionname{Author Contribution}
\newenvironment{authorcontribution}[1][\authorcontributionname]{\begin{@conflict}[#1]}{\end{@conflict}}

\def\fundinginformationname{Funding}
\newenvironment{fundinginformation}[1][\fundinginformationname]{\begin{@conflict}[#1]}{\end{@conflict}}

\def\dataavailabilityname{Data Availability}
\newenvironment{dataavailability}[1][\dataavailabilityname]{\begin{@conflict}[#1]}{\end{@conflict}}

\def\materialsavailabilityname{Materials Availability}
\newenvironment{materialsavailability}[1][\materialsavailabilityname]{\begin{@conflict}[#1]}{\end{@conflict}}

\def\codeavailabilityname{Code Availability}
\newenvironment{codeavailability}[1][\codeavailabilityname]{\begin{@conflict}[#1]}{\end{@conflict}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ARTICLE COMMENTS

\def\commentsname{Comments}
\newenvironment{comments}[1][\commentsname]{\section*{#1}\footnotesize}{\par}


\endinput
%%
%% End of file `solarphysics.cls'.
