let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>allmlXmlV ="&#".getchar().";"
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
nnoremap  :BufExplorer
nnoremap  :FuzzyFinderTextMate
snoremap 	 iu=NERDSnippets_SwitchRegion(0)
nnoremap 	 iu=NERDSnippets_SwitchRegion(0)
nnoremap  :nohls
vmap <silent> ,e <Plug>CamelCaseMotion_e
vmap <silent> ,b <Plug>CamelCaseMotion_b
vmap <silent> ,w <Plug>CamelCaseMotion_w
omap <silent> ,e <Plug>CamelCaseMotion_e
omap <silent> ,b <Plug>CamelCaseMotion_b
omap <silent> ,w <Plug>CamelCaseMotion_w
nmap <silent> ,e <Plug>CamelCaseMotion_e
nmap <silent> ,b <Plug>CamelCaseMotion_b
nmap <silent> ,w <Plug>CamelCaseMotion_w
nmap ,ca <Plug>NERDCommenterAltDelims
vmap ,cA <Plug>NERDCommenterAppend
nmap ,cA <Plug>NERDCommenterAppend
vmap ,c$ <Plug>NERDCommenterToEOL
nmap ,c$ <Plug>NERDCommenterToEOL
vmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
vmap ,cn <Plug>NERDCommenterNest
nmap ,cn <Plug>NERDCommenterNest
vmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
vmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
vmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
vmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
vmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
vmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
vmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
vmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
inoremap ï o
noremap Q gq
xmap S <Plug>VSurround
nnoremap Y y$
vmap [% [%m'gv``
nmap <silent> \be :BufExplorer
nmap <silent> \p :NERDTreeToggle
vmap ]% ]%m'gv``
vmap a% [%v]%
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
vmap <silent> i,e <Plug>CamelCaseMotion_ie
vmap <silent> i,b <Plug>CamelCaseMotion_ib
vmap <silent> i,w <Plug>CamelCaseMotion_iw
omap <silent> i,e <Plug>CamelCaseMotion_ie
omap <silent> i,b <Plug>CamelCaseMotion_ib
omap <silent> i,w <Plug>CamelCaseMotion_iw
xmap s <Plug>Vsurround
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap 	 =NERDSnippets_ExpandSnippet()u=NERDSnippets_SwitchRegion(1)
inoremap  :nohls
imap  <Plug>DiscretionaryEnd
imap  <Plug>Isurround
imap  <Plug>AlwaysEnd
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set completefunc=syntaxcomplete#Complete
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=es
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:\ \ ,extends:>,precedes:<
set mouse=a
set scrolloff=3
set shiftwidth=2
set showcmd
set sidescroll=1
set sidescrolloff=7
set softtabstop=2
set statusline=%f%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*%h%y%r%m%#error#%{StatuslineTabWarning()}%*%{StatuslineTrailingSpaceWarning()}%#error#%{&paste?'[paste]':''}%*%=%{StatuslineCurrentHighlight()}\ \ %c,%l/%L\ %P
set termencoding=utf-8
set wildignore=*.o,*.obj,*~
set wildmenu
set wildmode=list:longest
set window=36
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/ruby/almacen
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +238 app/models/solicitud.rb
badd +0 app/controllers/solicitudes_controller.rb
silent! argdel *
edit app/controllers/solicitudes_controller.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 64 + 77) / 154)
exe 'vert 2resize ' . ((&columns * 89 + 77) / 154)
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nmap <buffer> [f <Plug>RailsAlternate
nmap <buffer> ]f <Plug>RailsRelated
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> <Plug>RailsTabFind :RTfind
nnoremap <buffer> <silent> <Plug>RailsVSplitFind :RVfind
nnoremap <buffer> <silent> <Plug>RailsSplitFind :RSfind
nnoremap <buffer> <silent> <Plug>RailsFind :REfind
nnoremap <buffer> <silent> <Plug>RailsRelated :R
nnoremap <buffer> <silent> <Plug>RailsAlternate :A
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=syntaxcomplete#Complete
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%D(in\\\ %f),%A\\\ %\\\\+%\\\\d%\\\\+)\\\ Failure:,%A\\\ %\\\\+%\\\\d%\\\\+)\\\ Error:,%+A'%.%#'\\\ FAILED,%C%.%#(eval)%.%#,%C-e:%.%#,%C%.%#/lib/gems/%\\\\d.%\\\\d/gems/%.%#,%C%.%#/lib/ruby/%\\\\d.%\\\\d/%.%#,%C%.%#/vendor/rails/%.%#,%C\\\ %\\\\+On\\\ line\\\ #%l\\\ of\\\ %f,%CActionView::TemplateError:\\\ compile\\\ error,%Ctest_%.%#(%.%#):%#,%C%.%#\\\ [%f:%l]:,%C\\\ \\\ \\\ \\\ [%f:%l:%.%#,%C\\\ \\\ \\\ \\\ %f:%l:%.%#,%C\\\ \\\ \\\ \\\ \\\ %f:%l:%.%#]:,%C\\\ \\\ \\\ \\\ \\\ %f:%l:%.%#,%Z%f:%l:\\\ %#%m,%Z%f:%l:,%C%m,%.%#.rb:%\\\\d%\\\\+:in\\\ `load':\\\ %f:%l:\\\ syntax\\\ error\\\\\\,\ %m,%.%#.rb:%\\\\d%\\\\+:in\\\ `load':\\\ %f:%l:\\\ %m,%.%#:in\\\ `require':in\\\ `require':\\\ %f:%l:\\\ syntax\\\ error\\\\\\,\ %m,%.%#:in\\\ `require':in\\\ `require':\\\ %f:%l:\\\ %m,%-G%.%#/lib/gems/%\\\\d.%\\\\d/gems/%.%#,%-G%.%#/lib/ruby/%\\\\d.%\\\\d/%.%#,%-G%.%#/vendor/rails/%.%#,%-G%.%#%\\\\d%\\\\d:%\\\\d%\\\\d:%\\\\d%\\\\d%.%#,%-G%\\\\s%#from\\\ %.%#,%f:%l:\\\ %#%m,%-G%.%#
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=3
setlocal foldnestmax=3
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
set linebreak
setlocal linebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=rake
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,~/dev/ruby/almacen,~/dev/ruby/almacen/app,~/dev/ruby/almacen/app/models,~/dev/ruby/almacen/app/controllers,~/dev/ruby/almacen/app/helpers,~/dev/ruby/almacen/config,~/dev/ruby/almacen/lib,~/dev/ruby/almacen/app/views,~/dev/ruby/almacen/app/views/solicitudes,~/dev/ruby/almacen/public,~/dev/ruby/almacen/test,~/dev/ruby/almacen/test/unit,~/dev/ruby/almacen/test/functional,~/dev/ruby/almacen/test/integration,~/dev/ruby/almacen/spec,~/dev/ruby/almacen/spec/models,~/dev/ruby/almacen/spec/controllers,~/dev/ruby/almacen/spec/helpers,~/dev/ruby/almacen/spec/views,~/dev/ruby/almacen/spec/lib,~/dev/ruby/almacen/app/*,~/dev/ruby/almacen/vendor,~/dev/ruby/almacen/vendor/plugins/*/lib,~/dev/ruby/almacen/vendor/plugins/*/test,~/dev/ruby/almacen/vendor/rails/*/lib,~/dev/ruby/almacen/vendor/rails/*/test,/usr/local/lib/site_ruby/1.8,/usr/local/lib/site_ruby/1.8/i486-linux,/usr/local/lib/site_ruby/1.8/i386-linux,/usr/local/lib/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i486-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i486-linux,/usr/lib/ruby/1.8/i386-linux,,/usr/lib/ruby/gems/1.8/gems/GData-0.0.4/lib,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/ext,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/lib,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/lib/case_sensitive_require,/usr/lib/ruby/gems/1.8/gems/Selenium-1.1.14/lib,/usr/lib/ruby/gems/1.8/gems/ZenTest-4.1.4/lib,/usr/lib/ruby/gems/1.8/gems/abstract-1.0.0/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/acts_as_reportable-1.1.1/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.1.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/authlogic-2.1.1/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-authlogic-2.1.1/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-searchlogic-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-searchlogic-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/capistrano-2.5.8/lib,/usr/lib/ruby/gems/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,/usr/lib/ruby/gems/1.8/gems/color-1.4.0/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.0/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.1/lib,/usr/lib/ruby/gems/1.8/gems/commonwatir-1.6.2/lib,/usr/lib/ruby/gems/1.8/gems/configuration-0.0.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.100/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.94/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.96/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.98/lib,/usr/lib/ruby/gems/1.8/gems/daemons-1.0.10/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/derailed-ziya-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/derailed-ziya-2.1.4/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%f%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*%h%y%{RailsStatusline()}%r%m%#error#%{StatuslineTabWarning()}%*%{StatuslineTrailingSpaceWarning()}%#error#%{&paste?'[paste]':''}%*%=%{StatuslineCurrentHighlight()}\ \ %c,%l/%L\ %P
setlocal suffixesadd=.rb,.rhtml,.erb,.rxml,.builder,.rjs,.mab,.liquid,.haml,.dryml,.mn,.yml,.csv,.rake,s.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=8
setlocal tags=~/dev/ruby/almacen/tmp/tags,./tags,./TAGS,tags,TAGS,~/dev/ruby/almacen/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 128 - ((23 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
128
normal! 04l
wincmd w
argglobal
edit app/models/solicitud.rb
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nmap <buffer> [f <Plug>RailsAlternate
nmap <buffer> ]f <Plug>RailsRelated
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> <Plug>RailsTabFind :RTfind
nnoremap <buffer> <silent> <Plug>RailsVSplitFind :RVfind
nnoremap <buffer> <silent> <Plug>RailsSplitFind :RSfind
nnoremap <buffer> <silent> <Plug>RailsFind :REfind
nnoremap <buffer> <silent> <Plug>RailsRelated :R
nnoremap <buffer> <silent> <Plug>RailsAlternate :A
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=syntaxcomplete#Complete
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%D(in\\\ %f),%A\\\ %\\\\+%\\\\d%\\\\+)\\\ Failure:,%A\\\ %\\\\+%\\\\d%\\\\+)\\\ Error:,%+A'%.%#'\\\ FAILED,%C%.%#(eval)%.%#,%C-e:%.%#,%C%.%#/lib/gems/%\\\\d.%\\\\d/gems/%.%#,%C%.%#/lib/ruby/%\\\\d.%\\\\d/%.%#,%C%.%#/vendor/rails/%.%#,%C\\\ %\\\\+On\\\ line\\\ #%l\\\ of\\\ %f,%CActionView::TemplateError:\\\ compile\\\ error,%Ctest_%.%#(%.%#):%#,%C%.%#\\\ [%f:%l]:,%C\\\ \\\ \\\ \\\ [%f:%l:%.%#,%C\\\ \\\ \\\ \\\ %f:%l:%.%#,%C\\\ \\\ \\\ \\\ \\\ %f:%l:%.%#]:,%C\\\ \\\ \\\ \\\ \\\ %f:%l:%.%#,%Z%f:%l:\\\ %#%m,%Z%f:%l:,%C%m,%.%#.rb:%\\\\d%\\\\+:in\\\ `load':\\\ %f:%l:\\\ syntax\\\ error\\\\\\,\ %m,%.%#.rb:%\\\\d%\\\\+:in\\\ `load':\\\ %f:%l:\\\ %m,%.%#:in\\\ `require':in\\\ `require':\\\ %f:%l:\\\ syntax\\\ error\\\\\\,\ %m,%.%#:in\\\ `require':in\\\ `require':\\\ %f:%l:\\\ %m,%-G%.%#/lib/gems/%\\\\d.%\\\\d/gems/%.%#,%-G%.%#/lib/ruby/%\\\\d.%\\\\d/%.%#,%-G%.%#/vendor/rails/%.%#,%-G%.%#%\\\\d%\\\\d:%\\\\d%\\\\d:%\\\\d%\\\\d%.%#,%-G%\\\\s%#from\\\ %.%#,%f:%l:\\\ %#%m,%-G%.%#
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=3
setlocal foldnestmax=3
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
set linebreak
setlocal linebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=rake
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,~/dev/ruby/almacen,~/dev/ruby/almacen/app,~/dev/ruby/almacen/app/models,~/dev/ruby/almacen/app/controllers,~/dev/ruby/almacen/app/helpers,~/dev/ruby/almacen/config,~/dev/ruby/almacen/lib,~/dev/ruby/almacen/app/views,~/dev/ruby/almacen/test,~/dev/ruby/almacen/test/unit,~/dev/ruby/almacen/test/functional,~/dev/ruby/almacen/test/integration,~/dev/ruby/almacen/spec,~/dev/ruby/almacen/spec/models,~/dev/ruby/almacen/spec/controllers,~/dev/ruby/almacen/spec/helpers,~/dev/ruby/almacen/spec/views,~/dev/ruby/almacen/spec/lib,~/dev/ruby/almacen/app/*,~/dev/ruby/almacen/vendor,~/dev/ruby/almacen/vendor/plugins/*/lib,~/dev/ruby/almacen/vendor/plugins/*/test,~/dev/ruby/almacen/vendor/rails/*/lib,~/dev/ruby/almacen/vendor/rails/*/test,/usr/local/lib/site_ruby/1.8,/usr/local/lib/site_ruby/1.8/i486-linux,/usr/local/lib/site_ruby/1.8/i386-linux,/usr/local/lib/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i486-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i486-linux,/usr/lib/ruby/1.8/i386-linux,,/usr/lib/ruby/gems/1.8/gems/GData-0.0.4/lib,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/ext,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/lib,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/lib/case_sensitive_require,/usr/lib/ruby/gems/1.8/gems/Selenium-1.1.14/lib,/usr/lib/ruby/gems/1.8/gems/ZenTest-4.1.4/lib,/usr/lib/ruby/gems/1.8/gems/abstract-1.0.0/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/acts_as_reportable-1.1.1/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.1.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/authlogic-2.1.1/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-authlogic-2.1.1/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-searchlogic-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-searchlogic-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/capistrano-2.5.8/lib,/usr/lib/ruby/gems/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,/usr/lib/ruby/gems/1.8/gems/color-1.4.0/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.0/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.1/lib,/usr/lib/ruby/gems/1.8/gems/commonwatir-1.6.2/lib,/usr/lib/ruby/gems/1.8/gems/configuration-0.0.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.100/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.94/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.96/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.98/lib,/usr/lib/ruby/gems/1.8/gems/daemons-1.0.10/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/derailed-ziya-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/derailed-ziya-2.1.4/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/dm-aggregates-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-cli-0
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%f%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*%h%y%{RailsStatusline()}%r%m%#error#%{StatuslineTabWarning()}%*%{StatuslineTrailingSpaceWarning()}%#error#%{&paste?'[paste]':''}%*%=%{StatuslineCurrentHighlight()}\ \ %c,%l/%L\ %P
setlocal suffixesadd=.rb,.rhtml,.erb,.rxml,.builder,.rjs,.mab,.liquid,.haml,.dryml,.mn,.yml,.csv,.rake,s.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=8
setlocal tags=~/dev/ruby/almacen/tmp/tags,./tags,./TAGS,tags,TAGS,~/dev/ruby/almacen/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 238 - ((17 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
238
normal! 027l
wincmd w
exe 'vert 1resize ' . ((&columns * 64 + 77) / 154)
exe 'vert 2resize ' . ((&columns * 89 + 77) / 154)
tabedit app/models/solicitud.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nmap <buffer> [f <Plug>RailsAlternate
nmap <buffer> ]f <Plug>RailsRelated
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> <Plug>RailsTabFind :RTfind
nnoremap <buffer> <silent> <Plug>RailsVSplitFind :RVfind
nnoremap <buffer> <silent> <Plug>RailsSplitFind :RSfind
nnoremap <buffer> <silent> <Plug>RailsFind :REfind
nnoremap <buffer> <silent> <Plug>RailsRelated :R
nnoremap <buffer> <silent> <Plug>RailsAlternate :A
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=syntaxcomplete#Complete
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%D(in\\\ %f),%A\\\ %\\\\+%\\\\d%\\\\+)\\\ Failure:,%A\\\ %\\\\+%\\\\d%\\\\+)\\\ Error:,%+A'%.%#'\\\ FAILED,%C%.%#(eval)%.%#,%C-e:%.%#,%C%.%#/lib/gems/%\\\\d.%\\\\d/gems/%.%#,%C%.%#/lib/ruby/%\\\\d.%\\\\d/%.%#,%C%.%#/vendor/rails/%.%#,%C\\\ %\\\\+On\\\ line\\\ #%l\\\ of\\\ %f,%CActionView::TemplateError:\\\ compile\\\ error,%Ctest_%.%#(%.%#):%#,%C%.%#\\\ [%f:%l]:,%C\\\ \\\ \\\ \\\ [%f:%l:%.%#,%C\\\ \\\ \\\ \\\ %f:%l:%.%#,%C\\\ \\\ \\\ \\\ \\\ %f:%l:%.%#]:,%C\\\ \\\ \\\ \\\ \\\ %f:%l:%.%#,%Z%f:%l:\\\ %#%m,%Z%f:%l:,%C%m,%.%#.rb:%\\\\d%\\\\+:in\\\ `load':\\\ %f:%l:\\\ syntax\\\ error\\\\\\,\ %m,%.%#.rb:%\\\\d%\\\\+:in\\\ `load':\\\ %f:%l:\\\ %m,%.%#:in\\\ `require':in\\\ `require':\\\ %f:%l:\\\ syntax\\\ error\\\\\\,\ %m,%.%#:in\\\ `require':in\\\ `require':\\\ %f:%l:\\\ %m,%-G%.%#/lib/gems/%\\\\d.%\\\\d/gems/%.%#,%-G%.%#/lib/ruby/%\\\\d.%\\\\d/%.%#,%-G%.%#/vendor/rails/%.%#,%-G%.%#%\\\\d%\\\\d:%\\\\d%\\\\d:%\\\\d%\\\\d%.%#,%-G%\\\\s%#from\\\ %.%#,%f:%l:\\\ %#%m,%-G%.%#
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=3
setlocal foldnestmax=3
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
set linebreak
setlocal linebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=rake
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,~/dev/ruby/almacen,~/dev/ruby/almacen/app,~/dev/ruby/almacen/app/models,~/dev/ruby/almacen/app/controllers,~/dev/ruby/almacen/app/helpers,~/dev/ruby/almacen/config,~/dev/ruby/almacen/lib,~/dev/ruby/almacen/app/views,~/dev/ruby/almacen/test,~/dev/ruby/almacen/test/unit,~/dev/ruby/almacen/test/functional,~/dev/ruby/almacen/test/integration,~/dev/ruby/almacen/spec,~/dev/ruby/almacen/spec/models,~/dev/ruby/almacen/spec/controllers,~/dev/ruby/almacen/spec/helpers,~/dev/ruby/almacen/spec/views,~/dev/ruby/almacen/spec/lib,~/dev/ruby/almacen/app/*,~/dev/ruby/almacen/vendor,~/dev/ruby/almacen/vendor/plugins/*/lib,~/dev/ruby/almacen/vendor/plugins/*/test,~/dev/ruby/almacen/vendor/rails/*/lib,~/dev/ruby/almacen/vendor/rails/*/test,/usr/local/lib/site_ruby/1.8,/usr/local/lib/site_ruby/1.8/i486-linux,/usr/local/lib/site_ruby/1.8/i386-linux,/usr/local/lib/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/i486-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/i486-linux,/usr/lib/ruby/1.8/i386-linux,,/usr/lib/ruby/gems/1.8/gems/GData-0.0.4/lib,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/ext,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/lib,/usr/lib/ruby/gems/1.8/gems/RedCloth-4.2.2/lib/case_sensitive_require,/usr/lib/ruby/gems/1.8/gems/Selenium-1.1.14/lib,/usr/lib/ruby/gems/1.8/gems/ZenTest-4.1.4/lib,/usr/lib/ruby/gems/1.8/gems/abstract-1.0.0/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionmailer-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/actionpack-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activeresource-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/activesupport-2.3.4/lib,/usr/lib/ruby/gems/1.8/gems/acts_as_reportable-1.1.1/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/addressable-2.1.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/authlogic-2.1.1/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-authlogic-2.1.1/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-searchlogic-2.3.2/lib,/usr/lib/ruby/gems/1.8/gems/binarylogic-searchlogic-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/capistrano-2.5.8/lib,/usr/lib/ruby/gems/1.8/gems/cgi_multipart_eof_fix-2.5.0/lib,/usr/lib/ruby/gems/1.8/gems/color-1.4.0/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.0/lib,/usr/lib/ruby/gems/1.8/gems/columnize-0.3.1/lib,/usr/lib/ruby/gems/1.8/gems/commonwatir-1.6.2/lib,/usr/lib/ruby/gems/1.8/gems/configuration-0.0.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.100/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.94/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.96/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.3.98/lib,/usr/lib/ruby/gems/1.8/gems/daemons-1.0.10/lib,/usr/lib/ruby/gems/1.8/gems/data_objects-0.9.12/lib,/usr/lib/ruby/gems/1.8/gems/datamapper-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/derailed-ziya-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/derailed-ziya-2.1.4/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/dm-aggregates-0.9.11/lib,/usr/lib/ruby/gems/1.8/gems/dm-cli-0
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%f%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*%h%y%{RailsStatusline()}%r%m%#error#%{StatuslineTabWarning()}%*%{StatuslineTrailingSpaceWarning()}%#error#%{&paste?'[paste]':''}%*%=%{StatuslineCurrentHighlight()}\ \ %c,%l/%L\ %P
setlocal suffixesadd=.rb,.rhtml,.erb,.rxml,.builder,.rjs,.mab,.liquid,.haml,.dryml,.mn,.yml,.csv,.rake,s.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=8
setlocal tags=~/dev/ruby/almacen/tmp/tags,./tags,./TAGS,tags,TAGS,~/dev/ruby/almacen/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 238 - ((17 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
238
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
