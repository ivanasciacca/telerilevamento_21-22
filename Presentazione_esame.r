\documentclass{beamer}
\usepackage{color}
\usetheme{Frankfurt}
\usecolortheme{crane}
\usepackage{listings}
\usepackage{moresize}

\title{La deforestazione in Bolivia}
\author{Ivana Sciacca}
\institute{Alma Mater Studiorum - Università di Bologna}

\begin{document}

\maketitle
\AtBeginSection[] % Do nothing for \section*
{	
\begin{frame}
\frametitle{Dove siamo}
\tableofcontents[currentsection,currentsubsection,currentsubsubsection]
\end{frame}
}


\section{Introduzione} 

\begin{frame}{Introduzione}
    \frametitle{Santa Cruz}
    \begin{itemize}
        \item  Il dipartimento di Santa Cruz è tra le zone più colpite dalla deforestazione in tutta la Bolivia
    \end{itemize}
    \bigskip
    \centering
    \includegraphics[width=0.6\textwidth]{deforestazione.jpg} 
\end{frame}


\section{Strumenti}

\begin{frame}{Strumenti}
\frametitle{Landsat 7 e landsat 8}
\begin{itemize}
    \item Per questo studio sono state analizzate le immagini satellitari di Landsat 7 (1999) e 8 (2013)
\end{itemize}
\bigskip
\centering
\includegraphics[width=0.3\textwidth]{landsat7.jpg}
\includegraphics[width=0.5\textwidth]{Landsat 8.jpg}
\end{frame}


\section{Metodi}

\begin{frame}{Metodi}
 \frametitle{Library}
 \begin{itemize}
     \item Richiamare tutte le library utilizzare per il progetto e settare la cartella di lavoro
 \end{itemize}
 \bigskip
 \ssmall{\lstinputlisting[language = R]{library.r}}
\end{frame}
    

\begin{frame}{Metodi}
\frametitle{Bande del 2002} 
 \begin{itemize}
        \item  Sono state caricate le prime 4 bande, per poi creare un file unico  
    \end{itemize}
    \bigskip
  \ssmall{\lstinputlisting[language = R]{bande02.r}}
\end{frame}

\begin{frame}{Metodi}
\frametitle{Bande del 2022}
\begin{itemize}
    \item Sono state caricate le prime 5 bande, per poi creare un file unico
\end{itemize}
\bigskip
\ssmall{\lstinputlisting[language = R]{bande22.r}}
\end{frame}

\begin{frame}{Metodi}
\frametitle{Multiframe 2002-2022}
\bigskip
\centering
\includegraphics[width=0.6\textwidth]{ln02_22.jpeg}
\end{frame}


\section{Indici spettrali di vegetazione}

\begin{frame}{Indici spettrali di vegetazione}
\frametitle{DVI del 2002}
\centering
\includegraphics[width=0.5\textwidth]{dviln2002.jpeg}
\bigskip
\ssmall{\lstinputlisting[language = R]{dvi02.r}}
\end{frame}

\begin{frame}{Indici spettrali di vegetazione}
\frametitle{DVI del 2022}
\centering
\includegraphics[width=0.5\textwidth]{dviln2022.jpeg} 
\bigskip
\ssmall{\lstinputlisting[language = R]{dvi22.r}}
\end{frame}

\begin{frame}{Indici spettrali di vegetazione}
\frametitle{Differenza di DVI}
\centering
\includegraphics[width=0.5\textwidth]{dvi_dif.jpeg} 
\bigskip
\ssmall{\lstinputlisting[language = R]{dif_dvi.r}}
\end{frame}

\begin{frame}{Indici spettrali di vegetazione}
\frametitle{NDVI }
\centering
\includegraphics[width=0.5\textwidth]{ndvi.jpeg}  
\ssmall{\lstinputlisting[language = R]{ndvi.r}}
\end{frame}


\section{ Land cover}

\begin{frame}{Land cover}
\frametitle{Land cover 2002}
\centering
\includegraphics[width=0.5\textwidth]{Perc_2002.jpeg}
\ssmall{\lstinputlisting[language = R]{lc02.r}}
\end{frame}

\begin{frame}{Land cover}
\frametitle{Land cover 2002}
\ssmall{\lstinputlisting[language = R]{perc02.r}}
\end{frame}

\begin{frame}{Land cover}
\frametitle{Land cover 2022}
\centering
\includegraphics[width=0.5\textwidth]{Perc_2022.jpeg}
\ssmall{\lstinputlisting[language = R]{lc22.r}}
\end{frame}

\begin{frame}{Land cover}
\frametitle{Land cover 2022}
\ssmall{\lstinputlisting[language = R]{perc22.r}}
\end{frame}

\begin{frame}{Land cover}
\frametitle{Data frame}
\centering
\includegraphics[width=0.5\textwidth]{multitemporal.png}
\bigskip
\ssmall{\lstinputlisting[language = R]{dataframe.r}}
\end{frame}


\section{Analisi multivariata}

\begin{frame}{Analisi multivariata}
\frametitle{Analisi multivariata 2002}
\ssmall{\lstinputlisting[language = R]{pca.r}}
\end{frame}

\begin{frame}{Analisi multivariata}
\frametitle{Analisi multivariata 2002}
\centering
\includegraphics[width=0.4\textwidth]{graficoPC.png}
\end{frame}

\begin{frame}{Analisi multivariata}
\frametitle{Analisi multivariata 2002}
\ssmall{\lstinputlisting[language = R]{sd5.r}}
\end{frame}

\begin{frame}{Analisi multivariata}
\frametitle{Analisi multivariata 2002}
\centering
\includegraphics[width=0.5\textwidth]{pc02.jpeg}
\end{frame}

\begin{frame}{Analisi multivariata}
\frametitle{Analisi multivariata 2022}
\centering
\includegraphics[width=0.9\textwidth]{errore22.png}  
\end{frame}
\section{Conclusione}

\begin{frame}{Conclusione}
\frametitle{Grazie per l'attenzione!}
\bigskip
\centering
\includegraphics[width=0.8\textwidth]{Bolivia.jpg}   
\end{frame}

\end{document}
