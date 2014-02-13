" jvarsoke - std syntax coloring file

" functions comply to java standards
let java_highlight_functions = "style"
let java_ignore_javadoc = 1
let perl_include_POD = 1                                                                   
if &dict == "offmylawn"
   hi Comment	ctermfg=DarkGray
   "hi Comment	ctermfg=Yellow
   hi Todo    	ctermfg=Yellow		ctermbg=Black
   "hi Todo       NONE
   hi Constant   NONE
   hi Special    NONE
   hi Identifier NONE
   hi Statement  NONE
   hi PreProc    NONE
   hi Type       NONE
   hi Ignore     NONE
   hi Error      NONE
   else 
      if &background == "dark"
         hi Comment	ctermfg=DarkCyan
	 hi Constant	ctermfg=DarkMagenta
      else
      endif "standard
endif "offmylawn
