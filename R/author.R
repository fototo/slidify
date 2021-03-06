#' Author a slide deck
#' 
#' This function creates a slide directory, initializes it as a git repo and
#' opens index.Rmd for users to edit.
#' @param deckdir path to new slide directory
#' @export
author <- function(deckdir){
  message('Creating slide directory at ', deckdir, '...')
  if (file.exists(deckdir)){
  	return('Directory already exists. Please choose a different name.')
  }
  scaffold = system.file('skeleton', package = 'slidify')
  copy_dir(scaffold, deckdir)
  message('Finished creating slide directory...')
  message('Switching to slide directory...')
  setwd(deckdir)
  if (Sys.which('git') != ""){
  	init_repo()
  }
  message('Opening slide deck...')
  file.edit('index.Rmd')
}

#' Initialize a git repository, create and switch to gh-pages branch.
#' 
#' @keywords internal
#' @noRd
init_repo <- function(){
	message('Initializing Git Repo')
	system("git init")
	system("git commit --allow-empty -m 'Initial Commit'")
	message("Checking out gh-pages branch...")
	system('git checkout -b gh-pages')
	message('Adding .nojekyll to repo')
	file.create('.nojekyll')
}