# notes.vim

Super simple plugin to manage notes in plain text. Inspired by https://github.com/alok/notational-fzf-vim

## Usage

	" New file
	:NotesNew

	" New file with todays date as filename (.md)
	:NotesDaily

	" Search in notes
	:NotesSearch

	" Search for files in notes folder
	:NotesFiles

## Settings

Set path to notes folder

	let g:notes_path = '~/.notes'

Set daily note file extension. Default: .md

	let g:notes_daily_extension = '.md'

## Installation

	Plug 'fredrik01/notes.vim'

## Dependencies

* rg
* fzf
* fzf.vim

