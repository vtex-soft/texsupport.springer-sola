%% This is file `spr-mp-sola.bst'
%%
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% Sorting entries is done by name and year fields!
%%
%% You are free to use this style file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.

% BibTeX programming: Linas Stonys, VTeX, Lithuania, lstonys@vtex.lt 
%
% 2009-06-03 -- added letters to the \citeauthoryear{}{} year section (if the same year) 
%               \citeauthoryear{autho}{2000a}  
%               \citeauthoryear{autho}{2000b}  
%               not cutting letters from the pages any more
% 2009-06-04 -- added letters to the volume ("CS-" if publisher = "ASP" and "SP-" if publisher = "ESA")            
%               \doiurl in \textsf font
% 2011-09-16 -- fixed: output pages. letter insertation near pages in nameyear style.
% 2013-12-19 -- added fields: arxiv, adsurl.
%               Striping "http://arxiv.org/abs/" from begin of arxiv.
%               Striping "http://adsabs.harvard.edu/" + "abs/" from begin of adsurl.
%               Striping "http://dx.doi.org/" from begin of doi.
%               Sorting takes into account initials, not names.
% 2014-01-28 -- escaping "%" in url and adsurl fields.
% 2014-02-13 -- removed last page from output.

ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    editor
    howpublished
    institution
    isbn
    journal
    key
    month
    note
    number
    organization
    pages   
    publisher
    school
    series
    title
    type
    volume
    year
    url
    info
    options
    adsurl
    arxiv
  }
  {}
   { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence
           after.block after.authors between.elements bother slen set.settings default.info tmp}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.authors :=
  #5 'between.elements :=
}

STRINGS { s t  element}
STRINGS { longest.label last.label list.string}
STRINGS { v l f j b temp.str}

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { " " * write$ newline$}
    { output.state after.block =
        { add.period$ write$
          newline$
         % "\newblock " write$
        }
        {
          output.state after.authors =
          { ": " * write$
            newline$
          }
          { output.state between.elements =
              { ", " * write$ newline$}
              { output.state before.all =
                   'write$
                  { add.period$ " " * write$ newline$}
                    
                    
                  if$
              }
              if$
          }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {fin.entry}
{
  "." *
  write$ newline$
}

FUNCTION {stupid.colon}
{ after.authors 'output.state := }


FUNCTION {insert.comma}
{ output.state before.all =
    'skip$
    { between.elements 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}


FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {sort.format.month}
{ 't :=
    t #1 #2 substring$ "01" =
    t	#1 #1 substring$ "1" =
    t	#2 #2 substring$ "" =
    and or
    { "January" }
    { t #1 #2 substring$ "02" =
      t	#1 #1 substring$ "2" =
      t	#2 #2 substring$ "" =
      and or
      { "February" }
      { t #1 #2 substring$ "03" =
         t #1 #1 substring$ "3" =
         t	#2 #2 substring$ "" =
         and or
        { "March" }
        { t #1 #2 substring$ "04" =
          t #1 #1 substring$ "4" =
          or
          { "April" }
          { t #1 #2 substring$ "05" =
             t #1 #1 substring$ "5" =
             or
            { "May" }
            { t #1 #2 substring$ "06" =
              t #1 #1 substring$ "6" =
              or
              { "June" }
              { t #1 #2 substring$ "07" =
                t #1 #1 substring$ "7" =
                or
                { "July" }
                { t #1 #2 substring$ "08" =
                   t #1 #1 substring$ "8" =
                   or
                  { "August" }
                  { t #1 #2 substring$ "09" =
                    t #1 #1 substring$ "9" =
                    or
                    { "September" }
                    { t #1 #2 substring$ "10" =
                      { "October" }
                      { t #1 #2 substring$ "11" =
                        { "November" }
                        { t #1 #2 substring$ "12" =
                          { "December" }
                          { t } % No match
                        if$
                        }
                      if$
                      }
                    if$
                    }
                  if$
                  }
                if$
                }
              if$
              }
            if$
            }
          if$
          }
        if$
        }
      if$
      }
    if$
    }
  if$
 
}

INTEGERS {sk}
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {make.tag}
{ 't :=
  duplicate$ empty$
    { pop$ "" }
    { bother #0 =
      {	
        t "btitle" =
        t "jtitle" =
        or
          {"\textit{"  swap$ * "}" * }
          'skip$
        if$
        t "volume" =
        t "seriesno" =
        or
          {"\textbf{"  swap$ * "}" * }
          'skip$
        if$
      }
      { "\b" t * "{" * swap$ * "}" * }
    if$
    }
  if$
}

FUNCTION {springer.publisher}
{publisher #1 #8 substring$ "Springer" =
  { "Springer"  }
  { publisher }
if$
}

FUNCTION {format.pub.address}
{ publisher empty$
  howpublished empty$
  and
    { address empty$
        'skip$
        {	insert.comma
            address
          type$ "inproceedings" =
            {"conflocation"}
            {"location"}
       if$	
          make.tag output
        }
      if$
    }
    { address empty$
        {publisher empty$
            {howpublished} 
            {publisher}
         if$ 
         "publisher"  make.tag
         #1 bother =
            {", \blocation{???}" *  }
          'skip$
         if$
         output   
        }
        {publisher empty$
            {howpublished } 
            {springer.publisher } 
         if$ 
          "publisher"  make.tag output
          insert.comma
          address "location" make.tag output
        }
      if$
    }
  if$
}
INTEGERS { nameptr namesleft numnames}
FUNCTION {mk.tag}
{ 'temp.str :=
  duplicate$ empty$
    { pop$ "" }
    { 
      b "nothing" =
        'skip$
      {"\b" temp.str * "{" * swap$ * "}" * }
    if$
  }
  if$
}

FUNCTION {space.after.dot}
{'j :=
  t 'f :=
  j 't := 
  s 'j :=
  "" 'l :=
  "" 's :=
%"orig=" t * top$
  { t empty$ not }
  {   
    t #1 #3 substring$ "{-}" =
       {l  " {q}. " * 'l :=
        t #4 global.max$ substring$ 't :=
       }
        'skip$ 	
    if$

    t #1 #1 substring$ 's :=
      l  s * 'l := 

      s "." = 
    { 

          t #2 #1 substring$ " " =
            'skip$
         {
           l  " " * 'l := 
         t #2 #4 substring$ "{\,}" =
             {
              t #5 global.max$ substring$ 't :=
             }
               'skip$
               if$ 
          } 
            if$  
    } 
    'skip$
      if$

      t #2 global.max$ substring$ 't :=
    }
  while$
  f 't :=
  j 's :=
  l 
%"new="  l * top$ 
}

FUNCTION {fix.inits}{
  't :=
   "" 'element :=
    { t empty$ not }
    {  

    t #1 #3 substring$ ".q." =
       {element  ".-" * 'element :=
          t #3 global.max$ substring$ 't :=
       }
       {element  t #1 #1 substring$ * 'element :=}
       %'skip$ 	
       if$
    
      t #2 global.max$ substring$ 't :=
    }
  while$
  element
}

FUNCTION {fix.snm}{
  't :=
   "" 'element :=
    { t empty$ not }
    {  

    t #1 #3 substring$ "{-}" =
       {element  "-" * 'element :=
          t #3 global.max$ substring$ 't :=
       }
       {element  t #1 #1 substring$ * 'element :=}
       if$
    
      t #2 global.max$ substring$ 't :=
    }
  while$
  element
}

FUNCTION {enbrace.dash}{
  't :=
   "" 'element :=
    { t empty$ not }
    {  
    t #1 #1 substring$ "-" =
      {element  "{-}" * 'element :=}
       {element  t #1 #1 substring$ * 'element :=}
      if$
      t #2 global.max$ substring$ 't :=
    }
  while$
  element
}

FUNCTION {fix.name}{	

    enbrace.dash 's :=
  "" 'l :=
    "" 't :=

    #1 'nameptr :=
    s num.names$ 'numnames :=
    numnames 'namesleft :=
    { namesleft #0 > }
    {
        s nameptr "{vv~}{ll}{, jj}" format.name$
        s nameptr "{, ff}" format.name$ space.after.dot * 'l :=
%      	s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$  'l :=
      #1 nameptr = 
      {l 't :=}
      {t " and " * l * 't := }
    if$
      nameptr #1 + 'nameptr := 
      namesleft #1 - 'namesleft :=
    }
  while$
  t 
}

FUNCTION {name.separator}{
  namesleft #1 >
      {", " * }
        'skip$
  if$
}

FUNCTION {format.author.editor}
{ 'b :=

    bother #1 =
    b "nothing" =
    or
      'skip$
      {"b" b * 'b :=}
  if$

     b "editor"  =
     b "beditor" =
     b "nothing" =
     or or
    {editor 's :=}
    {author 's :=}
  if$
  
   %% apdoroju varda
    s fix.name 's :=
    

   "" 't :=	
 
  #1 'nameptr :=
    s num.names$ 'numnames :=
    numnames 'namesleft :=
    
    s numnames "{ll}" format.name$ 'l :=
    l  "others" =
     l  "{others}" =
     l  "et al." =
     l  "{et al.}" =
     or or or
       {#1 'tmp :=}
       {#0 'tmp :=}
    if$
    
    { namesleft #0 > }
    {	s nameptr "{vv}" 	format.name$           "particle" mk.tag  'v := 
      s nameptr "{ll}" 	format.name$ fix.snm   "snm"      mk.tag  'l :=   
      s nameptr "{f{.}.}" format.name$ fix.inits "inits"    mk.tag  'f := 
      s nameptr "{jj}" 	format.name$           "suffix"   mk.tag  'j := 
    
    
       namesleft #1 =
       tmp #1 = 
       and
       { b "bauthor" =
         b "beditor" =
         or
           {"et al."}
           {"\betal"}
         if$
         #1 'tmp :=
       }
       {

         b "bauthor" =
         b "beditor" =
         or
          {"\oauthor{"}
          {
             b "nothing" =
               {""}
              {"\b" b * "{" *}
          if$
          }
      if$			

      v empty$
        'skip$
        {v * " " *}
      if$
      
      l empty$
        'skip$
        { l *} 		
      if$			

      f empty$
        'skip$
        {", " * f *} 		
      if$

      j empty$
        'skip$
        {" "  * j *} 		
      if$

      b "nothing" =
        {""}
        {"}"}  
      if$
      
      * "" 't :=

     } 
    if$

      name.separator

      write$ 
        
      namesleft #1 >
      b "nothing" = not
      and
        {namesleft #2 =
         tmp #1 =
         and
          'skip$
          'newline$
         if$
        }
        'skip$
      if$

      nameptr #1 + 'nameptr := 
      namesleft #1 - 'namesleft :=
    }
  while$
  
}

FUNCTION {format.editors}
{ editor empty$
    'skip$
    {
      bother #0 =
      {author empty$
             {"editor"}
           {"nothing"}
          if$
        }
      {"editor"}
    if$  
      format.author.editor
      editor num.names$ #1 >
        { " (eds.)" }
        { " (ed.)" }
      if$
      write$
    }
  if$
}

FUNCTION {format.authors}
{ author empty$
    'skip$
  {"author"  format.author.editor}
  if$
}


FUNCTION {cite.author.editor}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #3 >
    { pop$ " \textit{et~al.}" * }
    { #3 =
        { s #3 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            { " \textit{et~al.}"  * }
            { ", " * s #2 "{vv~}{ll}" format.name$ * 
             ", and " * s #3 "{vv~}{ll}" format.name$ *  
            }
          if$
        }
        {s num.names$ #2 =
                {s #2 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
                    { " \textit{et~al.}"  * }
                     { " and " * s #2 "{vv~}{ll}" format.name$ * }
                   if$
                 }
                 'skip$
           if$
        }
      if$
    }
  if$
}
FUNCTION {check.auth.edit.org}
{author empty$
    {
      editor empty$
          {
            organization empty$
                {""}
                {organization}
            if$		
          }
          {editor cite.author.editor}
      if$		
    }
    {author cite.author.editor}
 if$	
}

FUNCTION {check.year}
{year empty$
    {""}
    {year extra.label *}
  if$	
}

INTEGERS { multiresult char.num k int}
INTEGERS {str.length count return save.num1 save.num2}
FUNCTION {is.in.list}{
  'f :=
  %%%% issisaugoju originalius "s" ir "t"
  s 'j :=
  f 's :=
  t 'f :=  
  list.string text.length$ 'str.length :=
  list.string 't :=
%  s text.length$ 'slen :=
  int   'save.num1 :=
  count 'save.num2 :=
  #1 'int :=
  #1 'count :=
  #0 'return :=
    
    { count str.length = not 
      #0 str.length = not
      and
    }
    {
      count #1 + 'count :=
      t int #1 substring$ "," =
        {
          t #1 int substring$ s "," * =
            {
             #1 'return :=
              str.length 'count :=
             }
            'skip$
         if$
          
          int #1 + 'int :=
           t int global.max$ substring$ 't :=
          #0 'int :=
        }
        'skip$
      if$	
      int #1 + 'int :=
%			"count=" count int.to.str$ * " slen=" * str.length int.to.str$ * top$
    }
  while$

  save.num1 'int   :=
  save.num2 'count :=
  
  #0 return =
    { s t =
        {#1 'return :=}
        'skip$
      if$
    }
    'skip$
  if$
  %%%% grazinu originalius "s" ir "t"
  j 's :=
  f 't :=  
  
  return		
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem"
  "nameyear" is.in.list
     {
       "[\protect\citeauthoryear{" * write$
           check.auth.edit.org write$ 
       "}{" write$ 
           check.year write$ 
       "}]" 
    }
    'skip$
  if$
  "alpha" is.in.list
     {
       "[" * write$
      label write$
      "]" 
    }
    'skip$
  if$
  "{" cite$ "}" * * * write$ 
  newline$
  "" before.all 'output.state :=
}


FUNCTION {string.to.integer}
{ 't :=
    t text.length$ 'k :=
  #1 'char.num :=
      { t char.num #1 substring$ 's :=
       s is.num
       s "." =
       or 
       char.num k = not
       and
        }
      {char.num #1 + 'char.num :=}
  while$
  char.num #1 - 'char.num :=
  t #1 char.num substring$ 
  
%  "S" k * write$
}


FUNCTION {find.integer}
{ 'b :=
  #0 'int :=
    { int not
      b empty$ not
      and
    }
    { b #1 #1 substring$ 's :=
      s is.num 
        {#1 'int :=}
        { b #2 global.max$ substring$ 'b := }
      if$
    }
  while$
  int 
}


FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$}
  if$
}
FUNCTION {note.presented}
 {note #1 #9 substring$ "presented" = 
   note #1 #9 substring$ "Presented" = 
 or}
 
FUNCTION {n.filter}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "," =
      t #1 #1 substring$ "\" =
      t #1 #1 substring$ "~" =
      or or
            {  "" *
                  t #2 global.max$ substring$ 't :=
            }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {byear}
{ 't :=
  t text.length$ 'sk :=
  #5 sk =
    {t #1 #4 substring$ 's :=
     t #5 #1 substring$ 'longest.label :=
       longest.label is.num not	
        {s "year" make.tag  longest.label * }
        {t "year" make.tag }
      if$
    }
    {t "year" make.tag 
      "nameyear" is.in.list						
        {extra.label *}
        'skip$
      if$
    }
  if$
}

FUNCTION {format.date}
{ year empty$
    { "" }
    { year  byear "," *}
  if$
}
FUNCTION {format.month}
{ month empty$
'skip$
{month sort.format.month}
if$
}
FUNCTION {formatpatent.date}
{ year empty$
    'skip$
    { month empty$
       { year }
        {format.month " " * year *}
      if$
    }
  if$
}
FUNCTION {month.year.date}
{ year empty$
    'skip$
    { month empty$
        {year byear}
        { format.month " " * year byear * }
      if$
    }
  if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {format.volume}
{ volume empty$
    { "book" type$ =
      number empty$ not
      and
        {	"cnd" is.in.list
            publisher empty$
          or	
            {""}
            {publisher "l" change.case$ "asp" =
              {"CS-"}
               { 
                publisher "l" change.case$ "esa" =
                  {"SP-"}
                   {""}
                if$ 
               }
              if$
               }
            if$	  
      number * "seriesno" make.tag
          }
        {""} 
      if$
    }
    { 
      "cnd" is.in.list
      publisher empty$
      or
        {""}
        {publisher "l" change.case$ "asp" =
          {"CS-"}
          { 
              publisher "l" change.case$ "esa" =
                 {"SP-"}
                 {""}
              if$ 
          }
          if$
        }
      if$    
      volume * "seriesno" make.tag
    }
  if$
}

FUNCTION {format.art.vol}
{ volume n.filter "volume" make.tag 
  number empty$
    {"" *}
    { "(" number "issue" make.tag * ")" * *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  
}

FUNCTION {format.series}
{ series empty$
    'skip$ 
    { #0 bother =
          {"\textit{" series * "}" * }
          {"\bsertitle{" series * "}" * }
      if$
    }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { "" 'v :=
      "" 'l :=    
      "" 'f :=    
      edition "l" change.case$ 's :=
         "1" s =
         "first" s =  			
         or
           {
             "1" 'v :=
            "st" 'l :=  
           }
           {
             "2" s =
             "second" s =  			
             or
               {
                 "2" 'v :=
                "nd" 'l :=  
               }
               {
                 "3" s =
                 "third" s =  			
                 or
                   {
                     "3" 'v :=
                    "rd" 'l :=  
                   }
                   {
                     "4" s =
                     "fourth" s =  			
                     or
                       {
                         "4" 'v :=
                        "th" 'l :=  
                       }
                       {
                         "5" s =
                         "fifth" s =  			
                         or
                           {
                             "5" 'v :=
                            "th" 'l :=  
                           }
                           {
                             "6" s =
                             "sixth" s =  			
                             or
                               {
                                 "6" 'v :=
                                "th" 'l :=  
                               }
                               {
                                 "7" s =
                                 "seventh" s =  			
                                 or
                                   {
                                     "7" 'v :=
                                    "th" 'l :=  
                                   }
                                   {
                                     "8" s =
                                     "eighth" s =  			
                                     or
                                       {
                                         "8" 'v :=
                                        "th" 'l :=  
                                       }
                                       {
                                         "9" s =
                                         "nineth" s =  			
                                         or
                                           {
                                             "9" 'v :=
                                            "th" 'l :=  
                                           }
                                           {
                                               edition "t" change.case$ 'f :=
                                           }
                                         if$	 
                                       }
                                     if$	 
                                   }
                                 if$	 
                               }
                             if$	 
                           }
                         if$	 
                       }
                     if$	 
                   }
                 if$	 
               }
             if$	 
           }
         if$	 
        #0 bother =		
           {	f "" =
               { v l *	'f :=}
               'skip$
             if$
           }
           {	f "" =
               { "\bedition{" v * "}" * l *	'f :=}
               { "\bedition{" f * "}" *	'f :=}
             if$
           }
       if$
       f " edn." *
    }
  if$
}
FUNCTION {format.isbn}
{ isbn empty$
    { "" }
    { 	#0 bother =
            {isbn}
            {"\bisbn{"  isbn * "}" *}
        if$
    }	
  if$
}


FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$ "-" =
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult 
}

INTEGERS {N N2 N3 Plength quit}

FUNCTION {do.pages}
{'t :=
  #1 'N :=
  #0 'N2 :=
  #0 'N3 :=
  #0 'quit :=
  
  t text.length$ 'Plength :=
  "" 'l :=
  "" 'v :=
    {N Plength = not
     quit #0 =
     and
    }
    { t N #1 substring$ "-" =
        { N2 #0 =
          {N 'N2 :=}
          'skip$
           if$
           #1 N3 + 'N3 :=
        }
        { N2 #0 >
           {#1 'quit :=}
           'skip$
         if$ 
        }
      if$
      #1 N + 'N :=
    }
  while$
  t #1 N2 #1 - substring$  'l :=
  t N2 N3 + global.max$ substring$  'v :=
  l  "fpage" make.tag  
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        {insert.comma pages do.pages }
        {insert.comma pages "fpage" make.tag}

      if$
    }
  if$
}

FUNCTION {escape.comment}
{ 't :=
  "" 's := 
  ""
    { t empty$ not }
    { t #1 #1 substring$ "%" =
      "\" s = not
      and
        {"\" *}
        'skip$
      if$
      t #1 #1 substring$ 's :=
      s *
      t #2 global.max$ substring$ 't :=
    }
  while$
}


FUNCTION {format.url}
{ url empty$
    { "" }
    { 	
      #0 bother =
        {"\url{"}
        {"\burl{"}
      if$
      url escape.comment * "}" * 
    }	
  if$
}

FUNCTION {strip.at.begin}{
  's :=	% strip string
  't := % content
  s text.length$ 'slen :=	
  t text.length$ slen >
    {
      t #1 slen substring$ s = 
        {t slen #1 + global.max$ substring$ 't :=}
        'skip$
      if$	
    }
    'skip$
  if$ 
  t 
}

% Striping "http://arxiv.org/abs/" from begin of arxiv 
FUNCTION {format.arxiv}
{ arxiv empty$
     {""}
     { "\arxivurl{" arxiv "http://arxiv.org/abs/" strip.at.begin * "}" * }
  if$
}

% Striping "http://adsabs.harvard.edu/" + "abs/" from begin of adsurl 
FUNCTION {format.adsurl}
{ adsurl empty$
     {""}
     { "\adsurl{" adsurl "http://adsabs.harvard.edu/" strip.at.begin "abs/" strip.at.begin escape.comment * "}" * }
  if$
}

% Striping "http://dx.doi.org/" from begin of doi
FUNCTION {format.doi}
{ doi empty$
     {""}
     { "\doiurl{" doi "http://dx.doi.org/" strip.at.begin * "}" * }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    {	"cnd" is.in.list
        'skip$
        {#1 bother =
          { editor empty$
                { "In: \bbtitle{???}"  output}
                { "In: " output write$ format.editors 
                "\bbtitle{???}"  output 
                }
            if$
          }
          'skip$
         if$
        }
      if$
    }
    { editor empty$
        { "In: " booktitle "btitle" make.tag * output}
        {  "In: " output write$
           format.editors "" %%% pushing empty string to the empty stack
           booktitle "btitle" make.tag  output 
        }
      if$
    }
    
  if$
}

FUNCTION {format.in.ed}
{ title empty$
   'skip$
    { editor empty$
        {  title "btitle" make.tag output}
       { author empty$
        {  format.editors 
            stupid.colon
            format.date output
            title "btitle" make.tag output
        }
        { "In: " output write$ format.editors "" %%% pushing empty string to the empty stack
          title "btitle" make.tag output
        }
        if$
        }
      if$
    }
    
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {patent.number}
{    number empty$
     'skip$
    { number }
  if$
}
INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}   
 
FUNCTION {format.inpres}
{ "l" change.case$ 't :=
      "in press: " #10
       "in press. " #10
        "in press " #9 t chop.word
      chop.word
     chop.word
  #1 global.max$ substring$
}

FUNCTION {bcomment.note}
{note empty$
'skip$
 {note format.inpres "comment" make.tag output}
 if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.chapter.and.note}
{		note empty$ chapter empty$ organization empty$ and and
    'skip$
  {	chapter empty$
    "nenumeris" last.label =
    or
      {organization empty$
          {note "comment" make.tag output}
          {note empty$
              {organization "comment" make.tag output}
              {organization ". " * note * "comment" make.tag output}
           if$
          }
       if$
      }
      {note empty$
        {"Chap. "  chapter * "comment" make.tag output}
            {		type empty$
                  { "Chap. " }
                  { type "t" change.case$ "Section" = 
                       {	"Sect. " }
                      { "Chap. " }
                    if$	
                  }
                if$
                    chapter * ". " * note * "comment" make.tag  output
            }
          if$
        }
      if$
  }
  if$
    
}

FUNCTION {item.pabaiga}
{
  new.sentence
  type$ "unpublished" =
      {	note empty$
          'skip$
          {note.presented
              'skip$
              {note output}
           if$		
          }
        if$	
      }
      {
        type$ "proceedings" =
            {author empty$ editor empty$ and
                'bcomment.note
                 'format.chapter.and.note 
             if$	
            }
             'format.chapter.and.note 
         if$		
      }
  if$
  new.sentence 
  format.isbn output
  new.sentence
  format.doi  output
  new.sentence
  format.adsurl  output
  new.sentence
  format.arxiv  output
  new.sentence
  format.url output
  fin.entry
}
FUNCTION {insert.element}
{	#0 bother =
      {element "{botherref}" * write$ newline$}
      {
         type$ "article" =
            {element "{barticle}" * write$ newline$}
            'skip$
         if$
         type$ "book" =
         type$ "proceedings" =
         type$ "manual" =
         type$ "booklet" =
         or or or 
            {element "{bbook}" * write$ newline$}
            'skip$
         if$
          
         type$ "inbook" =
            {	"nenumeris" last.label =
                {element "{bchapter}" * write$ newline$}
                {element "{bbook}" * write$ newline$}
              if$	
            }
            'skip$
         if$
        
     type$ "incollection" =
     type$ "inproceedings" =
     type$ "conference" =
     or or
            {element "{bchapter}" * write$ newline$}
            'skip$
         if$

       }
  if$
}
FUNCTION {end.element}
{ "\end" 'element :=
  item.pabaiga
  insert.element
  "\endbibitem" write$ newline$
}
FUNCTION {begin.element}
{ "\begin" 'element :=
  insert.element
}

FUNCTION {assign.global.values}{

  %%%%%%%%%% Basic settings: #1->on, #0->off  
  info empty$
    'skip$
    { info "1" =
        {#1 'default.info :=} 
        {#0 'default.info :=}
      if$
    }
  if$
}
FUNCTION {prin.info}{
  default.info
    {
%		"%" month=" * article.month int.to.str$ * ")" * write$ newline$
      "%style="
      "alpha" is.in.list
        {"alpha"}
        {
          "nameyear" is.in.list
            {"nameyear"}
            {"number"}
          if$
        }
      if$
      *
      ", sorted="
      *	
      "unsort" is.in.list
        {"no"}
        {"yes"}
      if$
      *

      "nodoi" is.in.list
        {", other options=nodoi" *}
        'skip$
      if$
      write$ newline$
    }
    'skip$
  if$	
}

FUNCTION {settings}
{
  set.settings not
    { 
      assign.global.values
      #1 'set.settings :=
      prin.info
    }
    'skip$
  if$
}

FUNCTION {article}
{ output.bibitem
  author empty$
  institution empty$ 
  editor empty$
  and and
  journal empty$ 
  year empty$ 
  or or 
  volume empty$ pages  empty$ 
  doi empty$ and
     or or
    {#0 'bother :=} 
    {#1 'bother :=} 
  if$	

  begin.element
  author empty$
    { editor empty$
        'skip$
         {format.editors stupid.colon}
      if$
    }
    { format.authors 
      stupid.colon
    }
  if$
  format.date output
  "cnd" is.in.list
  journal empty$ not
  and
    'skip$
    {format.title "atitle" make.tag output new.sentence }
  if$
  journal empty$
    'skip$
    {journal "jtitle" make.tag  output}
  if$
  volume empty$
    'skip$
    {format.art.vol output }
  if$
  pages empty$
    'skip$
    {insert.comma}
  if$
  format.pages output
  end.element
}

FUNCTION {patent}
{ output.bibitem
  #0 'bother :=
  begin.element
  author empty$
    'skip$
    {format.authors stupid.colon}
  if$
  format.title "title" output.check
  add.period$
  patent.number output
  insert.comma
  formatpatent.date output
  end.element
}

FUNCTION { other } { patent }

FUNCTION {book}
{ output.bibitem
  author empty$
  institution empty$ 
  organization empty$ 
  editor empty$
  and and and
  title empty$ 
    year empty$ 
   or or 
    {#0 'bother :=} 
    {
      publisher empty$ address empty$ not and
        {#0 'bother :=} 
        {#1 'bother :=}
      if$
    } 
  if$	

  begin.element
  author empty$
    { editor empty$
        'skip$
         {format.editors stupid.colon}
      if$
    }
    { format.authors stupid.colon}
  if$
    
  format.date output
  format.title "btitle" make.tag "title" output.check
  series empty$
      {
       format.volume output
       insert.comma 
       format.edition output
       new.sentence
       }
       {
       insert.comma
       format.edition output
       insert.comma
       format.series output
       format.volume output
    }
  if$ 
  publisher empty$
    'skip$
      {edition empty$ not series empty$  and
        'new.sentence
        'insert.comma
       if$		
      }
  if$
  format.pub.address
  new.sentence
  format.pages output
  end.element      
}

FUNCTION {booklet}
{output.bibitem
  author empty$
  title empty$ 
  year empty$ 
  howpublished empty$  
  or or or
    {#0 'bother :=} 
    {#1 'bother :=} 
  if$	

  begin.element
  author empty$
    'skip$
    {format.authors stupid.colon}
  if$
  format.date  output
  format.title "btitle" make.tag "title" output.check
  new.sentence
  insert.comma
  format.pub.address
  new.sentence
  end.element
}
FUNCTION {misc}
{output.bibitem
  #0 'bother :=
  begin.element
  author empty$
    'skip$
    {format.authors stupid.colon}
  if$
  format.date  output
  format.title "btitle" make.tag "title" output.check
  new.sentence
  insert.comma
  format.pub.address
  new.sentence
  end.element
}

FUNCTION {inbook}
{ output.bibitem

  author empty$
  institution empty$ 
  organization empty$ 
  editor empty$
  and and and
  title empty$ 
  year empty$ 
  or or
    {#0 'bother :=} 
    {
      publisher empty$ address empty$ not and
        {#0 'bother :=} 
        {#1 'bother :=}
      if$
    } 
  if$	

  chapter empty$
  {	"" 'last.label :=}
    {	chapter string.to.integer empty$ author empty$ not and
      {	"nenumeris" 'last.label :=}
      {	"" 'last.label :=}
      if$
    }
  if$
  
  begin.element
  author empty$
    'skip$
    {format.authors 
      stupid.colon
      format.date output
    }
  if$ 
  "cnd" is.in.list
  title empty$ not
  and
    'skip$
    {	    	
        "nenumeris" last.label =
        {chapter "ctitle" make.tag output add.period$}
          'skip$
      if$
    }
  if$
  format.in.ed 
  series empty$
    {
       format.volume output
       insert.comma 
       format.edition output
       new.sentence
     }
     {
       insert.comma
       format.edition output
       insert.comma
       format.series output
       format.volume output
    }
  if$ 
  publisher empty$
    'skip$
      {edition empty$ not series empty$  and
        'new.sentence
        'insert.comma
       if$		
      }
  if$
  format.pub.address
  new.sentence
  format.pages output
  end.element
}

FUNCTION {incollection}
{ output.bibitem
  author empty$
  institution empty$ 
  and
  booktitle empty$ 
  year empty$ 
   or or
    {#0 'bother :=} 
    {
        "cnd" is.in.list not
      title empty$
      and
        {#0 'bother :=} 
        {
          publisher empty$ address empty$ not and
            {#0 'bother :=} 
            {#1 'bother :=}
          if$
        }
      if$
      
    } 
  if$	
  begin.element
  author empty$
    'skip$	
    {format.authors stupid.colon}
  if$		 
  format.date output
    
  "cnd" is.in.list 
  booktitle empty$ not
  and
    'skip$
    {
      title empty$
        'skip$
         {format.title "ctitle" make.tag "title" output.check new.sentence}
      if$
    }
  if$
  format.in.ed.booktitle 
  series empty$
    {
     format.volume output
     insert.comma 
     format.edition output
    }
    {
     edition empty$
       'skip$
       {insert.comma 
         format.edition output
         insert.comma
       } 
     if$		
     format.series output
     format.volume output
    }
  if$ 
  insert.comma
  format.pub.address
  new.sentence
  format.pages output
  end.element
 }

FUNCTION {inproceedings}
{ output.bibitem
  author empty$
  institution empty$ 
  and
  title empty$ 
  year empty$ 
   or or
    {#0 'bother :=} 
    {#1 'bother :=} 
  if$	
  begin.element
    author empty$
     'skip$
       {format.authors stupid.colon}
    if$
     format.date output
  "cnd" is.in.list 
  booktitle empty$ not
  and
    'skip$
    {
      format.title "ctitle" make.tag "title" output.check
      title empty$ booktitle empty$ not and
        'skip$
        'new.sentence
      if$
    }
  if$
  format.in.ed.booktitle 
  series empty$
    'skip$
    {insert.comma format.series output}
  if$  
  format.volume output
  publisher empty$
    'skip$
    {insert.comma}
  if$
  format.pub.address
  pages empty$
    'skip$
    {insert.comma}
  if$  
  format.pages output
  end.element
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem

  author empty$
  organization empty$ 
  title empty$ 
    year empty$ 
   address  empty$   
     or or or or
    {#0 'bother :=} 
    {#1 'bother :=} 
  if$	
  begin.element

  author empty$
    { organization empty$
        'skip$
        { organization "publisher"  make.tag output.nonnull
          stupid.colon% add.period$
        }
        if$
    }
    { format.authors  stupid.colon}
  if$
  format.date output
  title empty$
    'skip$
    {format.title "btitle" make.tag output}
  if$
  edition empty$
    {new.sentence}
    {insert.comma}
  if$
  format.edition output
  edition empty$
    'skip$
    {new.sentence}
  if$
  author empty$ organization empty$
  or
    'skip$
    { organization "publisher"  make.tag output.nonnull
      insert.comma
    }
  if$
  address empty$
    'skip$
    {address "location" make.tag output}
  if$
  end.element
}


FUNCTION {phdthesis}
{output.bibitem
  #0 'bother :=

  begin.element
  author empty$
    'skip$
    {format.authors stupid.colon}
  if$
  format.date output
  format.title "title" output.check
  new.sentence
  type$ "mastersthesis"  =
    {"Master's thesis" format.thesis.type output.nonnull}
    {"PhD thesis" format.thesis.type output.nonnull}
  if$		
  school empty$
    'skip$
    { insert.comma }
  if$
  school "school" output.check
  address empty$
    'skip$
    { insert.comma }
  if$
  address output
  end.element
}
FUNCTION {mastersthesis}{phdthesis}


FUNCTION {proceedings}
{ output.bibitem
  author empty$
  institution empty$ 
  organization empty$ 
  editor empty$
  and and and
  title empty$ 
  year empty$ 
  or or 
    {#0 'bother :=} 
    {
      publisher empty$ address empty$ not and
        {#0 'bother :=} 
        {#1 'bother :=}
      if$
    } 
  if$	

  begin.element
  author empty$
    { editor empty$
        {organization "institute" make.tag "organization" output.check stupid.colon}
        { format.editors stupid.colon}
      if$ 
    }
    { format.authors stupid.colon}
  if$
  
  format.date output
  format.title "btitle" make.tag output
  series empty$
    'skip$
    {insert.comma format.series output}
  if$  
  format.volume output
  publisher empty$
    'skip$
    {insert.comma}
  if$
  format.pub.address
  pages empty$
    'skip$
    {insert.comma}
  if$
  format.pages output
  end.element
}	

FUNCTION {techreport}
{output.bibitem
  #0 'bother :=

  begin.element
  author empty$
   'skip$
    {format.authors stupid.colon}
  if$
  format.date output
  format.title "title" output.check
  new.sentence
  format.tr.number output.nonnull
  institution empty$
    'skip$
    { insert.comma }
  if$
  institution "institution" output.check
  address empty$
    'skip$
    { insert.comma }
  if$
  address output
  end.element
}

FUNCTION {unpublished}
{output.bibitem
  #0 'bother :=

  begin.element
  author empty$
   'skip$
    {format.authors stupid.colon}
  if$
  year empty$ not author empty$ not and
    {format.date output}
    'skip$
  if$
  format.title "title" output.check
  title empty$
    'skip$
    {new.sentence}
  if$
  note empty$
    'skip$
    {note.presented 
      {note output}
      'skip$
    if$
    }
  if$
  year empty$ not author empty$ and
    {insert.comma year output}
    'skip$
  if$
  end.element
}

FUNCTION {default.type} { unpublished }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { et.al.char.used }

FUNCTION {initialize.et.al.char.used}
{ #0 'et.al.char.used :=
}

%%%%% setting default options
FUNCTION {set.default.opt}
{"nameyear" 'list.string :=}

EXECUTE {set.default.opt}


FUNCTION {assign.opt}{
  % priskiriu options lauka, kad galeciau i(is)jungti "unsort"
  "settings" type$ =
    {options empty$
    'skip$
      {options 'list.string :=}
     if$
    }
    'skip$
  if$
}

ITERATE {assign.opt}
EXECUTE {initialize.et.al.char.used}

FUNCTION {alpha.format.lab.names}
{ 's :=
  s num.names$ 'numnames :=
  numnames #1 >
    { numnames #4 >
        { #3 'namesleft := }
        { numnames 'namesleft := }
      if$
      #1 'nameptr :=
      ""
  { namesleft #0 > }
  { nameptr numnames =
      { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
    { "+" *
      #1 'et.al.char.used :=
    }
    { s nameptr "{v{}}{l{}}" format.name$ * }
        if$
      }
      { s nameptr "{v{}}{l{}}" format.name$ * }
    if$
    nameptr #1 + 'nameptr :=
    namesleft #1 - 'namesleft :=
  }
      while$
      numnames #4 >
  { "+" *
    #1 'et.al.char.used :=
  }
  'skip$
      if$
    }
    { s #1 "{v{}}{l{}}" format.name$
      duplicate$ text.length$ #2 <
  { pop$ s #1 "{ll}" format.name$ #3 text.prefix$ }
  'skip$
      if$
    }
  if$
}

FUNCTION {format.lab.names}{
  "alpha" is.in.list
    'alpha.format.lab.names
    'cite.author.editor % keys for inserting letters should be the same as cited labels.
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { "zzz" }
            { key #3 text.prefix$ }
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { "zzz" }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
  { organization empty$
%	    { cite$ #1 #3 substring$ }
      { "zzz" }
      { "The " #4 organization chop.word #3 text.prefix$ }
    if$
  }
  { key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list

  "alpha" is.in.list
  {
    duplicate$
    year field.or.null purify$ #-1 #2 substring$
    *
    'label :=
    year field.or.null purify$ #-1 #4 substring$
    *
    sortify 'sort.label :=
  }
  {
    "("
    *
    year duplicate$ empty$
    short.list key field.or.null = or
      { pop$ "" }
      'skip$
    if$
    *
    'label :=
    label 'sort.label :=
  } 
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * 
          "alpha" is.in.list
            'skip$
            {numnames int.to.str$ * "   " *}
          if$
        }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = 
      t "others" = 
      and
        { "et al" * }
        { t sortify * }
      if$
    #3 numnames  <
    "alpha" is.in.list not
    and
        {#0 'namesleft :=
             " zzz   " *
        }    
        {
           nameptr #1 + 'nameptr :=
          namesleft #1 - 'namesleft :=
        }
      if$  	
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          "zzz"
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  sort.label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
     {author empty$
       'editor.organization.sort
      'author.organization.sort
     if$
    }
    { type$ "proceedings" =
      type$ "incollection" =
       or
        {author empty$
            'editor.organization.sort
            'author.organization.sort
        if$
        }
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$ 'sort.label :=
  sort.label *
  #1 entry.max$ substring$ 'sort.key$ :=
}


ITERATE {presort}

SORT

INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'j :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
%  cite$ "  " * extra.label * " label=" * label * top$
}

FUNCTION {reverse.pass}
{ j "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'j :=
  label extra.label * 'label :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=

  "settings" type$ =
    {"aaa"}
    {"unsort" is.in.list
      {"bb"}
      {"alpha" is.in.list
        {sort.key$}
        {sort.label}
        if$  
       }
     if$
    }
    if$
  'sort.key$ :=  
}

ITERATE {bib.sort.order}

SORT

FUNCTION {write.preambule}
{ "\begin{thebibliography}{" number.label int.to.str$ * "}" * write$ newline$
  "% BibTex style file: spr-mp-sola.bst (nameyear), 2015-03-09" write$ newline$
  "\ifx\bisbn     \undefined \def\bisbn  #1{ISBN #1}\fi" write$ newline$
  "\ifx\binits    \undefined \def\binits#1{#1}\fi" write$ newline$
  "\ifx\bauthor   \undefined \def\bauthor#1{#1}\fi" write$ newline$
  "\ifx\batitle   \undefined \def\batitle#1{#1}\fi" write$ newline$
  "\ifx\bjtitle   \undefined \def\bjtitle#1{\textit{#1}}\fi" write$ newline$
  "\ifx\bvolume   \undefined \def\bvolume#1{\textbf{#1}}\fi" write$ newline$
  "\ifx\byear     \undefined \def\byear#1{#1}\fi" write$ newline$
  "\ifx\bissue    \undefined \def\bissue#1{#1}\fi" write$ newline$
  "\ifx\bfpage    \undefined \def\bfpage#1{#1}\fi" write$ newline$
  "\ifx\blpage    \undefined \def\blpage #1{#1}\fi" write$ newline$
  "\ifx\burl      \undefined \def\burl#1{\textsf{#1}}\fi" write$ newline$
  "\ifx\href      \undefined \def\href#1#2{\textsf{#2}}\fi" write$ newline$
  "\ifx\betal     \undefined \def\betal{\textit{et al.}}\fi" write$ newline$
  "\ifx\bctitle   \undefined \def\bctitle#1{#1}\fi" write$ newline$
  "\ifx\beditor   \undefined \def\beditor#1{#1}\fi" write$ newline$
  "\ifx\bbtitle   \undefined \def\bbtitle#1{\textit{#1}}\fi" write$ newline$
  "\ifx\bedition  \undefined \def\bedition#1{#1}\fi" write$ newline$
  "\ifx\bseriesno \undefined \def\bseriesno#1{\textbf{#1}}\fi" write$ newline$
  "\ifx\blocation \undefined \def\blocation#1{#1}\fi" write$ newline$
  "\ifx\bsertitle \undefined \def\bsertitle#1{\textit{#1}}\fi" write$ newline$
  "\ifx\bsnm      \undefined \def\bsnm#1{#1}\fi" write$ newline$
  "\ifx\bsuffix   \undefined \def\bsuffix#1{#1}\fi" write$ newline$
  "\ifx\bparticle \undefined \def\bparticle#1{#1}\fi" write$ newline$
  "\ifx\barticle  \undefined \def\barticle#1{}\fi" write$ newline$
  "\ifx\binstitute  \undefined \def\binstitute#1{#1}\fi" write$ newline$
  "\ifx\bpublisher  \undefined \def\bpublisher#1{#1}\fi" write$ newline$
}


FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  write.preambule
  "\ifx\doiurl    \undefined \def\doiurl#1{\href{http://dx.doi.org/#1}{\textsf{DOI}}}\fi" write$ newline$
  "\ifx\arxivurl  \undefined \def\arxivurl#1{\href{http://arxiv.org/abs/#1}{\textsf{arXiv}}}\fi" write$ newline$
  "\ifx\adsurl    \undefined \def\adsurl#1{\href{http://adsabs.harvard.edu/abs/#1}{\textsf{ADS}}}\fi" write$ newline$
  "\ifx\botherref \undefined \def\botherref#1{}\fi" write$ newline$
  "\ifx\url       \undefined \def\url#1{\textsf{#1}}\fi" write$ newline$
  "\ifx\bchapter  \undefined \def\bchapter#1{}\fi" write$ newline$
  "\ifx\bbook     \undefined \def\bbook#1{}\fi" write$ newline$
  "\ifx\bcomment  \undefined \def\bcomment#1{#1}\fi" write$ newline$
  "\ifx\oauthor   \undefined \def\oauthor#1{#1}\fi" write$ newline$
  "\ifx\citeauthoryear \undefined\def \citeauthoryear#1{#1}\fi" write$ newline$
  "\ifx\endbibitem\undefined \def\endbibitem{}\fi" write$ newline$
  "\ifx\bconflocation  \undefined \def\bconflocation#1{#1} \fi" write$ newline$
}
EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
 "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}




