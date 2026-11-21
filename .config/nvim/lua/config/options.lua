vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.foldlevelstart = 20
vim.opt.showmode = false

vim.filetype.add({
	extension = {
		notes 	= "markdown",
		tofu 	= "terraform",
		tf 	= "terraform",
		gotmpl = "gotmpl",
	},
	filename = {
		Containerfile 		= "dockerfile",
		["compose.yaml"] 	= "yaml.docker-compose",
		["compose.yml"] 	= "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["docker-compose.yml"] 	= "yaml.docker-compose",
		
	},
})

vim.g.sonokai_style = "default"
vim.g.sonokai_better_performance = 1
