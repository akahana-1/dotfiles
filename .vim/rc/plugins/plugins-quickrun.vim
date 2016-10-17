" Quickrun Settings
let g:quickrun_config ={
\	  "_" :{
\		"runner" : "vimproc",
\		"runner/vimproc/updatetime" : 60
\	  },
\}
let g:quickrun_config.cpp = {
\	"cmdopt" : "--std=c++11",
\	"watchdogs_checker/_" : {
\		'outputter/quickfix/open_cmd' : '',
\		'hook/close_quickfix/enable_exit' : 1,
\	},
\}
let g:quickrun_config.python = {
\	"command" : "python3",
\}
