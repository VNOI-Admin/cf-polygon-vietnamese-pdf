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
 
<#list statements as statement>
<#if statement.path??>
\graphicspath{{${statement.path}}}
<#if statement.index??>
  \def\ProblemIndex{${statement.index}}
</#if>
\import{${statement.path}}{./${statement.file}}
<#else>
\input ${statement.file}
</#if>
</#list>
 
\end {document}
