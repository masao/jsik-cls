%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% This is file 'jsik.cls'
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jsik}[2026/07/30 ver 2.0 JSIK article class]

% -------------------------------------------------------------------
% Engine detection
% -------------------------------------------------------------------
\newif\ifjsik@uplatex
\ifx\uptexversion\undefined
  \jsik@uplatexfalse
\else
  \jsik@uplatextrue
\fi

% -------------------------------------------------------------------
% Class options
% -------------------------------------------------------------------
% The base font size is fixed at 11pt.
\DeclareOption{10pt}{%
  \ClassWarning{jsik}{10pt is not supported; using 11pt}%
}
\DeclareOption{12pt}{%
  \ClassWarning{jsik}{12pt is not supported; using 11pt}%
}

% Graphics driver
\newif\ifjsik@dvipdfmx
\jsik@dvipdfmxtrue
\DeclareOption{dvipdfmx}{%
  \jsik@dvipdfmxtrue
}
\DeclareOption{dvips}{%
  \jsik@dvipdfmxfalse
}

% Column balancing
\newif\ifjsik@balance
\jsik@balancetrue
\DeclareOption{balance}{\jsik@balancetrue}
\DeclareOption{nobalance}{\jsik@balancefalse}

% Pass all other options to the appropriate base class.
\DeclareOption*{%
  \ifjsik@uplatex
    \PassOptionsToClass{\CurrentOption}{ujarticle}%
  \else
    \PassOptionsToClass{\CurrentOption}{jarticle}%
  \fi
}
\ProcessOptions\relax

% -------------------------------------------------------------------
% Base class
% -------------------------------------------------------------------

\ifjsik@uplatex
  \ClassInfo{jsik}{upLaTeX detected; loading ujarticle}%
  \LoadClass[11pt]{ujarticle}
\else
  \ClassInfo{jsik}{pLaTeX detected; loading jarticle}%
  \LoadClass[11pt]{jarticle}
\fi

% -------------------------------------------------------------------
% Packages
% -------------------------------------------------------------------

\ifjsik@dvipdfmx
  \RequirePackage[dvipdfmx]{graphicx}
\else
  \RequirePackage[dvips]{graphicx}
\fi

\RequirePackage{url}

\ifjsik@balance
  \RequirePackage{balance}
  \AtBeginDocument{\balance}
\fi

% -------------------------------------------------------------------
% Page layout
% -------------------------------------------------------------------
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\topskip}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\topmargin}{-1truein}
\addtolength{\topmargin}{35truemm}
\setlength{\footskip}{0pt}
\setlength{\footskip}{-1truein}
\addtolength{\footskip}{25truemm}
\setlength{\textheight}{237truemm}
\setlength{\oddsidemargin}{-1truein}
\setlength{\evensidemargin}{-1truein}
\addtolength{\oddsidemargin}{25truemm}
\addtolength{\evensidemargin}{25truemm}
\setlength{\textwidth}{160truemm}
\setlength{\columnsep}{2em}

% -------------------------------------------------------------------
% maketitle
% -------------------------------------------------------------------
\def\articletype#1{\gdef\@articletype{#1}}
\def\jtitle#1{\gdef\@jtitle{#1}}
\def\etitle#1{\gdef\@etitle{#1}}
\def\jauthor#1{\gdef\@jauthor{#1}}
\def\eauthor#1{\gdef\@eauthor{#1}}
\def\affiliation#1{\gdef\@affiliation{#1}}
\long\def\jabstract#1{\gdef\@jabstract{#1}}
\long\def\eabstract#1{\gdef\@eabstract{#1}}
\def\jkeywords#1{\gdef\@jkeywords{#1}}
\def\ekeywords#1{\gdef\@ekeywords{#1}}
\def\maketitle{
  \twocolumn[
    \begin{flushleft}
      \vspace{-0.75cm}
      {\bf \@articletype}
    \end{flushleft}%
    \begin{center}
%      \vspace{0.25cm}
      {\Large \bf \@jtitle } \\
%      \vspace{0.25cm}
      {\Large \bf \@etitle } \\
      \smallskip
      {\large \@jauthor } \\
      {\large \@eauthor } \\
    \end{center}
      {\small \@affiliation }%
\bigskip
\par
{\hspace*{12pt}\@jabstract}
\par
\medskip
{\hspace*{12pt}\@eabstract}
\par
\vspace{0.25cm}
{\small
\noindent
 キーワード: \@jkeywords\par
\noindent
 Keywords: \@ekeywords
}%
\bigskip
\bigskip
    \setcounter{section}{0}%
    \setcounter{figure}{0}%
  ]
}

% \cite
%  usage: \cite{bibkey}
\def\@cite#1#2{$^{\mbox{\scriptsize{[#1\if@tempswa , #2\fi}]}}$}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% End of file `jsik.cls'.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%