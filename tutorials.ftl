\documentclass [11pt, a4paper, oneside] {article}

<#function getLanguageForOlym>
  <#if !contest.language??>
    <#return "" />
  </#if>
  <#if contest.language = "russian">
    <#return "[russian]" />
  </#if>
  <#if contest.language = "ukrainian">
    <#return "[ukrainian]" />
  </#if>
  <#if contest.language = "vietnamese">
    <#return "[vietnamese]" />
  </#if>
  <#return "" />
</#function>


\usepackage [T2A] {fontenc}
\usepackage [utf8] {inputenc}
\usepackage [english, russian, vietnamese] {babel}
\usepackage {amsmath}
\usepackage {amssymb}
\usepackage ${getLanguageForOlym()}{olymp}
\usepackage {comment}
\usepackage {epigraph}
\usepackage {expdlist}
\usepackage {graphicx}
\usepackage {multirow}
\usepackage {siunitx}
\usepackage {ulem}
%\usepackage {hyperref}
\usepackage {import}
\usepackage {ifpdf}
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

\usepackage{xcolor}

\begin {document}

\contest
{${contest.name!}}%
{${contest.location!}}%
{${contest.date!}}%

\binoppenalty=10000
\relpenalty=10000

\renewcommand{\t}{\texttt}

<#if shortProblemTitle?? && shortProblemTitle>
  \def\ShortProblemTitle{}
</#if>

<#list tutorials as tutorial>
<#if tutorial.path??>
<#if tutorial.index??>
    \def\ProblemIndex{${tutorial.index}}
</#if>
\graphicspath{{${tutorial.path}}}
\import{${tutorial.path}}{./${tutorial.file}}
<#else>
\input ${tutorial.file}
</#if>
</#list>

\end {document}
