Plug 'vimwiki/vimwiki'

let g:vimwiki_global_ext = 0

let wiki_1 = {}
let wiki_1.path = '~/documents/vimwiki/'
let wiki_1.path_html = '~/documents/vimwiki_html/'
let wiki_1.nested_syntaxes = {'python': 'python', 'css': 'css', 'rust': 'rust'}

let g:vimwiki_list = [wiki_1]
