function CreateObs(template_name, file_name, tag)
    local current_directory = vim.fn.getcwd()

    local template_path =
    "/Users/rahulnavneeth/Library/Mobile Documents/iCloud~md~obsidian/Documents/rahulnavneeth's obsidian/Templates/"
    local template_file = template_path .. template_name .. '.md'
    local filename = vim.fn.expand(template_file)

    if vim.fn.filereadable(template_file) == 0 then
        print("Error: Template file does not exist!")
        return
    end

    vim.cmd(':lcd %:p:h')

    local message = string.format(
        "---\nid: %s\naliases:\n  - %s\ntags:\n  - %s\n---",
        vim.fn.fnamemodify(file_name, ':t:r'),
        tag or "default_tag",
        tag or "default_tag"
    )

    local existing_content = vim.fn.join(vim.fn.readfile(filename), '\n')

    local new_content = message .. "\n" .. existing_content

    vim.fn.writefile(vim.fn.split(new_content, '\n'), file_name)

    vim.cmd(':e ' .. file_name)

    vim.cmd(':normal! ' .. 8 .. 'G')

    vim.cmd(':lcd ' .. current_directory)
end

vim.cmd('command! -nargs=* -complete=customlist,CreateObsComplete Obs lua CreateObs(<f-args>)')

function CreateObsComplete(ArgLead, CmdLine, CursorPos)
    return { "template1", "template2", "template3" }
end
